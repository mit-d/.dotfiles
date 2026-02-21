#!/usr/bin/env bash
# Reads memory usage and top processes, outputs waybar custom module JSON

read -r mem_total mem_avail < <(awk '/MemTotal/{t=$2} /MemAvailable/{a=$2} END{print t, a}' /proc/meminfo)
mem_used=$((mem_total - mem_avail))
pct=$((mem_used * 100 / mem_total))

# Convert to GiB
used_g=$(awk "BEGIN{printf \"%.1f\", $mem_used/1048576}")
total_g=$(awk "BEGIN{printf \"%.1f\", $mem_total/1048576}")

# Top 8 processes by RSS (grouped by name)
top_procs=$(ps axo rss,comm --no-headers | awk '{mem[$2]+=$1} END{for(p in mem) printf "%d %s\n", mem[p], p}' | sort -rn | head -8 | awk '{printf "  %-16s %6.0fM\\n", $2, $1/1024}')

tooltip="<b>Memory</b>\\n"
tooltip+="  ${used_g}G / ${total_g}G (${pct}%)\\n"
tooltip+="\\n<b>Top Processes</b>\\n"
tooltip+="${top_procs}"

class="normal"
if [[ $pct -ge 90 ]]; then
    class="critical"
elif [[ $pct -ge 75 ]]; then
    class="warning"
fi

printf '{"text": "%s%%", "tooltip": "%s", "class": "%s"}\n' "$pct" "$tooltip" "$class"
