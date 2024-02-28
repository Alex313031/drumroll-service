#!/bin/bash

# Copyright (c) 2024 Alex313031 and Midzer and Julianna.

YEL='\033[1;33m' # Yellow
CYA='\033[1;96m' # Cyan
RED='\033[1;31m' # Red
GRE='\033[1;32m' # Green
c0='\033[0m' # Reset Text
bold='\033[1m' # Bold Text
underline='\033[4m' # Underline Text

# Error handling
yell() { echo "$0: $*" >&2; }
die() { yell "$*"; exit 111; }
try() { "$@" || die "${RED}Failed $*"; }

# --help
displayHelp () {
	printf "\n" &&
	printf "${bold}${GRE}Script to install useful packages on Ubuntu.${c0}\n" &&
	printf "\n" &&
	printf "${bold}${YEL}Use the --lib32 flag to enable 32 bit support. (Recommended to run this first)${c0}\n" &&
	printf "${bold}${YEL}Use these flags for your corresponding Ubuntu release:${c0}\n" &&
	printf "\n" &&
	printf "${bold}${YEL}  --xenial | Ubuntu 16.04, Codename \"Xenial Xerus\"${c0}\n" &&
	printf "${bold}${YEL}  --bionic | Ubuntu 18.04, Codename \"Bionic Beaver\"${c0}\n" &&
	printf "${bold}${YEL}  --focal  | Ubuntu 20.04, Codename \"Focal Fossa\"${c0}\n" &&
	printf "${bold}${YEL}  --jammy  | Ubuntu 22.04, Codename \"Jammy Jellyfish\"${c0}\n" &&
	printf "${bold}${YEL}  --lunar (Ubuntu 23.04, Codename \"Lunar Lobster\".${c0}\n" &&
	printf "${bold}${YEL}  --debian (Debian 12.1, Codename \"Bookworm\".${c0}\n" &&
	printf "\n"
}

# --lib32
installLib32 () {
	printf "\n" &&
	printf "${bold}${GRE}Enabling 32-bit package support (i386 MultiArch support)...${c0}\n" &&
	printf "${bold}\n" &&
	read -p "Press Enter to continue, Ctrl + C to abort." &&
	printf "${c0}\n" &&
	printf "${bold}${RED}Note: ${c0}${bold}Running ${c0}${bold}${YEL}sudo dpkg --add-architecture i386${c0}${bold} and ${c0}${bold}${YEL}sudo apt update${c0}.\n" &&
	printf "\n" &&
	tput sgr0 &&
	
	cd &&
	sudo dpkg --add-architecture i386 &&
	sudo apt update &&

	printf "\n" &&	
	printf "${GRE}Added foreign architecture: " &&
	sudo dpkg --print-foreign-architectures &&

	printf "\n" &&	
	printf "${GRE}Done! ${YEL}You can now run this script again for your Ubuntu version.\n"
	printf "\n" &&
	tput sgr0
}

