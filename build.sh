#!/bin/bash

# Copyright (c) 2022 Alex313031.

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
	printf "${bold}${GRE}Script to build drumroll-service debian package.${c0}\n" &&
	printf "\n"
}

dpkg-deb -Zgzip --build --root-owner-group drumroll-service_1.0.2-18.04_all &&

dpkg-deb -Zgzip --build --root-owner-group drumroll-service_1.0.2-20.04_all &&

dpkg-deb -Zgzip --build --root-owner-group drumroll-service_1.0.2-22.10_all &&

dpkg-deb -Zgzip --build --root-owner-group python-is-python2

exit 0
