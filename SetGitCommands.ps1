# Function to print an error message and exit
function error_exit {
    Write-Error $args[0]
    exit 1
}

# Function to add a Git alias and handle errors
function add_git_alias {
    param (
        [string]$aliasName,
        [string]$aliasCommand
    )
    
    try {
        git config --global alias.$aliasName $aliasCommand
    } catch {
        error_exit "Failed to set alias '$aliasName'. Please check your Git configuration."
    }
}

# Set up the migrateChanges script path
$migrateScriptPath = "$HOME\migrateChanges.ps1"

# Create the migrateChanges script
@"
# PowerShell script to migrate changes

# Function to print an error message and exit
function error_exit {
    Write-Error \$args[0]
    exit 1
}

# Check for the branch name argument
if (\$args.Count -ne 1 -and \$args.Count -ne 2) {
    error_exit "Usage: git migrateChanges <branch_name> or git migrateChanges -b <branch_name>"
}

# Parse the branch name
if (\$args[0] -eq "-b") {
    \$branchName = \$args[1]
    \$createBranch = $true
} else {
    \$branchName = \$args[0]
    \$createBranch = $false
}

# Stash changes and check for errors
if (-not (git stash)) {
    error_exit "Failed to stash changes. Please resolve any issues."
}

# Check if the branch exists
if (git show-ref --verify --quiet "refs/heads/\$branchName") {
    # Branch exists, checkout
    if (-not (git checkout \$branchName)) {
        error_exit "Failed to checkout branch '\$branchName'."
    }
} else {
    # Branch does not exist, create it
    if (-not (git checkout -b \$branchName)) {
        error_exit "Failed to create and checkout branch '\$branchName'."
    }
}

# Pop the stashed changes and check for errors
if (-not (git stash pop)) {
    error_exit "Failed to pop stashed changes. You may need to resolve conflicts."
}

Write-Host "Successfully migrated changes to branch '\$branchName'."
"@ | Set-Content -Path $migrateScriptPath -Encoding UTF8

# Make the migrateChanges script executable
# (PowerShell scripts are inherently executable)

# Set up Git aliases
add_git_alias "migrateChanges" "!powershell -ExecutionPolicy Bypass -File $migrateScriptPath"
add_git_alias "post" "!git push origin \$(git symbolic-ref --short HEAD)"
add_git_alias "get" "!git pull origin \$(git symbolic-ref --short HEAD)"
add_git_alias "commitPost" "!git add . && git commit && git push origin \$(git symbolic-ref --short HEAD)"

Write-Host "Custom Git commands have been set up successfully."
