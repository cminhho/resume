#!/bin/bash

# This script will modify all commits in your git history
# to use your preferred name and email.

# IMPORTANT: Before running this script:
# 1. Set your correct name and email in git config
# 2. Make a backup of your repository
# 3. Be aware that this will rewrite history

# Get the configured name and email
NEW_NAME=$(git config user.name)
NEW_EMAIL=$(git config user.email)

if [ -z "$NEW_NAME" ] || [ -z "$NEW_EMAIL" ]; then
  echo "Error: Git username or email not configured."
  echo "Please run:"
  echo "  git config user.name \"Your Name\""
  echo "  git config user.email \"your-email@example.com\""
  exit 1
fi

echo "This will change ALL commit authors to: $NEW_NAME <$NEW_EMAIL>"
echo "Are you sure you want to continue? (y/n)"
read -r response
if [[ ! "$response" =~ ^[Yy]$ ]]; then
  echo "Operation cancelled."
  exit 0
fi

# Option 1: Change only specific authors (uncomment and modify if needed)
# git filter-branch --env-filter '
# OLD_EMAIL1="chung.ho@tyme.com"
# OLD_EMAIL2="chungho@AP-0324-1014.fpt"
# if [ "$GIT_COMMITTER_EMAIL" = "$OLD_EMAIL1" ] || [ "$GIT_COMMITTER_EMAIL" = "$OLD_EMAIL2" ]; then
#     export GIT_COMMITTER_NAME="$NEW_NAME"
#     export GIT_COMMITTER_EMAIL="$NEW_EMAIL"
# fi
# if [ "$GIT_AUTHOR_EMAIL" = "$OLD_EMAIL1" ] || [ "$GIT_AUTHOR_EMAIL" = "$OLD_EMAIL2" ]; then
#     export GIT_AUTHOR_NAME="$NEW_NAME"
#     export GIT_AUTHOR_EMAIL="$NEW_EMAIL"
# fi
# ' --tag-name-filter cat -- --all

# Option 2: Change ALL commits (this is the default)
git filter-branch --env-filter "
    export GIT_AUTHOR_NAME=\"$NEW_NAME\"
    export GIT_AUTHOR_EMAIL=\"$NEW_EMAIL\"
    export GIT_COMMITTER_NAME=\"$NEW_NAME\"
    export GIT_COMMITTER_EMAIL=\"$NEW_EMAIL\"
" --tag-name-filter cat -- --all

echo "Author information has been updated for all commits."
echo "If this is a shared repository, you will need to force push:"
echo "  git push --force"
echo "WARNING: Force pushing will overwrite the remote repository!" 