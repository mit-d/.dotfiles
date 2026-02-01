# List of ignored directories (space-separated, trailing slash required)
IGNORE_DIRS := dwm/ keyboard/ mpd/ obmenu-gen/ openbox/ picom/ polybar/ termite/ tint2/ tests/

# Target directory for symlinks
TARGET_DIR ?= $(HOME)

# Default verbosity level for stow (1..4)
VERBOSITY ?= 1

# Find all non-ignored directories (dynamically generated)
STOW_DIRS := $(filter-out $(IGNORE_DIRS), $(wildcard */))

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

# List all directories (all, ignored, and stowable)
list:
	@echo "All directories:"; \
	for dir in $(wildcard */); do echo "  $$dir"; done
	@echo "\nIgnored directories:"; \
	for ignore in $(IGNORE_DIRS); do echo "  $$ignore"; done
	@echo "\nDirectories to stow:"; \
	for stow in $(STOW_DIRS); do echo "  $$stow"; done

# Clean generated/intermediate files (optional target for extensibility)
clean:
	@echo "No intermediate files to clean."

# Help target to display usage
help:
	@echo "Available Commands:"
	@echo "  make list         - List all directories (all, ignored, stowable)."
	@echo "  make stow         - Stow all available directories."
	@echo "  make restow       - Re-stow all available directories (update symlinks)."
	@echo "  make delete       - Remove symlinks for all stowed directories."
	@echo "  make dry-run      - Perform a dry run without making any changes."
	@echo "  make adopt        - Adopt a file into a stow package."
	@echo "  make help         - Show this help message."
	@echo ""
	@echo "Options:"
	@echo "  TARGET_DIR=<dir>  - Specify target directory for symlinks (default: $(HOME))."
	@echo "  VERBOSITY=<level> - Set verbosity level for stow (default: 1)."
	@echo "  FILE=<path>       - File to adopt (for adopt command)."
	@echo "  PACKAGE=<name>    - Target package (for adopt command)."
	@echo ""
	@echo "Examples:"
	@echo "  make stow VERBOSITY=2                     - Stow with increased verbosity."
	@echo "  make delete TARGET_DIR=/etc VERBOSITY=1   - Delete symlinks in /etc directory."
	@echo "  make adopt FILE=~/.config/app/config PACKAGE=app - Adopt file into package."

