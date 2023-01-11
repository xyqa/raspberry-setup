XYQA_RASPBERRY_SETUP_PATH=$(pwd)

source config.txt

# upgrade all packages
sudo apt-get update
sudo apt-get upgrade

# Install Hifiberry Sound card
# ---------------------------<
## Disable driver for onboard sound & enable Hifiberry Soundcard
sudo sed -i 's/dtparam=audio=on/#dtparam=audio=on\ndtoverlay=hifiberry-dacplus/' /boot/config.txt

source setup_spotifyd.sh

# Install Docker
mkdir ~/docker

curl -fsSL https://get.Docker.com -o ~/docker/get-docker.sh
sudo sh ~/docker/get-docker.sh
# Install Homeassistant


# TODO: install homeassistant via docker

# TODO: install pihole

sudo reboot
