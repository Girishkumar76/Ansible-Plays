#!/bin/bash
# 1. Create a staging directory
mkdir -p ~/alpine-overlay/etc/apk
mkdir -p ~/alpine-overlay/etc/ssh
mkdir -p ~/alpine-overlay/etc/profile.d
mkdir -p ~/alpine-overlay/etc/runlevels/default

# 2. Tell Alpine to install the OpenSSH server on boot
echo "openssh" > ~/alpine-overlay/etc/apk/world
echo "alpine-base" >> ~/alpine-overlay/etc/apk/world

# 3. Tell Alpine to start SSHD automatically
ln -s /etc/init.d/sshd ~/alpine-overlay/etc/runlevels/default/sshd

# 4. Configure SSH to allow root login with an empty password (Lab Environment Only!)
echo "PermitRootLogin yes" > ~/alpine-overlay/etc/ssh/sshd_config
echo "PermitEmptyPasswords yes" >> ~/alpine-overlay/etc/ssh/sshd_config

# 5. Remove the root password entirely
echo 'root::19000:0:99999:7:::' > ~/alpine-overlay/etc/shadow
chmod 600 ~/alpine-overlay/etc/shadow

# 6. Create the dynamic greeting script to fulfill your success criteria!
cat << 'EOF' > ~/alpine-overlay/etc/profile.d/motd.sh
#!/bin/sh
# Clear the default Alpine MOTD
cat /dev/null > /etc/motd

# Grab the IP and Hostname
IP=$(ip -4 addr show eth0 | awk '/inet / {print $2}' | cut -d/ -f1)
VM_NAME=$(hostname)

# Display the requested greeting
echo ""
echo "Welcome to $VM_NAME with $IP"
echo ""
EOF
chmod +x ~/alpine-overlay/etc/profile.d/motd.sh

# 7. Package it all up and put it on the web server
cd ~/alpine-overlay
tar -czvf /var/www/html/alpine.apkovl.tar.gz *
