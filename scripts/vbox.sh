mkdir ~/vbox_guest
sudo mount -o loop -t iso9660 ~/VBoxGuestAdditions.iso ~/vbox_guest

yes yes | sudo ~/vbox_guest/VBoxLinuxAdditions.run

sudo umount ~/vbox_guest
rm -f ~/VBoxGuestAdditions.iso
rm -rf ~/vbox_guest
