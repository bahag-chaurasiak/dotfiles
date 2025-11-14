# Git Squash Function for Fish Shell
# Place this file in ~/.config/fish/functions/git-squash.fish

# Check if we're in a git repository
if not git rev-parse --git-dir >/dev/null 2>&1
    echo "Error: Not in a git repository"
    return 1
end

# Check if number of commits is provided
if test (count $argv) -eq 0
    echo "Usage: git-squash <number_of_commits>"
    echo "Example: git-squash 7"
    return 1
end

set COMMIT_COUNT $argv[1]

# Validate input is a number
if not string match -qr '^\d+$' $COMMIT_COUNT
    echo "Error: Please provide a valid number of commits"
    return 1
end

# Check if we have enough commits
set TOTAL_COMMITS (git rev-list --count HEAD)
if test $COMMIT_COUNT -gt $TOTAL_COMMITS
    echo "Error: Cannot squash $COMMIT_COUNT commits, only $TOTAL_COMMITS commits available"
    return 1
end

echo "Squashing last $COMMIT_COUNT commits..."

# Get current branch
set CURRENT_BRANCH (git branch --show-current)

# Get commit messages for the commits we're squashing
echo "Commits to be squashed:"
git log --oneline -n $COMMIT_COUNT

echo ""
read -P "Continue with squashing? (y/N): " -n 1 confirm

if not string match -qi 'y' $confirm
    echo "Aborted."
    return 0
end

# Soft reset to combine commits
git reset --soft HEAD~$COMMIT_COUNT

# Check what files are changed
echo "Files to be committed:"
git status --porcelain --staged

# Prompt for commit message
echo ""
echo "Enter commit message (or press Enter for default):"
read COMMIT_MESSAGE

if test -z "$COMMIT_MESSAGE"
    set COMMIT_MESSAGE "Squash last $COMMIT_COUNT commits

🤖 Generated with [Claude Code](https://claude.ai/code)

Co-Authored-By: Claude <noreply@anthropic.com>"
end

# Create the squashed commit
git commit -m "$COMMIT_MESSAGE"

echo ""
echo "✅ Successfully squashed $COMMIT_COUNT commits into one!"
echo "New commit hash: "(git rev-parse --short HEAD)

# Ask about force pushing
echo ""
read -P "Force push to remote branch '$CURRENT_BRANCH'? (y/N): " -n 1 push_confirm

if string match -qi 'y' $push_confirm
    git push --force-with-lease origin $CURRENT_BRANCH
    echo "✅ Force pushed to origin/$CURRENT_BRANCH"
else
    echo "ℹ️  To push later, run: git push --force-with-lease origin $CURRENT_BRANCH"
end