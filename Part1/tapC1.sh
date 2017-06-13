echo "Creating Tap0"
sudo tunctl -t tap0 -u cesar
sudo ip link set tap0 up
sudo ip add add 11.0.5.2/24 dev tap0
echo "Created Tap0"

echo "configurant rutes i multicast_tap0"
sudo route add -net 11.0.5.0 netmask 255.255.255.0 dev tap0 
sudo route add -net 224.0.0.0 netmask 224.0.0.0 dev tap0
sudo route add -net 12.1.0.0 netmask 255.255.255.0 gw 11.0.5.1
sudo route add -net 11.0.6.0 netmask 255.255.255.0 gw 11.0.5.1
sudo sysctl net.ipv4.icmp_echo_ignore_broadcasts=0
sudo smcroute-0.92/bin/smcroute -d
sudo smcroute-0.92/bin/smcroute -j tap0 224.0.1.111
echo "rutes OK" 
echo "multicast OK"


