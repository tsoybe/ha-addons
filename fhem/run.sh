#!/usr/bin/bash

echo "##############################"

if [ ! -f "/data/fhem.cfg" ]; then
   cat <<EOF > /data/fhem.cfg
attr global nofork 1
attr global logfile -
attr global modpath .
attr global verbose 3
attr global statefile /data/fhem.save
attr global room System
define WEB FHEMWEB 8083 global
attr WEB room System
define eventTypes eventTypes ./log/eventTypes.txt
attr eventTypes room System
EOF
    echo "Standardkonfig erstellt."
else
    echo "Konfig gefunden:"
    echo "################"
    cat /data/fhem.cfg
    echo "################"
fi

cd /opt/fhem
exec /usr/bin/perl fhem.pl /data/fhem.cfg
echo "############# END #############"
