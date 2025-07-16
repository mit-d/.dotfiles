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
STOW_DIRS := $(shell awk '!/^[[:space:]]*\x23/ && NF' $(FLAVOR_FILE) | tr '\n' ' ')

# Main targets
.PHONY: all stow restow delete dry-run list clean help adopt

# Default: list all available packages
all: help

# Stow the directories
stow:
	@echo "Stowing directories: $(STOW_DIRS)"
	mkdir -p "$(TARGET_DIR)/.zsh/completions"
	mkdir -p "$(TARGET_DIR)/.local/share"
	mkdir -p "$(TARGET_DIR)/.local/bin"
	mkdir -p "$(TARGET_DIR)/.config"
	@stow --target "$(TARGET_DIR)" --verbose $(VERBOSITY) $(STOW_DIRS)

# Perform a dry run to see what would be stowed
dry-run:
	@echo "Performing a dry run on directories: $(STOW_DIRS)"
	@stow --no --target "$(TARGET_DIR)" --verbose $(VERBOSITY) $(STOW_DIRS)

# Re-stow directories (repair or update symlinks)
restow:
	@echo "Re-stowing directories: $(STOW_DIRS)"
	@stow --restow --target "$(TARGET_DIR)" --verbose $(VERBOSITY) $(STOW_DIRS)

# Delete stowed symlinks for the directories
delete:
	@echo "Deleting stow symlinks for directories: $(STOW_DIRS)"
	@stow --delete --target "$(TARGET_DIR)" --verbose $(VERBOSITY) $(STOW_DIRS)

# Adopt a file into a stow package
# Usage: make adopt FILE=~/.config/app/config.toml PACKAGE=app
adopt:
ifndef FILE
	$(error FILE is required. Usage: make adopt FILE=~/.config/foo/bar PACKAGE=pkgname)
endif
ifndef PACKAGE
	$(error PACKAGE is required. Usage: make adopt FILE=~/.config/foo/bar PACKAGE=pkgname)
endif
	@FILE_ABS="$$(realpath "$(FILE)")"; \
	TARGET_ABS="$$(realpath "$(TARGET_DIR)")"; \
	if [ ! -e "$$FILE_ABS" ]; then \
		echo "Error: File '$(FILE)' does not exist"; exit 1; \
	fi; \
	if [ -L "$$FILE_ABS" ]; then \
		echo "Error: '$(FILE)' is already a symlink"; exit 1; \
	fi; \
	REL_PATH="$${FILE_ABS#$$TARGET_ABS/}"; \
	if [ "$$REL_PATH" = "$$FILE_ABS" ]; then \
		echo "Error: File must be under $(TARGET_DIR)"; exit 1; \
	fi; \
	DEST_DIR="$(PACKAGE)/$$REL_PATH"; \
	mkdir -p "$$(dirname "$$DEST_DIR")"; \
	mv "$$FILE_ABS" "$$DEST_DIR"; \
	echo "Moved '$$FILE_ABS' -> '$$DEST_DIR'"; \
	stow --target "$(TARGET_DIR)" --verbose $(VERBOSITY) $(PACKAGE); \
	echo "Adopted '$(FILE)' into package '$(PACKAGE)'"

# List detected flavor and stowable directories
list:
	@echo "Detected flavor: $(_FLAVOR) ($(FLAVOR_FILE))"
	@echo ""
	@echo "Packages to stow:"
	@for pkg in $(STOW_DIRS); do echo "  $$pkg"; done
	@echo ""
	@echo "All directories:"
	@for dir in $(wildcard */); do echo "  $$dir"; done

# Clean generated/intermediate files (optional target for extensibility)
clean:
	@echo "No intermediate files to clean."

# Help target to display usage
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
