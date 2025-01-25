#!/bin/bash

# Define the root directory where your configuration files are stored.
# By default, it is set to $HOME/.config/linuxsetup
SETUP_DIR="$HOME/.config/linuxsetup"

echo -e "\nStarting configuration!\n"

# Function to create a symbolic link
create_symlink() {
	local SOURCE="$1" # The source file or directory (from SETUP_DIR)
	local TARGET="$2" # The target file or directory (where the link will be created)

	# Check if the symbolic link already exists at the target location
	if [ -L "$TARGET" ]; then
		echo -e "The symbolic link already exists: $TARGET\n"
	else
		# If the symbolic link doesn't exist, check if the source file/directory exists
		if [ -e "$SOURCE" ]; then
			# If the source exists, create the symbolic link
			ln -s "$SOURCE" "$TARGET"
			echo -e "Symbolic link created: $TARGET -> $SOURCE\n"
		else
			# If the source file/directory doesn't exist, print an error message
			echo -e "The source file or directory does not exist: $SOURCE\n"
		fi
	fi
}

# Define the configuration files and directories you want to set up
# The keys are the source files/directories, and the values are the target locations for the symbolic links
declare -A links=(
	["$SETUP_DIR/alacritty"]="$HOME/.config/alacritty" # Alacritty config file
	["$SETUP_DIR/tmux.conf"]="$HOME/.tmux.conf"
	# Add more files or directories as needed, following the same pattern
)

# Loop through the links and create the symbolic links for each configuration file
for SOURCE in "${!links[@]}"; do
	TARGET="${links[$SOURCE]}"         # The target location for the symbolic link
	create_symlink "$SOURCE" "$TARGET" # Call the function to create the link
done

# If it's the tmux configuration, reload tmux config immediately
if pgrep -x "tmux" >/dev/null; then
	# If tmux is running, reload the tmux configuration
	tmux source-file ~/.tmux.conf
	echo -e "Tmux configuration reloaded.\n"
else
	echo -e "Tmux is not running, no need to reload.\n"
fi

echo -e "Setup complete!\n"
