#!/bin/sh

apk add --no-cache samba
adduser -D homelab
echo -e "1234\n1234" | smbpasswd -a homelab

mkdir -p /share/public /share/private
chmod -R 777 /share/public
chmod -R 770 /share/private

exec smbd --foreground --no-process-group
