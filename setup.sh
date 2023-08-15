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

source setup_docker.sh

# Install Home Assistant
# ----------------------
mkdir ~/homeassistant
docker run -d \
  --name homeassistant \
  --privileged \
  --restart=unless-stopped \
  -e TZ=Europe/Berlin \
  -v ~/homeassistant/config:/config \
  --network=host \
  ghcr.io/home-assistant/home-assistant:stable

# TODO: install homeassistant via docker

# TODO: install pihole

sudo reboot
