#!/bin/bash

# Installer for mytool CLI

TOOL_NAME="gla"
TARGET_DIR="$HOME/.local/bin"

echo "Installing gla - g_bloxy leaderboard account manager."

# Create target dir if it doesn't exist
mkdir -p "$TARGET_DIR"

# Make sure script is executable
chmod +x "$TOOL_NAME.py"

# Copy it and rename
cp "$TOOL_NAME.py" "$TARGET_DIR/$TOOL_NAME"

# Check if ~/.local/bin is in PATH
if [[ ":$PATH:" != *":$HOME/.local/bin:"* ]]; then
    echo "Adding $TARGET_DIR to PATH..."
    echo 'export PATH="$HOME/.local/bin:$PATH"' >> "$HOME/.bashrc"
    echo 'export PATH="$HOME/.local/bin:$PATH"' >> "$HOME/.zshrc"
    echo "Please restart your terminal or run: source ~/.bashrc"
fi

if ! python3 -c "import cryptography" &> /dev/null; then
    echo "'cryptography' module not found."

    # Detect if using apt (Debian/Ubuntu)
    if command -v apt &> /dev/null; then
        echo "You appear to be on a Debian/Ubuntu system."
        echo "Installing with APT requires sudo permissions:"
        echo "  sudo apt install python3-cryptography"
    else
        echo "Attempting to install via pip..."
        python3 -m pip install --user cryptography
    fi
else
    echo "'cryptography' dependency is already installed."
fi

echo "$TOOL_NAME installed to $TARGET_DIR/"
