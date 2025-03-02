# .dotfiles

This repository contains my personal configuration files for various 
applications and tools. It is designed for managing and deploying dotfiles 
using [GNU Stow](https://www.gnu.org/software/stow/), a symlink management 
utility.

## Repository Structure

- Each subdirectory represents a set of configuration files for a specific 
application/tool.
- Ignored directories are customizable and set within the `Makefile` 

## Requirements

- [GNU Stow](https://www.gnu.org/software/stow/) installed on your system.
- A Unix-like environment.

## Usage

Quick Start

```bash
cd $HOME && git clone --recurse-submodules https://github.com/mit-d/.dotfiles && cd .dotfiles && make stow
```

The included `Makefile` provides utility commands, and will install all 
packages that haven't been ignored.

This repository contains submodules. They should be optional, but to
initialize them after cloning run:

```bash
git submodule update --init --recursive
```

To update the submodules later, use:

```bash
git submodule update --recursive --remote
```

