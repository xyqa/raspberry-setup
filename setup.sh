XYQA_RASPBERRY_SETUP_PATH=$(pwd)

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
XYQA_SPOTIFYD_PATH="/home/$XYQA_USER_NAME/spotifyd"

mkdir $XYQA_SPOTIFYD_PATH

wget https://github.com/Spotifyd/spotifyd/releases/download/v0.3.4/spotifyd-linux-armhf-default.tar.gz -P $XYQA_SPOTIFYD_PATH
tar xzf spotifyd-linux-armhf-default.tar.gz

## Copy config file
mkdir ~/.config/spotifyd
cp $XYQA_RASPBERRY_SETUP_PATH/config/spotifyd.conf ~/.config/spotifyd/spotifyd.conf

## Systemd daemon file
sudo wget https://raw.githubusercontent.com/Spotifyd/spotifyd/master/contrib/spotifyd.service -O /etc/systemd/user/spotifyd.service
sudo sed -i "s|ExecStart\=.*|ExecStart=$XYQA_SPOTIFYD_PATH/spotifyd --no-daemon|" /etc/systemd/user/spotifyd.service

## Starting spotifyd at boot
sudo loginctl enable-linger $XYQA_USER_NAME
systemctl --user enable spotifyd.service


# TODO: ALSAMIXER VOLUME TO 100

# TODO: install homeassistant via docker

# TODO: install pihole

sudo reboot
