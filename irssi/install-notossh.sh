#!/bin/bash
git clone https://github.com/guyzmo/notossh
cd notossh
sudo python setup.py install
cd ..
sudo rm -rf notossh

kernel=`uname`
if [ "$kernel" == "Darwin" ]; then
    echo
    echo "You will need to install Growl (OSS fork) and Growlnotify "
    echo "to complete your installation."
    echo
    echo "Please visit https://bitbucket.org/pmetzger/growl/downloads"
    echo
else
    echo
    echo "You will need to install notify-send if you don't already "
    echo "have it."
    echo
fi
