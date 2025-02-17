
# Define ignored directories/packages here (space-separated)
IGNORE_DIRS = dwm/ keyboard/ mpd/ obmenu-gen/ openbox/ picom/ polybar/ termite/ tint2/

# Directories available for stow
STOW_DIRS := $(filter-out $(IGNORE_DIRS), $(wildcard */))

# Default verbosity level
VERBOSITY ?= 1

.PHONY: stow
stow:
	@echo "Stowing packages: $(STOW_DIRS)"
	stow --target $(HOME) --verbose $(STOW_DIRS)

.PHONY: stow-verbose
stow-verbose:
	@echo "Stowing packages with verbosity $(VERBOSITY): $(STOW_DIRS)"
	stow --verbose $(VERBOSITY) --target $(HOME) $(STOW_DIRS)

.PHONY: dry-run
dry-run:
	@echo "Dry-run packages: $(STOW_DIRS)"
	stow --no --target $(HOME) --verbose $(STOW_DIRS)

.PHONY: restow
restow:
	@echo "Re-stowing packages: $(STOW_DIRS)"
	stow --target $(HOME) --verbose --restow $(STOW_DIRS)

# Do this *before* moving to another directory.
.PHONY: delete
delete:
	@echo "Deleting packages: $(STOW_DIRS)"
	stow --target $(HOME) --verbose --delete $(STOW_DIRS)

.PHONY: list
list:
	@echo "Available packages: $(wildcard */)"
	@echo "Ignored packages: $(IGNORE_DIRS)"
	@echo "Packages to stow: $(STOW_DIRS)"
