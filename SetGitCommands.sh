#!/bin/bash

# Function to print an error message and exit
error_exit() {
    echo "$1" >&2
    exit 1
}

# Function to add a Git alias and handle errors
add_git_alias() {
    if ! git config --global alias."$1" "$2"; then
        error_exit "Failed to set alias '$1'. Please check your Git configuration."
    fi
}

# Set up the migrateChanges script
migrate_script_path="$HOME/migrateChanges.sh"

cat << 'EOF' > "$migrate_script_path"
#!/bin/bash

# Function to print an error message and exit
error_exit() {
    echo "$1" >&2
    exit 1
}

# Check for the branch name argument
if [ "$#" -ne 1 ] && [ "$#" -ne 2 ]; then
    error_exit "Usage: git migrateChanges <branch_name> or git migrateChanges -b <branch_name>"
fi

# Parse the branch name
if [ "$1" == "-b" ]; then
    shift
    branch_name="$1"
    create_branch=true
else
    branch_name="$1"
    create_branch=false
fi

# Stash changes and check for errors
if ! git stash; then
    error_exit "Failed to stash changes. Please resolve any issues."
fi

# Check if the branch exists
if git show-ref --verify --quiet "refs/heads/$branch_name"; then
    # Branch exists, checkout
    if ! git checkout "$branch_name"; then
        error_exit "Failed to checkout branch '$branch_name'."
    fi
else
    # Branch does not exist, create it
    if ! git checkout -b "$branch_name"; then
        error_exit "Failed to create and checkout branch '$branch_name'."
    fi
fi

# Pop the stashed changes and check for errors
if ! git stash pop; then
    error_exit "Failed to pop stashed changes. You may need to resolve conflicts."
fi

echo "Successfully migrated changes to branch '$branch_name'."
EOF

# Make the migrateChanges script executable
chmod +x "$migrate_script_path"

# Set up Git aliases
add_git_alias "migrateChanges" "!sh $migrate_script_path"
git config --global alias.post "!git push origin $(git symbolic-ref --short HEAD)"
git config --global alias.get "!git pull origin $(git symbolic-ref --short HEAD)"
git config --global alias.commitPost "!git add . && git commit && git push origin $(git symbolic-ref --short HEAD)"


echo "Custom Git commands have been set up successfully."
