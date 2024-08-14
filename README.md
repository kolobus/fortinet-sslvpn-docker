# Fortinet SSL VPN

Docker wrapper for Fortinet SSL VPN client. Uses very old binary of VPN CLI and "expect" scripting to bypass interactive configuration requirement. Can be used as tunnel to access Fortinet protected area, just configure routing to use container as route destination.

Configuration env variables: $VPN_SERVER, $VPN_PORT, $VPN_USER, $VPN_PASS
