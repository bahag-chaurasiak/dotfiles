# =============================================================================
# FISH CONFIGURATION - Converted from .zshrc
# =============================================================================

# Disable fish greeting
set -g fish_greeting
#
# This config.fish file provides the same functionality as the original .zshrc:
#
# 1. ENVIRONMENT INITIALIZATION
#    - Locale settings for UTF-8 support
#    - Core environment variables (EDITOR, GPG_TTY)
#    - PATH configurations for various tools
#    - FZF search configuration
#
# 2. ALIASES AND FUNCTIONS
#    - General command aliases
#    - Development tool shortcuts
#    - Directory navigation with zoxide
#    - Enhanced file viewing functions
#    - GCP authentication functions
#    - Environment variable loading function
#
# 3. TOOL-SPECIFIC SETUPS
#    - Starship prompt
#    - FZF fuzzy finder
#    - NVM (Node Version Manager)
#    - Tool completions and integrations
#
# =============================================================================
# ENVIRONMENT INITIALIZATION
# =============================================================================
# Environment variables and PATH setup are handled by ~/.config/fish/conf.d/00-environment.fish

# =============================================================================
# ALIASES AND FUNCTIONS
# =============================================================================
# Universal functions and aliases are handled by conf.d/01-functions.fish

# General aliases
alias cl='clear'
alias la='tree'
alias flu='flutter'

# Development tool aliases
alias dc='docker'
alias tf='terraform'
alias pi='pnpm i'

# Docker aliases
alias dps='docker ps'
alias dpa='docker ps -a'
alias dl='docker ps -l -q'
alias dx='docker exec -it'

# =============================================================================
# CONFIGURATION NOTES
# =============================================================================
# Tool initialization and environment setup are handled by:
# - ~/.config/fish/conf.d/00-environment.fish (environment variables and PATH)
# - ~/.config/fish/conf.d/01-functions.fish (universal functions)
# - ~/.config/fish/conf.d/02-tools.fish (tool initialization)

# Custom aliases specific to this session
alias gsq="git-squash"
