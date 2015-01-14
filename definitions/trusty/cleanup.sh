apt-get -y autoremove
apt-get -y clean

echo "cleaning up dhcp leases"
rm /var/lib/dhcp/*

echo "cleaning up udev rules"
rm -f /etc/udev/rules.d/70-persistent-net.rules
mkdir /etc/udev/rules.d/70-persistent-net.rules
rm -rf /dev/.udev/
rm /lib/udev/rules.d/75-persistent-net-generator.rules

echo "cleaning up veewee scripts"
rm /home/vagrant/*.sh

echo "pre-up sleep 2" >> /etc/network/interfaces

dd if=/dev/zero of=/EMPTY bs=1M
rm -f /EMPTY

exit
