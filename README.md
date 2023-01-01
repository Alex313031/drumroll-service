# drumroll-service <img

Simply a package that installs a systemd service to play the Ubuntu startup sound, which was the default from 4.04 until 17.10.
Note this is __*NOT*__ a "login sound", which is easy to do, and when I googled how to restore the __boot__ sound, all I found was how to play a sound *after* one logs in, UNTIL I finally came across this > https://askubuntu.com/questions/973680/how-to-bring-back-drum-roll-sound-in-ubuntu-17-10-when-system-is-ready-for-user/1050000

I decided to make a debian package out of it to ease installation. I included the author of that comment in the copyright file.

Sooooo.... here ya'll go. Long Live Ubuntu!

## Building

Simply run `./build.sh` \
Install with `sudo dpkg --install *name of file*`

### Note

Also in this repo is a handy script I made called `post-ubuntu.sh`, which installs handy packages for Ubuntu 16.04, 18.04, 20.04, and 22.04.
Run it without any flags, or with the `--help` flag to see how to use it.