# Common Setup
installCommon () {
	printf "\n" &&
	printf "${bold}${GRE}Installing common packages for Ubuntu...${c0}\n" &&
	printf "${bold}\n" &&
	read -p "Press Enter to continue, Ctrl + C to abort." &&
	printf "${c0}\n" &&
	tput sgr0 &&
	
	cd &&
	sudo apt update &&
	sudo apt full-upgrade &&
	sudo apt install autoconf autoconf-archive automake autopoint autotools-dev beep binfmt-support build-essential cmake cpufrequtils cpuid cpustat cputool curl dconf-editor debhelper debian-keyring desktop-file-utils devhelp dh-autoreconf dh-make dh-strip-nondeterminism dkms docbook doc-base docutils-common elfutils exfat-fuse exo-utils fancontrol fdutils ffmpeg ffmpeg-doc ffmpegthumbnailer galternatives gimp gimp-data-extras gimp-help-en git git-gui gitk gmrun gnome-shell-extensions gnu-standards gpart gparted hardinfo hwloc i2c-tools icoutils intel-cmt-cat intel-gpu-tools iotop isag libcanberra-gtk-module libdrm-dev libdvdcss2 libfile-stripnondeterminism-perl libgtk-3-dev libhwloc-common libhwloc-dev libhwloc-plugins libi2c-dev libltdl-dev libmail-sendmail-perl libncurses5-dev libncursesw5-dev libportaudio2 libqt5opengl5 libqt5printsupport5 librrds-perl libsensor-msgs-dev libsensors-applet-plugin-dev libsensors4-dev libsigsegv2 libsys-hostname-long-perl libsystemd-dev libtool libudev-dev libvdpau-va-gl1 libvulkan-dev libvulkan1 libxml2-dev libxml2-utils lm-sensors lksctp-tools m4 meld menu menu-l10n mesa-utils mpv mtools numlockx openvpn p7zip-full po-debconf python3-docutils python3-oauth2client python3-pkg-resources python3-setuptools python3-tk python3-virtualenv qt5-image-formats-plugins qtwayland5 read-edid resolvconf rrdtool sl sndiod squashfs-tools squashfuse stress-ng stunnel4 sysstat tcl-tclreadline terminator texinfo thunar thunar-archive-plugin thunar-media-tags-plugin tk tree tumbler-plugins-extra ubuntu-restricted-addons ubuntu-restricted-extras ubuntu-sounds unrar v86d vainfo vdpau-driver-all vdpauinfo virtualenv vlc wget x11-utils xfce4-settings xz-utils zstd webp-pixbuf-loader libsecret* &&

	sudo dpkg-reconfigure libdvd-pkg &&
	
	printf "\n" &&
	printf "${GRE}Done!\n" &&
	tput sgr0
}

# Common Setup for Debian
installCommonDebian () {
	printf "\n" &&
	printf "${bold}${GRE}Installing common packages for Debian...${c0}\n" &&
	printf "${bold}\n" &&
	read -p "Press Enter to continue, Ctrl + C to abort." &&
	printf "${c0}\n" &&
	tput sgr0 &&
	
	cd &&
	sudo apt update &&
	sudo apt full-upgrade &&
	sudo apt install autoconf autoconf-archive automake autopoint autotools-dev beep binfmt-support build-essential cmake cpufrequtils cpuid cpustat cputool curl dconf-editor debhelper debian-keyring desktop-file-utils devhelp dh-autoreconf dh-make dh-strip-nondeterminism dkms docbook doc-base docutils-common elfutils exfat-fuse exo-utils fancontrol fdutils ffmpeg ffmpeg-doc ffmpegthumbnailer galternatives gimp gimp-data-extras gimp-help-en git git-gui gitk gmrun gnome-shell-extensions gnu-standards gpart gparted hardinfo hwloc i2c-tools icoutils intel-cmt-cat intel-gpu-tools iotop isag libcanberra-gtk-module libdrm-dev libdvdcss2 libfile-stripnondeterminism-perl libgtk-3-dev libhwloc-common libhwloc-dev libhwloc-plugins libi2c-dev libltdl-dev libmail-sendmail-perl libncurses5-dev libncursesw5-dev libportaudio2 libqt5opengl5 libqt5printsupport5 librrds-perl libsensor-msgs-dev libsensors-applet-plugin-dev libsensors4-dev libsigsegv2 libsys-hostname-long-perl libtool libvdpau-va-gl1 libvulkan-dev libvulkan1 libxml2-dev libxml2-utils lm-sensors lksctp-tools m4 meld menu menu-l10n mesa-utils mpv mtools numlockx openvpn overlay-scrollbar overlay-scrollbar-gtk2 p7zip-full po-debconf python3-docutils python3-oauth2client python3-pkg-resources python3-setuptools python3-tk python3-virtualenv qt5-image-formats-plugins qtwayland5 read-edid resolvconf rrdtool sl sndiod squashfs-tools squashfuse stress-ng stunnel4 sysstat tcl-tclreadline terminator texinfo thunar thunar-archive-plugin thunar-media-tags-plugin tk tree tumbler-plugins-extra libavcodec-extra libavcodec-extra59 ttf-mscorefonts-installer gstreamer1.0-libav gstreamer1.0-plugins-ugly gstreamer1.0-vaapi unrar vainfo vdpau-driver-all vdpauinfo virtualenv vlc wget x11-utils xfce4-settings xz-utils zstd webp-pixbuf-loader libsecret* &&

	sudo dpkg-reconfigure libdvd-pkg &&
	
	printf "\n" &&
	printf "${GRE}Done!\n" &&
	tput sgr0
}

