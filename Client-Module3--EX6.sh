#!/bin/bash
apt-get update && apt-get install rsyslog -y
systemctl enable rsyslog
echo "*.warning @@192.168.1.2:514" >> /etc/rsyslog.conf
systemctl restart rsyslog
logger -p user.warning "Test log from $HOSTNAME"
