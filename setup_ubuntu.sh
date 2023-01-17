echo "Quickly Setup Ubuntu"
echo "===================="
echo ""

### Fuck you, Snap
echo "Removing Snap..."
sudo apt purge snapd -y
echo "Done removing Snap."
echo ""

### Add PPAs
echo "Adding PPAs..."
sudo add-apt-repository ppa:git-core/ppa -y

sudo wget -qO- https://packages.microsoft.com/keys/microsoft.asc | gpg --dearmor > packages.microsoft.gpg
sudo install -D -o root -g root -m 644 packages.microsoft.gpg /etc/apt/keyrings/packages.microsoft.gpg
sudo sh -c 'echo "deb [arch=amd64,arm64,armhf signed-by=/etc/apt/keyrings/packages.microsoft.gpg] https://packages.microsoft.com/repos/code stable main" > /etc/apt/sources.list.d/vscode.list'
rm -f packages.microsoft.gpg

### Update and Upgrade
echo "Updating and upgrading..."
sudo apt update && sudo apt upgrade -y

### Install packages
echo "Installing packages..."
sudo apt install wget gpg curl btop apt-transport-https ssh -y
sudo apt install git code neofetch zsh -y
curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.3/install.sh | bash
CHSH=yes RUNZSH=no sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
curl -sS https://starship.rs/install.sh | sh

### Set up configs
echo "Setting up configs..."
echo -e "add_newline = true\ncommand_timeout = 999\n[character]\nsuccess_symbol = \"[➜](bold green)\"\nerror_symbol = \"[➜](bold red)\"" >> "$HOME/.config/starship.toml"
mkdir -p "$HOME/.config/neofetch"
touch "$HOME/.config/neofetch/config.conf" && curl "https://raw.githubusercontent.com/auravoid/scripts/main/neofetch/config.conf" > "$HOME/.config/neofetch/config.conf"
touch "$HOME/.config/neofetch/logo" && curl "https://raw.githubusercontent.com/auravoid/scripts/main/neofetch/logo" > "$HOME/.config/neofetch/logo"

### Clean up
echo "Cleaning up..."
sudo apt autoremove -y
sudo apt autoclean -y

### End
echo "Done setting up Ubuntu."
echo "Reboot to apply changes."
echo "===================="
