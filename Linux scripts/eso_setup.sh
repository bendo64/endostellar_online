#!/bin/bash

# Configuration
REPO_URL="https://github.com/bendo64/endostellar_online.git"
BASE_DIR="$HOME/eso"   # Base folder
LAUNCHER_SCRIPT="run.sh"

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

# Create the launcher script in the base folder
cat > "$BASE_DIR/$LAUNCHER_SCRIPT" <<EOL
#!/bin/bash
cd "$BASE_DIR/endostellar_online/Linux releases"
./Endostellar_O.x86_64
EOL

# Make the launcher script executable
chmod +x "$BASE_DIR/$LAUNCHER_SCRIPT"

cd ~

#Copy update script into main
cp "$BASE_DIR/endostellar_online/Linux scripts/update.sh/" "$BASE_DIR/"

#Make exc
chmod +x "$BASE_DIR/update.sh/"

echo "Setup complete! Run the project using: ./eso/run.sh Update using ./eso/update.sh"

