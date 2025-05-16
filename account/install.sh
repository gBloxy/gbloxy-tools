#!/bin/bash

# Installer for mytool CLI

TOOL_NAME="gla"
TARGET_DIR="$HOME/.local/bin"

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

echo "$TOOL_NAME installed to $TARGET_DIR/"