# --xenial
installXenial () {
	printf "\n" &&
	printf "${bold}${GRE}Installing specific packages for Ubuntu 16.04, Codename \"Xenial Xerus\".${c0}\n" &&
	printf "${bold}\n" &&
	read -p "Press Enter to continue, Ctrl + C to abort." &&
	printf "${c0}\n" &&
	tput sgr0 &&
	
	cd &&
	sudo apt install python2-dev python-docutils python-setuptools python-smbus gksu dconf-tools exfat-utils gnome-tweak-tool inteltool rarian-compat vdpau-va-driver libatk-adaptor libgail-common libatk-bridge2.0-0 vulkan-utils gnome-mime-data libexo-1-dev libvte9 &&
	
	printf "\n" &&
	printf "${GRE}Done!\n" &&
	printf "\n" &&
	tput sgr0
}

# --bionic
installBionic () {
	printf "\n" &&
	printf "${bold}${GRE}Installing specific packages for Ubuntu 18.04, Codename \"Bionic Beaver\".${c0}\n" &&
	printf "${bold}\n" &&
	read -p "Press Enter to continue, Ctrl + C to abort." &&
	printf "${c0}\n" &&
	tput sgr0 &&
	
	cd &&
	sudo apt install python python-dev python2.7-dev python-minimal python-pip-whl python-setuptools-git python-docutils python-setuptools python-smbus python3-smbus i965-va-driver-shaders dconf-tools exfat-utils gnome-tweak-tool inteltool rarian-compat vdpau-va-driver libatk-adaptor libgail-common gnome-tweaks qt5-qmltooling-plugins neofetch vulkan-utils libarchive-cpio-perl gnome-mime-data sse3-support libexo-1-dev libexo-2-dev libvte9 libu2f-udev gstreamer1.0-plugins-bad &&
	
	printf "\n" &&
	printf "${GRE}Done!\n" &&
	printf "\n" &&
	tput sgr0
}

# --focal
installFocal () {
	printf "\n" &&
	printf "${bold}${GRE}Installing specific packages for Ubuntu 20.04, Codename \"Focal Fossa\".${c0}\n" &&
	printf "${bold}\n" &&
	read -p "Press Enter to continue, Ctrl + C to abort." &&
	printf "${c0}\n" &&
	tput sgr0 &&
	
	cd &&
	sudo apt install intel-media-va-driver-non-free libappimage0 libappimage-dev exfat-utils mesa-va-drivers python3-smbus i965-va-driver-shaders gnome-tweaks qt5-qmltooling-plugins neofetch vulkan-tools libarchive-cpio-perl sse3-support libexo-1-dev libexo-2-dev libvte9 libu2f-udev python2 python2-dev python2.7-dev python2-minimal python2-pip-whl python2-setuptools-whl gstreamer1.0-plugins-bad &&
	
	printf "\n" &&
	printf "${GRE}Done!\n" &&
	printf "\n" &&
	tput sgr0
}

