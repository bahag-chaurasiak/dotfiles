#!/bin/bash
set -e

echo "🚀 Starting dotfiles setup..."

# Install Homebrew if not present
if ! command -v brew &> /dev/null; then
  echo "📦 Installing Homebrew..."
  /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
  eval "$(/opt/homebrew/bin/brew shellenv)"
else
  echo "✅ Homebrew already installed"
fi

# Install chezmoi if not present
if ! command -v chezmoi &> /dev/null; then
  echo "📦 Installing chezmoi..."
  brew install chezmoi
else
  echo "✅ Chezmoi already installed"
fi

# Initialize chezmoi and apply dotfiles
echo "🔧 Setting up dotfiles with chezmoi..."
chezmoi init --apply bahag-chaurasiak/dotfiles

# Install all Homebrew packages
echo "📦 Installing Homebrew packages (this may take a while)..."
cd ~/.local/share/chezmoi && brew bundle install

# Apply final configurations
echo "✨ Applying final configurations..."
chezmoi apply -v

echo "🎉 Setup complete! Your development environment is ready."
echo "⚠️  You may need to restart your terminal for all changes to take effect."
