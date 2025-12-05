#!/bin/sh

apk add --no-cache samba samba-common-tools
adduser -D homelab

# define senha Samba corretamente usando printf
printf "1234\n1234\n" | smbpasswd -a homelab

# habilitar usuario no Samba
smbpasswd -e homelab

mkdir -p /share/public /share/private
chown -R homelab:homelab /share/private
chmod -R 777 /share/public
chmod -R 770 /share/private

# Logging
mkdir -p /var/log/samba

nmbd &
exec smbd --foreground --no-process-group
