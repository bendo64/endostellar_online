#!/bin/bash

# Configuration
REPO_URL="https://github.com/bendo64/endostellar_online.git"
BASE_DIR="$HOME/endostellar_online"   # Base folder

cd "$BASE_DIR" || exit

# Clone or pull the repo
if [ -d "repo" ]; then
    echo "Repo already exists. Pulling latest changes..."
    cd repo || exit
    git pull

# Make the game executable
chmod +x "$BASE_DIR/repo/Linux releases/Endostellar_O.x86_64"

cd ~

echo "Update complete! Run the project using: ./run_eso.sh"

