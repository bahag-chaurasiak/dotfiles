# Fish user key bindings - equivalent to zsh key bindings from .zshrc
function fish_user_key_bindings
    # FZF bindings are handled by PatrickF1/fzf.fish plugin
    # Default key bindings:
    # Ctrl+R - search history
    # Ctrl+Alt+F - search files
    # Ctrl+Alt+L - search git log
    # Ctrl+Alt+S - search git status
    # Ctrl+Alt+P - search processes
    
    # Custom navigation bindings (similar to zsh config)
    # Ctrl+K for up in history
    bind \ck up-or-search
    
    # Ctrl+J for down in history  
    bind \cj down-or-search
    
    # Note: Fish autosuggestions work differently than zsh-autosuggestions
    # Right arrow or Ctrl+F accepts suggestion
    # Alt+Right arrow accepts a single word
    # These are built-in to Fish and don't need manual binding
end