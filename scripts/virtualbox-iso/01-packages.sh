#!/bin/sh -x
#

# Install basic set of packages
yum -y install @core epel-release authconfig audit deltarpm sudo chrony \
  cloud-init cloud-utils-growpart dracut-config-generic dracut-norescue \
  firewalld git grub2 kernel nfs-utils rsync tar yum-utils tuned dnsmasq \
  gdisk gnutls libselinux-python libyaml lsof lvm2 m2crypto libmcrypt \
  python-backports python-backports-ssl_match_hostname python-chardet \
  python-crypto python-jinja2 python-msgpack python-ordereddict \
  python-requests python-six python-setuptools python-urllib3 python-zmq \
  PyYAML screen unzip vim-common vim-enhanced wget yum-utils zeromq3 zip \
  python3

# Remove the packages we don't want or need in our base image
yum -y remove hwdata linux-firmware dracut-config-rescue NetworkManager \
  aic94xx-firmware alsa-firmware alsa-lib alsa-tools-firmware biosdevname \
  iprutils ivtv-firmware iwl100-firmware iwl1000-firmware iwl105-firmware \
  iwl135-firmware iwl2000-firmware iwl2030-firmware iwl3160-firmware \
  wl3945-firmware iwl4965-firmware iwl5000-firmware iwl5150-firmware \
  iwl6000-firmware iwl6000g2a-firmware iwl6000g2b-firmware iwl6050-firmware \
  iwl7260-firmware libertas-sd8686-firmware libertas-sd8787-firmware \
  libertas-usb8388-firmware plymouth --setopt="clean_requirements_on_remove=1"

# Patch up to latest minor release if needed
yum update -y

# pip comes from epel, so this needs to be installed after that.
yum install -y python-pip
pip install --upgrade pip
pip install ansible
