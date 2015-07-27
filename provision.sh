
#---------------------------------------------------
# provisioning script for centos/7 box from upstream
#---------------------------------------------------
#
#
# this catches up, installs a GNOME Desktop environment,
# and then installs the VirtualBox Guest Additions
#
# there is a little manual step in there because the path to
# the guest additions .iso file is not known (by me) so I have
# the Vagrantfile provisioning the device to have no medium in it
#
# - do 'vagrant up' and the provisioning will start
# - when you see the yum update and yum transactions in the VB gui
#     then select the 'devices->insert guest additions cd' menu pick
#     so the iso image is attached to the device when provisioning gets
#     to that step.
# - the provisioning should work, you might see an error unmounting
#     the device at the very end (I think it does it automatically)
# - at the end of provisioning, login as vagrant/vagrant and startx
#     and the VM should work fullscreen and have mouse auto capture etc.
# - subsequent reboots will come up to the graphical desktop
#


# TO DO:
#    - how to cause the additions image to be attached to that device

# catch up to patches
sudo yum update -y

# add a graphical desktop, make it the default
sudo yum groupinstall -y "GNOME Desktop" "Graphical Administration Tools"
sudo systemctl set-default graphical.target

# for installing Virtual Box Additions
# do this second so Xwindows is there before the additions run
sudo yum install -y bzip2 gcc kernel-devel
sudo mount /dev/sr0 /mnt
sudo sh /mnt/VBoxLinuxAdditions.run
sudo umount /dev/sr0 /mnt

# at this point, you should be able to login as vagrant and startx
# and have full VirtualBox Additions functionality

# on the next reboot, the system will be running the graphical.target


