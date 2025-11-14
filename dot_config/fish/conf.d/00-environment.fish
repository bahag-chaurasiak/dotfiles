# =============================================================================
# FISH ENVIRONMENT SETUP - Fish-native equivalent of ~/.config/shell/env.sh
# =============================================================================

# =============================================================================
# CORE ENVIRONMENT VARIABLES
# =============================================================================

# Locale settings for proper UTF-8/Unicode support
set -gx LANG en_US.UTF-8
set -gx LC_ALL en_US.UTF-8
set -gx LC_CTYPE en_US.UTF-8

# Core tools
set -gx EDITOR /opt/homebrew/bin/nvim
set -gx GPG_TTY (tty)

# =============================================================================
# PATH SETUP
# =============================================================================

# Homebrew PATH setup (must be first)
fish_add_path -p /opt/homebrew/bin
fish_add_path -p /opt/homebrew/sbin

# Local binaries
fish_add_path ~/.local/bin

# Rust/Cargo
fish_add_path ~/.cargo/bin

# pnpm
if test -d ~/Library/pnpm
    set -gx PNPM_HOME ~/Library/pnpm
    fish_add_path $PNPM_HOME
end

# Bun
if test -d ~/.bun
    set -gx BUN_INSTALL ~/.bun
    fish_add_path $BUN_INSTALL/bin
end

# Flutter
if test -d ~/Downloads/flutter
    fish_add_path ~/Downloads/flutter/bin
end

# Dart pub cache
if test -d ~/.pub-cache
    fish_add_path ~/.pub-cache/bin
end

# Windsurf (Codeium)
if test -d ~/.codeium/windsurf
    fish_add_path ~/.codeium/windsurf/bin
end

# LM Studio
if test -d ~/.cache/lm-studio
    fish_add_path ~/.cache/lm-studio/bin
end

# Python 3.13 Framework
if test -d /Library/Frameworks/Python.framework/Versions/3.13/bin
    fish_add_path /Library/Frameworks/Python.framework/Versions/3.13/bin
end

# JetBrains Toolbox
if test -d ~/Library/Application\ Support/JetBrains/Toolbox/scripts
    fish_add_path ~/Library/Application\ Support/JetBrains/Toolbox/scripts
end

# =============================================================================
# TOOL-SPECIFIC ENVIRONMENT VARIABLES
# =============================================================================

# FZF configuration with comprehensive exclusions
set -gx FZF_DEFAULT_COMMAND 'fd --type f --follow \
  --exclude .git \
  --exclude node_modules \
  --exclude .cache \
  --exclude /System \
  --exclude /Library \
  --exclude /Applications \
  --exclude /private \
  --exclude /Volumes \
  --exclude /dev \
  --exclude /proc \
  --exclude .terraform \
  --exclude .idea \
  --exclude /sys \
  --exclude /run \
  --exclude /tmp'

# NVM
if test -d ~/.nvm
    set -gx NVM_DIR ~/.nvm
end

# SDKMAN
if test -d ~/.sdkman
    set -gx SDKMAN_DIR ~/.sdkman
end

# Starship prompt configuration
if test -f ~/.config/starship/starship.toml
    set -gx STARSHIP_CONFIG ~/.config/starship/starship.toml
end

# =============================================================================
# ALIASES
# =============================================================================

# =============================================================================
# INITIALIZATION STATUS
# =============================================================================
set -gx UNIFIED_SHELL_ENV_LOADED 1