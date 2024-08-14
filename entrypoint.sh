#!/bin/bash

# Create /dev/ppp device node
if [ ! -c /dev/ppp ]; then
  mknod /dev/ppp c 108 0
fi

cat << EOF > /tmp/expect
#!/usr/bin/expect -f
match_max 1000000
set timeout -1
spawn /forticlientsslvpn/64bit/forticlientsslvpn_cli --server $VPN_SERVER:$VPN_PORT --vpnuser $VPN_USER --keepalive
expect "Password for VPN:"
send -- "$VPN_PASS"
send -- "\r"
expect "Would you like to connect to this server? (Y/N)"
send -- "Y"
send -- "\r"
expect "Clean up..."
close
EOF

chmod 500 /tmp/expect
/usr/bin/expect -f /tmp/expect

# Clean exp script as it includes VPN creds
rm -f /tmp/expect
