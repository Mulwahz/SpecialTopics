#!/bin/bash

# 1. Install packages 
apt update
apt install bind9 bind9utils -y

# 2. Configure forwarders
# cd /etc/bind
#nano /etc/bind/named.conf.options
#Copy template file
cp /home/netadmin/Special Topics/templates/etc/bind/named.conf.options /etc/bind/named.conf.options

# 3. Add a zone for the domain
#nano /etc/bind/named.conf.default-zones
cp /home/netadmin/Special Topics/templates/etc/bind/named.conf.default-zones /etc/bind/named.conf.default-zones

# 4. Create the zone file
#cp /etc/bind/db.local /etc/bind/db.mulwa.cns
#nano /etc/bind/db.mulwa.cns
cp /home/netadmin/Special Topics/templates/etc/bind/db.mulwa.cns /etc/bind/db.mulwa.cns

# 5. Verify Setup
named-checkconf
named-checkzone mulwa.cns /etc/bind/db.mulwa.cns

# 6. Reload Bind9 service
systemctl reload bind9
