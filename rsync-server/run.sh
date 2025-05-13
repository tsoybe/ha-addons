#!/usr/bin/bash
echo "##############################"

if [ ! -f "/etc/rsync.conf" ]; then
   cat <<EOF > /etc/rsync.conf
use chroot = false
hosts allow = 0.0.0.0/0

transfer logging = true
log file = /var/log/rsyncd.log
log format = %h %o %f %l %b
EOF
    echo "Standardkonfig erstellt."
else
    echo "Konfig gefunden:"
    echo "################"
fi

exec /usr/bin/rsync --no-detach --daemon
echo "############# END #############"
