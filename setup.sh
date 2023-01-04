# upgrade all packages
sudo apt-get update
sudo apt-get upgrade

# Install Hifiberry Soundcard
# ---------------------------
## Disable driver for onboard sound
sudo sed -i 's/dtparam=audio=on/#dtparam=audio=on/' /boot/config.txt

## Enable Hifiberry Soundcard
echo "\n[CUSTOM]\ndtoverlay=hifiberry-dacplus\n" | sudo tee -a /boot/config.txt


# Install raspotify: https://github.com/dtcooper/raspotify
# --------------------------------------------------------
## Install service
sudo apt-get -y install curl && curl -sL https://dtcooper.github.io/raspotify/install.sh | sh

## Set settings
sudo sed -i 's/#LIBRESPOT_NAME="Librespot"/LIBRESPOT_NAME="Stereoanlage"/' /etc/raspotify/conf
sudo sed -i 's/#LIBRESPOT_BITRATE="160"/LIBRESPOT_BITRATE="320"/' /etc/raspotify/conf

# Copy raspotify config file
sudo systemctl restart raspotify

# TODO Optionally Install higher quality sample rate converters

# Login via /etc/default/raspotify


# TODO: ALSAMIXER VOLUME TO 100

# TODO: install homeassistant via docker

# TODO: install pihole