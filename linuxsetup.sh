#!/bin/bash

SETUP_DIR="$HOME/.config/linuxsetup"

create_symlink() {
  local SOURCE="$1"
  local TARGET="$2"

  if [ -L "$TARGET" ]; then
      echo "Symbolic link already configured: $TARGET"
    else
      if [ -e "$SOURCE" ]; then
        ln -s "$SOURCE" "$TARGET"
        echo "Link simbolico configurado: $TARGET -> $SOURCE"
      else
        echo "The source file or directory does not exist: $SOURCE"
      fi
  fi
}

declare -A links=(
    ["$SETUP_DIR/alacritty"]="$HOME/.config/alacritty"
)

for SOURCE in "${!links[@]}"; do
  TARGET="${links[$SOURCE]}"
  create_symlink "$SOURCE" "$TARGET"
done

echo "Setup completed!!!"
