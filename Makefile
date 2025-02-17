
# Define ignored directories/packages here (space-separated)
IGNORE_DIRS = dwm/ keyboard/ mpd/ obmenu-gen/ openbox/ picom/ polybar/ termite/ tint2/

# Directories available for stow
stow_dirs := $(filter-out $(IGNORE_DIRS), $(wildcard */))

# Default verbosity level
VERBOSITY ?= 1

.PHONY: stow
stow:
	@echo "Stowing packages: $(stow_dirs)"
	stow --target $(HOME) --verbose $(stow_dirs)

.PHONY: stow-verbose
stow-verbose:
	@echo "Stowing packages with verbosity $(VERBOSITY): $(stow_dirs)"
	stow --verbose $(VERBOSITY) --target $(HOME) $(stow_dirs)

.PHONY: dry-run
dry-run:
	@echo "Dry-run packages: $(stow_dirs)"
	stow --no --target $(HOME) --verbose $(stow_dirs)

.PHONY: restow
restow:
	@echo "Re-stowing packages: $(stow_dirs)"
	stow --target $(HOME) --verbose --restow $(stow_dirs)

# Do this *before* moving to another directory.
.PHONY: delete
delete:
	@echo "Deleting packages: $(stow_dirs)"
	stow --target $(HOME) --verbose --delete $(stow_dirs)

.PHONY: list
list:
	@echo "Available packages: $(wildcard */)"
	@echo "Ignored packages: $(IGNORE_DIRS)"
	@echo "Packages to stow: $(stow_dirs)"
