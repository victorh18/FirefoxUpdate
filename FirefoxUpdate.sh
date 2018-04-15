#!/bin/bash
# Victor de la Rosa - victorwmh18@gmail.com
echo "Actualization script for Mozilla Firefox (Debian)"
#Since Debian official repositories only contain the ESR version of Firefox, we need to download and install the stable version ourselves, this scripts aims to do so, and make it automatically every month by setting a crontab

#Downloading it:
wget -O FirefoxSetup.tar.bz2 "https://download.mozilla.org/?product=firefox-latest&os=linux64&lang=en-US"

#Setting up the directories, if the installation directory for Firefox does not exists, then create it
if ! [ -d "/opt/firefox/" ]; then
	mkdir -p "/opt/firefox"
fi

#Extracting the program
tar xjf FirefoxSetup.tar.bz2 -C /opt/firefox/

#Create a backup before replacing the ESR executable
if ! [ -f "/usr/lib/firefox-esr/firefox-esr_orig" ]; then
	mv /usr/lib/firefox-esr/firefox-esr /usr/lib/firefox-esr/firefox-esr_orig
	ln -s /opt/firefox/firefox/firefox /usr/lib/firefox-esr/firefox-esr

fi
#You can make a crontab task to run this script monthly, weekly, or any frequency desired

#Instructions taken from
#https://linuxconfig.org/how-to-install-latest-firefox-browser-on-debian-9-stretch-linux
#COPYLEFT - 2017
