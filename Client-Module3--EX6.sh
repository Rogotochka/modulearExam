#!/bin/bash
sudo apt update
sudo apt install -y netdata
sudo systemctl enable –now netdata

my_uuid=$(uuidgen)

cat << EOF > /etc/netdata/stream.conf
[stream]
enabled = yes
destination = 192.168.1.2:19999
api key = $my_uuid
EOF

cat << EOF >> /etc/netdata/netdata.conf
[stream]
enabled = yes
accept_api_key = yes
EOF

cat << EOF > /etc/netdata/stream.conf
[$my_uuid]
enabled = yes
default history = 3600
allow from = *
EOF
