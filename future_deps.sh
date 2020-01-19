#!/bin/sh -e

sudo sh -c 'echo APT::Default-Release "bionic"\; >> /etc/apt/apt.conf'
sudo sh -c 'echo deb http://archive.ubuntu.com/ubuntu eoan main restricted universe multiverse >> /etc/apt/sources.list'
sudo sh -c 'echo "Package: scdoc
Pin: release n=eoan
Pin-Priority: 900

Package: meson
Pin: release n=eoan
Pin-Priority: 900
" >> /etc/apt/preferences'
