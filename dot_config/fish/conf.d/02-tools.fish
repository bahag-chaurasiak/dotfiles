# =============================================================================
# STANDARDIZED TOOL INITIALIZATION FOR FISH
# =============================================================================

# Initialize Starship prompt if available
if command -v starship > /dev/null
    starship init fish | source
end

# Initialize zoxide if available and create navigation aliases
if command -v zoxide > /dev/null
    zoxide init fish | source
    # Create directory navigation aliases using zoxide
    alias cd='z'
    alias ..='z ..'
    alias ...='z ../..'
    alias ....='z ../../..'
    alias .....='z ../../../..'
    alias ......='z ../../../../..'
end

# FZF integration for Fish - handled by fzf.fish plugin if installed
# Install with: fisher install PatrickF1/fzf.fish
# Key bindings: Ctrl+R (history), Ctrl+Alt+F (files), Ctrl+Alt+L (git log), etc.

# NVM for Fish - using fisher plugin
# Install with: fisher install jorgebucaran/nvm.fish
# This provides a Fish-native nvm implementation

# Ensure NVM path is available for IDEs and current session
if test -d $HOME/.nvm
    # Add current node version to PATH if it exists
    if test -d $HOME/.nvm/versions/node
        set latest_node (ls $HOME/.nvm/versions/node | tail -1)
        if test -n "$latest_node"
            fish_add_path $HOME/.nvm/versions/node/$latest_node/bin
        end
    end
end

# SDKMAN! for Fish - wrapper function for basic functionality
# For full Fish support, install: fisher install reitzig/sdkman-for-fish
if test -d $HOME/.sdkman
    function sdk
        bash -c "source $HOME/.sdkman/bin/sdkman-init.sh && sdk $argv"
    end
end

# Bun completions - Fish will handle these automatically if properly installed

# Carapace completions
if type -q carapace
    carapace _carapace fish | source
end

# Terminal-specific integrations
# Kiro terminal integration
if test "$TERM_PROGRAM" = "kiro"
    if command -v kiro > /dev/null
        kiro --locate-shell-integration-path fish | source
    end
end