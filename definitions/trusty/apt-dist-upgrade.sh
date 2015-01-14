apt-get -y update
apt-get -y dist-upgrade

# reboot so uname will report the right kernel version
service ssh stop && reboot
