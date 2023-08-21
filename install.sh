#!/usr/bin/env bash

## Copyright (C) 2020-2023 Philip Seifert <https://templecheats.xyz>
##
## Install TempleOS Theme

## Directories
DIR=`pwd`
ODIR="$HOME/.config/openbox-themes/themes"
TDIR='/usr/share/themes'
IDIR='/usr/share/icons'
FDIR='/usr/share/fonts'
SUCCESS=0
DISTRO=$(lsb_release -d)
PACKAGEMAN=''
## Copy Openbox Theme
echo 'Installing Openbox Theme...'

LS=$( ls .config )

if [[ "$LS" != *"dots"* ]]; then
	echo 'installing openbox...'
	if [[ "$DISTRO" == *"arch"* ]] || [[ "$DISTRO" == *"EndeavourOS"* ]]; then
		sudo pacman -S openbox
## could be heavily optomized but I just want to initiate the change
	fi	
fi
cp -rf "$DIR"/dots/templeOS "$ODIR"
if [[ -d "$ODIR/templeOS" ]]; then
	echo -e 'Theme Installed!\n'
	SUCCESS=1

fi

## Install Themes and icons (Requires Root)
echo 'Installing Icons and Theme in /usr directory, Root Password is required...'
sudo cp -rf "$DIR"/theme/* "$TDIR"
if [[ -d "$TDIR/TempleOS" ]]; then
	echo 'GTK Theme Installed!'
	SUCCESS=1
fi
sudo cp -rf "$DIR"/icons/* "$IDIR"
if [[ -d "$IDIR/TempleOS" ]]; then
	echo 'Icons Installed!'
	SUCCESS=1
fi
sudo cp -rf "$DIR"/fonts/* "$FDIR"
if [[ -e "$FDIR/templeos_font.ttf" ]]; then
	echo 'Fonts Installed!'
	SUCCESS=1
fi

if [[ "$SUCCESS" == '1' ]]; then
	echo -e '\nInstallation Completed!'
	echo 'You can now apply the theme via openbox menu. Right click on desktop, Go to Preferences > Change Style'
else
	echo -e '\nFailed to install the theme properly.'
fi

