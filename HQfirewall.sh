#/bin/bash

iptables -t nat -A PREROUTING -d 172.16.1.0/28 -p tcp --dport 8080 -j DNAT --to-destination 192.168.1.2:80
iptables -t nat -A PREROUTING -d 172.16.1.0/28 -p tcp --dport 2026 -j DNAT --to-destination 192.168.1.2:2026
iptables -t nat -A POSTROUTING -s 192.168.1.0/27 -o eth0 -j MASQUERADE

iptables -t filter -A INPUT -p tcp -m tcp --dport 2026 -j ACCEPT
iptables -t filter -A INPUT -p tcp -m tcp --dport 53 -j ACCEPT
iptables -t filter -A INPUT -p udp -m udp --dport 53 -j ACCEPT
iptables -t filter -A INPUT -p tcp -m tcp --dport 443 -j ACCEPT
iptables -t filter -A INPUT -p tcp -m tcp --dport 80 -j ACCEPT
iptables -t filter -A INPUT -p tcp -m tcp --dport 123 -j ACCEPT
iptables -t filter -A INPUT -p udp -m udp --dport 123 -j ACCEPT
iptables -t filter -A INPUT -p icmp -j ACCEPT
iptables -t filter -A INPUT -s 10.0.0.0/30 -j ACCEPT
iptables -t filter -A INPUT -s 172.16.1.0/28 -j ACCEPT
iptables -t filter -A INPUT -p esp -j ACCEPT
iptables -A INPUT -m state --state ESTABLISHED,RELATED -j ACCEPT
iptables -t filter -A INPUT -j DROP
