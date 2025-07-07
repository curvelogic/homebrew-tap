# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## Project Overview

This is a Homebrew tap for Curve Logic tools, specifically `fimbl` and `eucalypt`. The repository contains Formula files that define how to install these tools via Homebrew.

## Architecture

- `Formula/` - Contains Ruby formula files for each tool
  - `eucalypt.rb` - Formula for the Eucalypt YAML/JSON/TOML processing tool
  - `fimbl.rb` - Formula for the file integrity checker tool
- `README.md` - Basic installation instructions for users

## Key Commands

### Testing Formulas
```bash
# Test a specific formula
brew test Formula/eucalypt.rb
brew test Formula/fimbl.rb

# Install locally for testing
brew install --build-from-source Formula/eucalypt.rb
brew install --build-from-source Formula/fimbl.rb
```

### Formula Validation
```bash
# Audit formula for issues
brew audit Formula/eucalypt.rb
brew audit Formula/fimbl.rb

# Style check
brew style Formula/eucalypt.rb
brew style Formula/fimbl.rb
```

### Development Workflow
```bash
# Uninstall for testing updates
brew uninstall eucalypt
brew uninstall fimbl

# Test installation after changes
brew install --build-from-source Formula/eucalypt.rb
```

## Formula Structure

Each formula follows Homebrew's Ruby DSL:
- `eucalypt.rb` - Downloads pre-built binary from GitHub releases
- `fimbl.rb` - Builds from source using Rust/Cargo

## Automated Updates

### Formula Update Script
```bash
# Check for updates and run audit/style checks only
./update-formulas.sh

# Check for updates and run full functional tests (install and test)
./update-formulas.sh --test

# Show help
./update-formulas.sh --help
```

The `update-formulas.sh` script:
- Checks GitHub releases for both eucalypt and fimbl
- Downloads and calculates SHA256 hashes for new versions
- Updates formula files with new version, URL, and SHA256
- Runs brew audit and style checks on updated formulas
- With `--test` flag: installs updated formulas, runs built-in tests, verifies binary functionality, then automatically uninstalls for cleanup
- Only updates formulas when new versions are available

## Important Notes

- Version numbers in formulas must be updated when releasing new versions
- SHA256 hashes must be updated when URLs change
- The `eucalypt` formula uses pre-built binaries while `fimbl` builds from source
- Both formulas include test methods to verify successful installation
- Use the automated update script to ensure consistency when updating formulas