#!/bin/bash

# Variables
REPO_URL="https://github.com/xmento/dotfiles-script"
REPO_DIR="$HOME/dotfiles"

# Function to print messages
print_message() {
    echo -e "\e[32m$1\e[0m"
}

# Clone the repository
print_message "Cloning dotfiles repository..."
if [ -d "$REPO_DIR" ]; then
    print_message "Dotfiles directory already exists. Pulling latest changes..."
    git -C "$REPO_DIR" pull
else
    git clone "$REPO_URL" "$REPO_DIR"
fi

# Change directory to the dotfiles repository
cd "$REPO_DIR" || { echo "Failed to enter the dotfiles directory"; exit 1; }

# Run the installation script
print_message "Running the dotfiles installation..."
if [ -f "install.sh" ]; then
    chmod +x install.sh
    ./install.sh
else
    print_message "No install.sh script found. Please check the repository."
    exit 1
fi

# Print completion message
print_message "Dotfiles installation complete."
