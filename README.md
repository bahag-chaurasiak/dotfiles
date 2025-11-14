# Dotfiles

My personal dotfiles managed with [chezmoi](https://www.chezmoi.io/).

## What's Included

- **Shell configs**: zsh, bash, fish
- **Terminal**: Ghostty, iTerm2  
- **Prompt**: Starship
- **Editor**: Neovim (Lua config)
- **Tools**: tmux, git, nushell, fzf, ripgrep, bat, eza, fd, and more
- **Package management**: Homebrew (Brewfile with 182 formulas + 15 casks)

## 🚀 One-Command Installation on New System

```bash
sh -c "$(curl -fsLS https://raw.githubusercontent.com/bahag-chaurasiak/dotfiles/main/install.sh)"
```

This will:
1. Install Homebrew (if not present)
2. Install chezmoi
3. Clone this dotfiles repo
4. Apply all configuration files
5. Install all Homebrew packages from the Brewfile
6. Run first-time setup scripts

## Manual Installation

If you prefer a manual approach:

```bash
# Install Homebrew
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

# Install chezmoi
brew install chezmoi

# Initialize chezmoi with this repo
chezmoi init bahag-chaurasiak/dotfiles

# Preview what would be changed
chezmoi diff

# Apply the dotfiles
chezmoi apply -v

# Install Homebrew packages
cd ~/.local/share/chezmoi && brew bundle install
```

## Daily Workflows

### Adding new configurations

```bash
# Add a new config file to be managed
chezmoi add ~/.newconfig

# Add a directory
chezmoi add ~/.config/newtool/
```

### Editing managed files

```bash
# Edit a managed file (opens in $EDITOR)
chezmoi edit ~/.zshrc

# See what would change
chezmoi diff

# Apply the changes
chezmoi apply
```

### Syncing changes

```bash
# Pull latest changes from the repo
chezmoi update

# Or manually
cd ~/.local/share/chezmoi
git pull
chezmoi apply
```

### Pushing changes

```bash
# Navigate to chezmoi source directory
cd ~/.local/share/chezmoi

# Commit and push changes
git add .
git commit -m "Update configs"
git push
```

### Updating Brewfile

When you install new packages via Homebrew, update the Brewfile:

```bash
brew bundle dump --file=~/.local/share/chezmoi/Brewfile --force
cd ~/.local/share/chezmoi
git add Brewfile
git commit -m "Update Brewfile"
git push
```

## Chezmoi Commands Cheat Sheet

```bash
# See what files chezmoi manages
chezmoi managed

# Show differences between current state and desired state
chezmoi diff

# Apply changes
chezmoi apply

# Edit config file
chezmoi edit <file>

# Add file to chezmoi
chezmoi add <file>

# Remove file from chezmoi (doesn't delete the file)
chezmoi forget <file>

# Update from remote repo
chezmoi update

# Open chezmoi source directory
chezmoi cd
```

## Customization

The `.chezmoidata.toml` file contains default values for your name and email. These are used in the `.gitconfig` template.

On a new machine, these values will be used automatically. To change them:

```bash
chezmoi edit ~/.local/share/chezmoi/.chezmoidata.toml
```

## Repository Structure

```
~/.local/share/chezmoi/
├── .chezmoi.toml.tmpl          # Chezmoi configuration
├── .chezmoidata.toml            # Default user data
├── .chezmoiscripts/             # Scripts to run on apply
│   └── run_once_10-setup.sh.tmpl
├── Brewfile                     # Homebrew packages
├── install.sh                   # Bootstrap script
├── dot_zshrc                    # ~/.zshrc
├── dot_bashrc                   # ~/.bashrc
├── dot_gitconfig.tmpl           # ~/.gitconfig (templated)
├── dot_tmux.conf                # ~/.tmux.conf
├── dot_config/
│   ├── starship.toml            # Prompt config
│   ├── ghostty/                 # Terminal config
│   ├── nvim/                    # Neovim config
│   ├── fish/                    # Fish shell config
│   └── ...                      # Other tool configs
└── dot_tmux/                    # Tmux plugins
```

## Technologies

- **Dotfiles Manager**: [chezmoi](https://www.chezmoi.io/)
- **Package Manager**: [Homebrew](https://brew.sh/)
- **Shell**: zsh with [Starship](https://starship.rs/) prompt
- **Terminal**: [Ghostty](https://ghostty.org/)
- **Editor**: [Neovim](https://neovim.io/)
- **Multiplexer**: [tmux](https://github.com/tmux/tmux)

## License

MIT
