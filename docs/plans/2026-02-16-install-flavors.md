# Install Flavors Implementation Plan

> **For Claude:** REQUIRED SUB-SKILL: Use superpowers:executing-plans to
> implement this plan task-by-task.

**Goal:** Replace the hardcoded IGNORE_DIRS approach with flavor config files so
`make stow` auto-detects the platform and installs the right package set.

**Architecture:** Flavor `.conf` files in `flavors/` list packages to stow (one
per line, `#` comments). The Makefile auto-detects OS -> flavor name, reads the
file, and feeds the list to `STOW_DIRS`. Explicit `FLAVOR=` override is
supported; unknown OS is a hard error.

**Tech Stack:** GNU Make, GNU Stow, shell (uname, test, grep)

---

## Task 1: Create flavor config files

**Files:**

- Create: `flavors/arch.conf`
- Create: `flavors/osx.conf`

### Step 1: Create `flavors/arch.conf`

This matches what currently gets stowed (everything minus IGNORE_DIRS):

```text
# Arch Linux (Hyprland)
bash
fish
ghostty
git
hypr
mako
mpv
tmux
vim
waybar
xdg
zsh
```

### Step 2: Create `flavors/osx.conf`

Cross-platform packages only (no Wayland/Linux-specific):

```text
# macOS
bash
fish
ghostty
git
mpv
tmux
vim
zsh
```

### Step 3: Commit

```bash
git add flavors/arch.conf flavors/osx.conf
git commit -m "feat: add flavor config files for arch and osx"
```

---

## Task 2: Rewrite Makefile flavor detection and STOW_DIRS

**Files:**

- Modify: `Makefile:1-11` (replace IGNORE_DIRS and STOW_DIRS)

### Step 1: Replace the top of Makefile

Remove lines 1-11 (IGNORE_DIRS, TARGET_DIR, VERBOSITY, STOW_DIRS) and replace
with:

```make
# Target directory for symlinks
TARGET_DIR ?= $(HOME)

# Default verbosity level for stow (1..4)
VERBOSITY ?= 1

# --- Flavor detection ---
# Override with: make stow FLAVOR=osx
ifdef FLAVOR
  _FLAVOR := $(FLAVOR)
else ifeq ($(shell uname -s),Darwin)
  _FLAVOR := osx
else ifeq ($(shell test -f /etc/arch-release && echo yes),yes)
  _FLAVOR := arch
else
  _FLAVOR :=
endif

# Validate flavor
ifeq ($(_FLAVOR),)
  FLAVOR_LIST := $(basename $(notdir $(wildcard flavors/*.conf)))
  $(error Could not detect platform. Set FLAVOR explicitly: $(FLAVOR_LIST))
endif

FLAVOR_FILE := flavors/$(_FLAVOR).conf
ifeq ($(wildcard $(FLAVOR_FILE)),)
  FLAVOR_LIST := $(basename $(notdir $(wildcard flavors/*.conf)))
  $(error Unknown flavor '$(_FLAVOR)'. Available: $(FLAVOR_LIST))
endif

# Read package list from flavor file (strip comments and blank lines)
STOW_DIRS := $(shell grep -v '^\#' $(FLAVOR_FILE) | grep -v '^$$' | tr '\n' ' ')
```

### Step 2: Verify detection works on current system (Arch)

Run: `make dry-run` Expected: Should show the same packages as before (bash fish
ghostty git hypr mako mpv tmux vim waybar xdg zsh)

### Step 3: Verify explicit FLAVOR= works

Run: `make dry-run FLAVOR=osx` Expected: Should show only osx packages (bash
fish ghostty git mpv tmux vim zsh)

### Step 4: Verify unknown flavor errors

Run: `make dry-run FLAVOR=bogus` Expected: Error message listing available
flavors

### Step 5: Commit

```bash
git add Makefile
git commit -m "feat: auto-detect platform flavor for stow"
```

---

## Task 3: Update `list` and `help` targets

**Files:**

- Modify: `Makefile` (list and help targets)

### Step 1: Replace the `list` target

Old `list` showed all dirs, ignored dirs, and stowable dirs. New version shows
detected flavor and its packages:

```make
list:
	@echo "Detected flavor: $(_FLAVOR) ($(FLAVOR_FILE))"
	@echo ""
	@echo "Packages to stow:"
	@for pkg in $(STOW_DIRS); do echo "  $$pkg"; done
	@echo ""
	@echo "All directories:"
	@for dir in $(wildcard */); do echo "  $$dir"; done
```

### Step 2: Update the `help` target

Add FLAVOR= to the options section:

```make
help:
	@echo "Available Commands:"
	@echo "  make list         - List detected flavor and packages."
	@echo "  make stow         - Stow packages for detected flavor."
	@echo "  make restow       - Re-stow packages (update symlinks)."
	@echo "  make delete       - Remove symlinks for stowed packages."
	@echo "  make dry-run      - Perform a dry run without making changes."
	@echo "  make adopt        - Adopt a file into a stow package."
	@echo "  make help         - Show this help message."
	@echo ""
	@echo "Options:"
	@echo "  FLAVOR=<name>     - Override detected platform (available: $(basename $(notdir $(wildcard flavors/*.conf))))."
	@echo "  TARGET_DIR=<dir>  - Specify target directory for symlinks (default: $(HOME))."
	@echo "  VERBOSITY=<level> - Set verbosity level for stow (default: 1)."
	@echo "  FILE=<path>       - File to adopt (for adopt command)."
	@echo "  PACKAGE=<name>    - Target package (for adopt command)."
	@echo ""
	@echo "Examples:"
	@echo "  make stow                                   - Stow packages (auto-detect platform)."
	@echo "  make stow FLAVOR=osx                        - Stow macOS packages."
	@echo "  make stow VERBOSITY=2                       - Stow with increased verbosity."
	@echo "  make adopt FILE=~/.config/app/config PACKAGE=app - Adopt file into package."
```

### Step 3: Verify

Run: `make list` Expected: Shows "Detected flavor: arch" and the arch package
list

Run: `make help` Expected: Shows updated help with FLAVOR= option

### Step 4: Commit

```bash
git add Makefile
git commit -m "feat: update list and help targets for flavors"
```

---

## Task 4: Final verification

### Step 1: Run `make dry-run` (auto-detect)

Expected: Uses arch flavor, lists arch packages, stow dry-run succeeds

### Step 2: Run `make dry-run FLAVOR=osx`

Expected: Uses osx flavor, lists osx packages only

### Step 3: Run `make list`

Expected: Shows detected flavor and package list

### Step 4: Run `make help`

Expected: Shows FLAVOR= option in help text
