#!/bin/bash
my_uuid=$(</home/sshuser/client.uuid)

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
Systemctl restart netdata
