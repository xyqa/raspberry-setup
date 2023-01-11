# Install spotifyd: https://github.com/Spotifyd/spotifyd
## Download & unzip
XYQA_SPOTIFYD_PATH="/home/$USER/spotifyd"

mkdir $XYQA_SPOTIFYD_PATH

wget https://github.com/Spotifyd/spotifyd/releases/download/v0.3.4/spotifyd-linux-armhf-default.tar.gz -P $XYQA_SPOTIFYD_PATH
tar xzf $XYQA_SPOTIFYD_PATH/spotifyd-linux-armhf-default.tar.gz -C $XYQA_SPOTIFYD_PATH

## Copy config file
mkdir ~/.config/spotifyd
cp $XYQA_RASPBERRY_SETUP_PATH/config/spotifyd.conf ~/.config/spotifyd/spotifyd.conf

## Systemd daemon file
mkdir -p ~/.config/systemd/user/
sudo wget https://raw.githubusercontent.com/Spotifyd/spotifyd/master/contrib/spotifyd.service -O ~/.config/systemd/user/spotifyd.service
sudo sed -i "s|ExecStart\=.*|ExecStart=$XYQA_SPOTIFYD_PATH/spotifyd --no-daemon|" ~/.config/systemd/user/spotifyd.service
systemctl --user daemon-reload

## Starting spotifyd at boot
sudo loginctl enable-linger $USER
systemctl --user enable spotifyd.service