# --jammy
installJammy () {
	printf "\n" &&
	printf "${bold}${GRE}Installing specific packages for Ubuntu 22.04, Codename \"Jammy Jellyfish\".${c0}\n" &&
	printf "${bold}\n" &&
	read -p "Press Enter to continue, Ctrl + C to abort." &&
	printf "${c0}\n" &&
	tput sgr0 &&
	
	cd &&
	sudo apt install intel-media-va-driver-non-free libappimage0 libappimage-dev exfatprogs mesa-va-drivers python3-smbus i965-va-driver-shaders gnome-tweaks qt5-qmltooling-plugins neofetch vulkan-tools libarchive-cpio-perl sse3-support libexo-2-dev libvte9 libu2f-udev python2 python2-dev python2.7-dev python2-minimal python2-pip-whl python2-setuptools-whl gstreamer1.0-plugins-bad &&
	
	printf "\n" &&
	printf "${GRE}Done!\n" &&
	printf "\n" &&
	tput sgr0
}

# --lunar
installLunar () {
	printf "\n" &&
	printf "${bold}${GRE}Installing specific packages for Ubuntu 23.04, Codename \"Lunar Lobster\".${c0}\n" &&
	printf "${bold}\n" &&
	read -p "Press Enter to continue, Ctrl + C to abort." &&
	printf "${c0}\n" &&
	tput sgr0 &&
	
	cd &&
	sudo apt install intel-media-va-driver-non-free libappimage1.0abi1 libappimage-dev exfatprogs mesa-va-drivers python3-smbus i965-va-driver-shaders gnome-tweaks qt5-qmltooling-plugins neofetch vulkan-tools libarchive-cpio-perl sse3-support libexo-2-dev libvte-2.91-0 libu2f-udev python2 python2-dev python2.7-dev python2-minimal python2-pip-whl python2-setuptools-whl gstreamer1.0-plugins-bad &&
	
	printf "\n" &&
	printf "${GRE}Done!\n" &&
	printf "\n" &&
	tput sgr0
}

# --debian
installDebian () {
	printf "\n" &&
	printf "${bold}${GRE}Installing specific packages for Debian 12.1, Codename \"Bookworm\".${c0}\n" &&
	printf "${bold}\n" &&
	read -p "Press Enter to continue, Ctrl + C to abort." &&
	printf "${c0}\n" &&
	tput sgr0 &&
	
	cd &&
	sudo apt install intel-media-va-driver-non-free libappimage1.0abi1 libappimage-dev exfatprogs mesa-va-drivers python3-smbus i965-va-driver-shaders gnome-tweaks qt5-qmltooling-plugins neofetch vulkan-tools libarchive-cpio-perl sse3-support libexo-2-dev libvte-2.91-0 libu2f-udev python python3-dev python3-wheel-whl python3-setuptools-whl python3-pip-whl gstreamer1.0-plugins-bad &&
	
	printf "\n" &&
	printf "${GRE}Done!\n" &&
	printf "\n" &&
	tput sgr0
}

