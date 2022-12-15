#!/bin/bash

# Manage logouot with rofi
opetion=`echo -e "suspend\nlock screen\nlogout\nreboot\npoweroff" | rofi -width 600 -dmenu -p system:`

case $option in
	suspend)
		sudo /usr/bin/systemctl syspend
		;;
	'lock screen')
		i3lock -i /home/alex/Pictures/wallpapers/ubuntu1.png
		;;
	logout)
		i3-nagbar -t warning -m "Are you sure you want to exit i3? This will end your X session." -b 'Yes, exit i3' 'i3-msg exit'
		;;
	reboot)
		/usr/bin/systemctl reboot
		;;
	poweroff)
		/usr/bin/systemctl poweroff
		;;
asac

