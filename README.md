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

The included `Makefile` provides utility commands, and will install all 
packages that haven't been ignored.
