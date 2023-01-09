# raspberry-setup

## Prerequisites

- Raspberry Pi with Hifiberry soundcard
- [Raspberry Pi OS with desktop and recommended software](https://www.raspberrypi.com/software/operating-systems/) is installed on the SD card
- Activated SSH
- Connected to the network
- Optional: Do not use the default user `pi` but rename / create a separate user. See [
  Let's talk about anti virus and anti malware](https://forums.raspberrypi.com/viewtopic.php?t=178467) 

> Recommendation: Install image on SD card and apply mentioned settings via [Raspberry Pi Imager](https://www.raspberrypi.com/software/)

## Use the script

1. Connect to the raspberry via SSH. Clone this repository via 

```
git clone https://github.com/xyqa/raspberry-setup
```

2. Go into the cloned folder

```
cd raspberry-setup
```

3. Run the script

```
sh setup.sh
```