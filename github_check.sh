#!/bin/bash
# enable save of the service username here: git config --global credential.helper store
# after saveing enabled, provide a command with needed password, and the password should be saved for the future use.

# Function to check if there are any changes
check_changes() {
    git_status=$(git status --porcelain)
    if [[ -n "$git_status" ]]; then
        echo "Changes detected!"
        echo "$git_status"
        # Stage all changes or git add -A for signaling of removed files
        git add .

        # Commit the changes with a default message or custom message
        commit_message="Auto-commit: $(date)"
        git commit -m "$commit_message"

        # Push the changes using environment variables for authentication
        git push https://s-github@gitz.a.com/network/weathermap.git
    else
        echo "No changes to commit."
    fi
}

# Execute git status to show the current state
echo "Checking repository status..."
git status

# Check and handle changes if any
check_changes
