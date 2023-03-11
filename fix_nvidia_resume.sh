#!/bin/bash

sudo systemctl stop nvidia-suspend.service &&
sudo systemctl stop nvidia-hibernate.service &&
sudo systemctl stop nvidia-resume.service &&
printf "\n" &&
sudo systemctl disable nvidia-suspend.service &&
sudo systemctl disable nvidia-hibernate.service &&
sudo systemctl disable nvidia-resume.service &&
printf "\n" &&
sudo rm -v -f /lib/systemd/system-sleep/nvidia &&
printf "\n" &&
sudo systemctl status nvidia-resume.service &&

exit 0
