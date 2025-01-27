#!/usr/bin/env bash

# Define the root directory where your configuration files are stored.
# By default, it is set to $HOME/.config/linuxsetup
SETUP_DIR="$HOME/.config/linuxsetup"

echo -e "\nStarting configuration!\n"

# Function to create a symbolic link
create_symlink() {
	local SOURCE="$1" # The source file or directory (from SETUP_DIR)
	local TARGET="$2" # The target file or directory (where the link will be created)

	local TARGET_DIR
	TARGET_DIR=$(dirname "$TARGET")
	if [ ! -d "$TARGET_DIR" ]; then
		mkdir -p "$TARGET_DIR"
		echo -e "Created parent directory: $TARGET_DIR"
	fi

	# Check if the symbolic link already exists at the target location
	if [ -L "$TARGET" ]; then
		echo -e "The symbolic link already exists: $TARGET"
	else
		# If the symbolic link doesn't exist, check if the source file/directory exists
		if [ -e "$SOURCE" ]; then
			# If the source exists, create the symbolic link
			ln -s "$SOURCE" "$TARGET"
			echo -e "Symbolic link created: $TARGET -> $SOURCE"
		else
			# If the source file/directory doesn't exist, print an error message
			echo -e "The source file or directory does not exist: $SOURCE"
		fi
	fi
}

# Define the configuration files and directories you want to set up
# The keys are the source files/directories, and the values are the target locations for the symbolic links
declare -A links=(
	["$SETUP_DIR/alacritty"]="$HOME/.config/alacritty"
	["$SETUP_DIR/tmux.conf"]="$HOME/.tmux.conf"
	["$SETUP_DIR/zshrc"]="$HOME/.zshrc"
	# Add more files or directories as needed, following the same pattern
)

# Loop through the links and create the symbolic links for each configuration file
for SOURCE in "${!links[@]}"; do
	TARGET="${links[$SOURCE]}"         # The target location for the symbolic link
	create_symlink "$SOURCE" "$TARGET" # Call the function to create the link
done

# New line
echo ""

# If it's the tmux configuration, reload tmux config immediately
if pgrep -x "tmux" >/dev/null; then
	# If tmux is running, reload the tmux configuration
	tmux source-file ~/.tmux.conf
	echo -e "Tmux configuration reloaded.\n"
fi

echo -e "Setup complete!\n"
