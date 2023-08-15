# Install Docker
# --------------
mkdir ~/docker

curl -fsSL https://get.Docker.com -o ~/docker/get-docker.sh
sudo sh ~/docker/get-docker.sh

## add user to docker usergroup and reload
sudo usermod -aG docker $USER
newgrp docker