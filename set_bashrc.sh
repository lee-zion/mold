#!/bin/bash

# --------------------------------------------
# Script: setup_bashrc.sh
# Description: Creates and configures the .bashrc file
#              for Git Bash on Windows to handle Hangul characters.
# --------------------------------------------

# Define the content to be added to .bashrc
read -r -d '' BASHRC_CONTENT << 'EOF'

# ----------------------------------------------------
# Locale settings for proper Hangul (Korean) support
export LANG=ko_KR.UTF-8
export LC_ALL=ko_KR.UTF-8
export PYTHONIOENCODING=utf-8
# ----------------------------------------------------

EOF

# Path to the .bashrc file
BASHRC_PATH="$HOME/.bashrc"

# Function to check if a string exists in a file
function string_in_file() {
    local string="$1"
    local file="$2"
    grep -Fxq "$string" "$file"
}

# Step 1: Check if .bashrc exists; if not, create it
if [ ! -f "$BASHRC_PATH" ]; then
    echo "✅ .bashrc not found. Creating .bashrc..."
    touch "$BASHRC_PATH"
    echo ".bashrc created at $BASHRC_PATH."
else
    echo "ℹ️ .bashrc already exists at $BASHRC_PATH."
fi

# Step 2: Append environment variables if they are not already present
echo "🔍 Checking for existing locale settings in .bashrc..."

# Extract the locale-related lines from BASHRC_CONTENT
LOCALE_LINES=$(echo "$BASHRC_CONTENT" | grep "^export LANG=ko_KR.UTF-8" -A2)

# Check if the first line of LOCALE_LINES exists in .bashrc
if string_in_file "export LANG=ko_KR.UTF-8" "$BASHRC_PATH"; then
    echo "✅ Locale settings already present in .bashrc. Skipping addition."
else
    echo "➕ Adding locale settings to .bashrc..."
    echo "$BASHRC_CONTENT" >> "$BASHRC_PATH"
    echo "✅ Locale settings added to .bashrc."
fi

# Step 3: Source the .bashrc to apply changes
echo "🔄 Applying changes by sourcing .bashrc..."
source "$BASHRC_PATH"

# Step 4: Confirm the environment variables are set
echo "📋 Confirming environment variables:"
echo "LANG=$LANG"
echo "LC_ALL=$LC_ALL"
echo "PYTHONIOENCODING=$PYTHONIOENCODING"

echo "🎉 Setup complete! Please restart Git Bash to ensure all changes take effect."
