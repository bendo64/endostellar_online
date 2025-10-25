#!/bin/bash

# Configuration
REPO_URL="https://github.com/bendo64/endostellar_online.git"
BASE_DIR="$HOME/eso"   # Base folder
LAUNCHER_SCRIPT="$HOME/run_eso.sh"

# Create base folder
mkdir -p "$BASE_DIR"
cd "$BASE_DIR" || exit

# Clone or pull the repo
if [ -d "repo" ]; then
    echo "Repo already exists. Pulling latest changes..."
    cd repo || exit
    git pull
else
    echo "Cloning repo..."
    git clone "$REPO_URL"
fi

# Make the game executable
chmod +x "$BASE_DIR/endostellar_online/Linux releases/Endostellar_O.x86_64"

# Create the launcher script in the root folder
cat > "$LAUNCHER_SCRIPT" <<EOL
#!/bin/bash
cd "$BASE_DIR/endostellar_online/Linux releases"
./Endostellar_O.x86_64
EOL

# Make the launcher script executable
chmod +x "$LAUNCHER_SCRIPT"

cd ~

echo "Setup complete! Run the project using: ./run_eso.sh"

