source config.txt

# upgrade all packages
sudo apt-get update
sudo apt-get upgrade

# Install Hifiberry Sound card
# ---------------------------
## Disable driver for onboard sound
sudo sed -i 's/dtparam=audio=on/#dtparam=audio=on/' /boot/config.txt

## TODO: Chose sound card as main output device


## Enable Hifiberry Soundcard
echo "\n[CUSTOM]\ndtoverlay=hifiberry-dacplus\n" | sudo tee -a /boot/config.txt


# Install spotifyd: https://github.com/Spotifyd/spotifyd
## Download & unzip
XYQA_SPOTIFYD_PATH="~/spotifyd"

mkdir XYQA_SPOTIFYD_PATH
cd XYQA_SPOTIFYD_PATH

wget https://github.com/Spotifyd/spotifyd/releases/download/v0.3.4/spotifyd-linux-armhf-default.tar.gz
tar xzf spotifyd-linux-armhf-default.tar.gz

## Systemd daemon file
sudo wget https://raw.githubusercontent.com/Spotifyd/spotifyd/master/contrib/spotifyd.service -O /etc/systemd/user/spotifyd.service
sudo sed -i "s|ExecStart\=.*|ExecStart=$XYQA_SPOTIFYD_PATH|" /etc/systemd/user/spotifyd.service

## Starting spotifyd at boot
sudo loginctl enable-linger $XYQA_USER_NAME
systemctl --user enable spotifyd.service

# Install raspotify: https://github.com/dtcooper/raspotify
# --------------------------------------------------------
## Install service
#sudo apt-get -y install curl && curl -sL https://dtcooper.github.io/raspotify/install.sh | sh

## Set settings
#sudo sed -i 's/#LIBRESPOT_NAME="Librespot"/LIBRESPOT_NAME="Stereoanlage"/' /etc/raspotify/conf
#sudo sed -i 's/#LIBRESPOT_BITRATE="160"/LIBRESPOT_BITRATE="320"/' /etc/raspotify/conf
#
#sudo sed -i 's/#LIBRESPOT_USERNAME=""/LIBRESPOT_USERNAME="$SPOTIFY_USER_NAME"/' /etc/raspotify/conf
#sudo sed -i 's/#LIBRESPOT_PASSWORD=""/LIBRESPOT_PASSWORD="$SPOTIFY_PASSWORD"/' /etc/raspotify/conf

# Copy raspotify config file
#sudo systemctl restart raspotify

# TODO Optionally Install higher quality sample rate converters

# Login via /etc/default/raspotify


# TODO: ALSAMIXER VOLUME TO 100

# TODO: install homeassistant via docker

# TODO: install pihole

sudo reboot
