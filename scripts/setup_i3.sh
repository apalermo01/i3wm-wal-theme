#!/bin/bash
# setting up i3 and associated configs

# install dependencies
sudo apt install feh \
				 compton \
				 python3-pip \
				 vim \
				 curl \
				 neofetch \
				 xclip 
				 # brave-browser 

pip install --user bumblebee-status
pip install --user pywal

# make config file
if [[ ! -d ~/.config/i3 ]]; then
	mkdir -p ~/.config/i3
fi

# copy dotfiles
if [[ -f ~/.config/i3/config ]]; then
	echo "previous i3 config found, adding backup"
	cp ~/.config/i3/config ~/.config/i3/config_backup
fi
cp ../dotfiles/i3-config ~/.config/i3/config
cp ../dotfiles/compton.conf ~/.config/compton.conf
if [[ -f ~/.vimrc ]]; then
	echo "previous .vimrc found, adding backup"
	cp ~/.vimrc ~/.vimrc_backup
fi
cp ../dotfiles/.vimrc ~/.vimrc

# copy scripts
cp left_monitor.sh ~/left_monitor.sh
cp right_monitor.sh ~/right_monitor.sh
cp logout.sh ~/.config/i3/bin/logout.sh
cp rofifinder.sh ~/.config/i3/bin/rofifinder.sh

# download a wallpaper
if [[ ! -d ~/Pictures/wallpapers ]]; then
	mkdir ~/Pictures/wallpapers
fi
curl -o ~/Pictures/wallpapers/linux_wallpaper.jpg -L https://www.technocrazed.com/wp-content/uploads/2015/12/Linux-Wallpaper-41.jpg 
touch ~/.current_background
echo "wal -n -i \$(cat ~/.current_background) > /dev/null" >> ~/.bashrc
echo "neofetch" >> ~/.bashrc
