Steps:

1. Install Raspberry Pi OS (debian) to an sd card
2. Boot the Pi with the sd card inserted
3. Connect to the internet (can use nmcli for this, sudo nmcli dev wifi connect "SSID" password "PASSWORD")
5. Clone this repo to your home dir
6. Edit scripts/setup.sh so that "REAL_USERNAME" equals the user you setup during OS installation
7. Run the setup script (cd scripts && ./setup.sh)
8. Reboot
9. Done!
