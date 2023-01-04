# upgrade all packages
sudo apt-get update
sudo apt-get upgrade

# Install raspotify: https://github.com/dtcooper/raspotify
sudo apt-get -y install curl && curl -sL https://dtcooper.github.io/raspotify/install.sh | sh

# Optionally Install higher quality sample rate converters
# TODO: install raspotify
# Bitrate 320
# Login via /etc/default/raspotify

sudo apt update && sudo apt install -y asound-conf-wizard

# Copy raspotify config file
sudo systemctl restart raspotify





# TODO: install hifiberry sound card
# TODO: ALSAMIXER VOLUME TO 100

# TODO: install homeassistant via docker

# TODO: install pihole