# Post Install
postInstall () {
	c0='\033[0m' # Reset Text
	c1='\033[0m\033[1;31m' # Light Red
	c2='\033[0m\033[1;37m' # White
	c3='\033[0m\033[1;33m' # Yellow
	c4='\033[1;32m' # Green
	
	printf "\n" &&
	printf "${c1}                .-/+oossssoo+\-.              \n" &&
	printf "            ´:+ssssssssssssssssss+:\`              \n" &&
	printf "          -+ssssssssssssssssssyyssss+-              \n" &&
	printf "        .ossssssssssssssssss${c2}dMMMNy${c1}sssso.              \n" &&
	printf "       /sssssssssss${c2}hdmmNNmmyNMMMMh${c1}ssssss\              \n" &&
	printf "      +sssssssss${c2}hm${c1}yd${c2}MMMMMMMNddddy${c1}ssssssss+              \n" &&
	printf "     /ssssssss${c2}hNMMM${c1}yh${c2}hyyyyhmNMMMNh${c1}ssssssss\              \n" &&
	printf "    .ssssssss${c2}dMMMNh${c1}ssssssssss${c2}hNMMMd${c1}ssssssss.              \n" &&
	printf "    +ssss${c2}hhhyNMMNy${c1}ssssssssssss${c2}yNMMMy${c1}sssssss+              \n" &&
	printf "    oss${c2}yNMMMNyMMh${c1}ssssssssssssss${c2}hmmmh${c1}ssssssso              \n" &&
	printf "    oss${c2}yNMMMNyMMh${c1}sssssssssssssshmmmh${c1}ssssssso              \n" &&
	printf "    +ssss${c2}hhhyNMMNy${c1}ssssssssssss${c2}yNMMMy${c1}sssssss+              \n" &&
	printf "    .ssssssss${c2}dMMMNh${c1}ssssssssss${c2}hNMMMd${c1}ssssssss.              \n" &&
	printf "     \ssssssss${c2}hNMMM${c1}yh${c2}hyyyyhdNMMMNh${c1}ssssssss/              \n" &&
	printf "      +sssssssss${c2}dm${c1}yd${c2}MMMMMMMMddddy${c1}ssssssss+              \n" &&
	printf "       \sssssssssss${c2}hdmNNNNmyNMMMMh${c1}ssssss/              \n" &&
	printf "        .ossssssssssssssssss${c2}dMMMNy${c1}sssso.              \n" &&
	printf "          -+sssssssssssssssss${c2}yyy${c1}ssss+-              \n" &&
	printf "            \`:+ssssssssssssssssss+:\`              \n" &&
	printf "                .-\+oossssoo+/-.              \n" &&
	printf "${c0}\n" &&
	printf "                ${c4}Long Live Ubuntu\041\n" &&
	printf "${c0}\n"
}

case $1 in
	--help) displayHelp; exit 0;;
esac

case $1 in
	/?) displayHelp; exit 0;;
esac

case $1 in
	--lib32) installLib32; exit 0;;
esac

case $1 in
	--xenial) installCommon; installXenial; postInstall; exit 0;;
esac

case $1 in
	--bionic) installCommon; installBionic; postInstall; exit 0;;
esac

case $1 in
	--focal) installCommon; installFocal; postInstall; exit 0;;
esac

case $1 in
	--jammy) installCommon; installJammy; postInstall; exit 0;;
esac

case $1 in
	--lunar) installCommon; installLunar; postInstall; exit 0;;
esac

case $1 in
	--debian) installCommonDebian; installDebian; postInstall; exit 0;;
esac

case $1 in
	--logo) postInstall; exit 0;;
esac

printf "\n" &&
printf "${bold}${GRE}Script to install useful packages on Ubuntu.${c0}\n" &&
printf "\n" &&
printf "${bold}${YEL}Use the --lib32 flag to enable 32 bit support. (Recommended to run this first)${c0}\n" &&
printf "${bold}${YEL}Use these flags for your corresponding Ubuntu release:${c0}\n" &&
printf "\n" &&
printf "${bold}${YEL}  --xenial | Ubuntu 16.04, Codename \"Xenial Xerus\"${c0}\n" &&
printf "${bold}${YEL}  --bionic | Ubuntu 18.04, Codename \"Bionic Beaver\"${c0}\n" &&
printf "${bold}${YEL}  --focal  | Ubuntu 20.04, Codename \"Focal Fossa\"${c0}\n" &&
printf "${bold}${YEL}  --jammy  | Ubuntu 22.04, Codename \"Jammy Jellyfish\"${c0}\n" &&
printf "${bold}${YEL}  --lunar (Ubuntu 23.04, Codename \"Lunar Lobster\".${c0}\n" &&
printf "${bold}${YEL}  --debian (Debian 12.1, Codename \"Bookworm\".${c0}\n" &&
printf "\n"

exit 0
