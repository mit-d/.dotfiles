#!/usr/bin/env bash
# Reads system temps and outputs waybar custom module JSON

read_temp() {
    local file="$1"
    if [[ -r "$file" ]]; then
        awk '{printf "%.0f", $1/1000}' "$file"
    else
        echo "n/a"
    fi
}

read_raw() {
    local file="$1"
    if [[ -r "$file" ]]; then
        cat "$file"
    else
        echo "n/a"
    fi
}

read_pwm_pct() {
    local file="$1"
    if [[ -r "$file" ]]; then
        awk '{printf "%.0f", $1/255*100}' "$file"
    else
        echo "n/a"
    fi
}

# Find hwmon base path by name. Usage: find_hwmon "k10temp"
find_hwmon() {
    for f in /sys/class/hwmon/hwmon*/name; do
        if [[ "$(cat "$f")" == "$1" ]]; then
            echo "${f%name}"
            return
        fi
    done
}

# Find all hwmon base paths matching a name
find_hwmon_all() {
    for f in /sys/class/hwmon/hwmon*/name; do
        if [[ "$(cat "$f")" == "$1" ]]; then
            echo "${f%name}"
        fi
    done
}

# CPU - k10temp (AMD) or coretemp (Intel)
cpu_hwmon=$(find_hwmon "k10temp")
[[ -z "$cpu_hwmon" ]] && cpu_hwmon=$(find_hwmon "coretemp")
cpu_tctl=$(read_temp "${cpu_hwmon}temp1_input")
cpu_ccd1=$(read_temp "${cpu_hwmon}temp3_input")
cpu_ccd2=$(read_temp "${cpu_hwmon}temp4_input")

# GPU (nvidia-smi)
gpu_temp="n/a"
gpu_fan="n/a"
gpu_power="n/a"
gpu_name="n/a"
if command -v nvidia-smi &>/dev/null; then
    IFS=', ' read -r gpu_temp gpu_fan gpu_power gpu_name < <(
        nvidia-smi --query-gpu=temperature.gpu,fan.speed,power.draw,name \
            --format=csv,noheader,nounits 2>/dev/null
    )
    gpu_fan="${gpu_fan:+${gpu_fan}%}"
    gpu_power="${gpu_power:+${gpu_power} W}"
fi

# NVMe
nvme_hwmon=$(find_hwmon "nvme")
nvme=$(read_temp "${nvme_hwmon}temp1_input")

# AIO coolant (NZXT Kraken series)
coolant="n/a"
pump_rpm="n/a"
pump_duty="n/a"
for name in x53 x63 x73 kraken; do
    aio_hwmon=$(find_hwmon "$name")
    if [[ -n "$aio_hwmon" ]]; then
        coolant=$(read_temp "${aio_hwmon}temp1_input")
        pump_rpm=$(read_raw "${aio_hwmon}fan1_input")
        pump_duty=$(read_pwm_pct "${aio_hwmon}pwm1")
        break
    fi
done

# Case fans (nct6687 or common super I/O chips)
fan_speeds=()
fan_hwmon=""
for name in nct6687 nct6775 nct6776 nct6779 nct6791 nct6792 nct6793 nct6795 nct6796 nct6798 it8688 it8689; do
    fan_hwmon=$(find_hwmon "$name")
    [[ -n "$fan_hwmon" ]] && break
done
if [[ -n "$fan_hwmon" ]]; then
    for f in "${fan_hwmon}"fan*_input; do
        [[ -r "$f" ]] || continue
        rpm=$(cat "$f")
        if [[ "$rpm" -gt 0 ]] 2>/dev/null; then
            idx="${f##*fan}"
            idx="${idx%_input}"
            fan_speeds+=("Fan ${idx}:${rpm}")
        fi
    done
fi

# RAM (jc42 DIMM sensors)
dimm_temps=()
while IFS= read -r path; do
    dimm_temps+=("$(read_temp "${path}temp1_input")")
done < <(find_hwmon_all "jc42")

# NIC
nic="n/a"
for f in /sys/class/hwmon/hwmon*/name; do
    case "$(cat "$f")" in r8169* | e1000* | igb* | igc* | ixgbe*)
        nic=$(read_temp "${f%name}temp1_input")
        break
        ;;
    esac
done

# WiFi
wifi="n/a"
for f in /sys/class/hwmon/hwmon*/name; do
    case "$(cat "$f")" in iwlwifi* | ath* | mt76*)
        wifi=$(read_temp "${f%name}temp1_input")
        break
        ;;
    esac
done

# Build tooltip - only show sections with data
tooltip="<b>CPU</b>\\n"
tooltip+="  Tctl:    ${cpu_tctl}°C\\n"
[[ "$cpu_ccd1" != "n/a" ]] && tooltip+="  CCD1:    ${cpu_ccd1}°C\\n"
[[ "$cpu_ccd2" != "n/a" ]] && tooltip+="  CCD2:    ${cpu_ccd2}°C\\n"

if [[ "$gpu_temp" != "n/a" ]]; then
    tooltip+="\\n<b>GPU</b> <small>(${gpu_name})</small>\\n"
    tooltip+="  Temp:    ${gpu_temp}°C\\n"
    [[ "$gpu_fan" != "n/a" ]] && tooltip+="  Fan:     ${gpu_fan}\\n"
    [[ "$gpu_power" != "n/a" ]] && tooltip+="  Power:   ${gpu_power}\\n"
fi

[[ "$nvme" != "n/a" ]] && tooltip+="\\n<b>Storage</b>\\n  NVMe:    ${nvme}°C\\n"

if [[ "$coolant" != "n/a" || "$pump_rpm" != "n/a" || ${#fan_speeds[@]} -gt 0 ]]; then
    tooltip+="\\n<b>Cooling</b>\\n"
    [[ "$coolant" != "n/a" ]] && tooltip+="  Coolant: ${coolant}°C\\n"
    [[ "$pump_rpm" != "n/a" ]] && tooltip+="  Pump:   ${pump_rpm} RPM"
    [[ "$pump_duty" != "n/a" ]] && tooltip+=" (${pump_duty}%)"
    [[ "$pump_rpm" != "n/a" ]] && tooltip+="\\n"
    for entry in "${fan_speeds[@]}"; do
        label="${entry%%:*}"
        rpm="${entry#*:}"
        tooltip+="  ${label}:  ${rpm} RPM\\n"
    done
fi

if [[ ${#dimm_temps[@]} -gt 0 ]]; then
    tooltip+="\\n<b>Memory</b>\\n"
    for i in "${!dimm_temps[@]}"; do
        tooltip+="  DIMM $((i + 1)):  ${dimm_temps[$i]}°C\\n"
    done
fi

has_net=0
net_section=""
[[ "$nic" != "n/a" ]] && net_section+="  NIC:     ${nic}°C\\n" && has_net=1
[[ "$wifi" != "n/a" ]] && net_section+="  WiFi:    ${wifi}°C" && has_net=1
[[ $has_net -eq 1 ]] && tooltip+="\\n<b>Network</b>\\n${net_section}"

# Determine class
class="normal"
if [[ "$cpu_tctl" != "n/a" && "$cpu_tctl" -ge 85 ]]; then
    class="critical"
fi

# Output JSON for waybar
printf '{"text": "%s°C", "tooltip": "%s", "class": "%s"}\n' "$cpu_tctl" "$tooltip" "$class"
