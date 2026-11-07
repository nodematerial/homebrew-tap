#!/bin/bash
# Check that the formula in this checkout passes audit, installs, and that cch starts.
# Used before the bump commits and on every push, on both macOS and Linux
set -eux

brew tap nodematerial/tap "$PWD"
# Homebrew refuses to load formulae from taps that are not trusted
brew trust nodematerial/tap
brew audit --strict --online nodematerial/tap/cch
brew install nodematerial/tap/cch
brew test nodematerial/tap/cch

# cch checks for Claude Code at launch, so give it a stand-in, and an empty conversation directory
stub=$(mktemp -d)
printf '#!/bin/sh\nexit 0\n' > "$stub/claude"
chmod +x "$stub/claude"
mkdir -p "$stub/config/projects"
PATH="$stub:$PATH" CLAUDE_CONFIG_DIR="$stub/config" CCH_CACHE_DIR="$stub/cache" CCH_LANG=en cch -p
