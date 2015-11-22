#!/bin/sh
# Copyright (C) 2006-2011 OpenWrt.org

if ( ! grep -qsE '^root:[!x]?:' /etc/shadow || \
     ! grep -qsE '^root:[!x]?:' /etc/passwd ) && \
   [ -z "$FAILSAFE" ]
then
	echo "WARNING: passwords are sent unencrypted."
	busybox login
else
cat << EOF
 === IMPORTANT ============================
  Use 'passwd' to set your login password
  this will enable telnet login with password
 ------------------------------------------
EOF

exec /bin/ash --login
fi
