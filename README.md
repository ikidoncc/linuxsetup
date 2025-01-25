# Linux Setup Automation

This repository contains a script that automates the setup of essential configuration files and directories by creating symbolic links. It ensures that your system setup is consistent and easy to restore, especially useful when reconfiguring or setting up a new Linux environment.

## Features

- Automates the creation of symbolic links for various configuration files (e.g., Alacritty, Zsh, Neovim).
- Easy to extend: You can easily add more configuration files to the setup.
- Saves time when setting up a new system or recovering from a fresh installation.

## Prerequisites

- A Linux system with a home directory ($HOME).
- The script assumes the configuration files are stored in a central directory under ~/.config/linuxsetup/.

## Setup

1. Clone this repository to your system:

```bash
git clone https://github.com/ikidoncc/linuxsetup.git $HOME/.config/linuxsetup
```

2. Change into the repository directory:

```bash
cd $HOME/.config/linuxsetup
```

3. Make the script executable:

```bash
chmod +x ./linuxsetup.sh
```

4. Run the script to create symbolic links for the configuration files:

```bash
./linuxsetup.sh
```
This will create symbolic links from ~/.config/linuxsetup/ to the appropriate locations (e.g., ~/.config/alacritty, etc.).

## Configuration Files

The following configuration files are set up by default:

- Alacritty: Terminal configuration file (~/.config/alacritty)

You can add additional files or directories to the linuxsetup.sh script if needed. Simply follow the pattern used for the existing entries in the script.

## Customization

To change the root directory for your setup files, modify the SETUP_DIR variable in the linuxsetup.sh script:

```bash
SETUP_DIR="$HOME/.config/linuxsetup"
```

You can change it to any other directory where you store your configuration files.
