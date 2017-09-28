#!/bin/bash

dpkg -s nxos-desktop-settings &> /dev/null

if [ $? ]; then
    find . -iname 'org.nxos.installer.desktop' -delete
    sed -i 's/source .clean_user_home.sh//g' ~/.bashrc
    rm .clean_user_home.sh
fi;
