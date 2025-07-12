#!/bin/bash
set -e

# Write the post-install service unit
# Execute after install-botctl.service created by botctl install
cat << 'EOF' > /etc/systemd/system/post-install.service
[Unit]
Description=Run post-install tasks
After=install-botctl.service
Requires=install-botctl.service

[Service]
Type=oneshot
ExecStart=/usr/local/bin/post_install.sh
RemainAfterExit=true

[Install]
WantedBy=multi-user.target
EOF
# Write the post-install logic script
cat << 'EOF' > /usr/local/bin/post_install.sh

#!/bin/bash
echo "Post-install script running..." | tee -a /var/log/post-install.log

gpasswd -d root otpusers

nmcli device disconnect ens192
sleep 1
nmcli device connect ens192

/usr/sbin/reboot

EOF

chmod +x /usr/local/bin/post_install.sh

# Reload systemd and enable service
#systemctl daemon-reexec
#systemctl daemon-reload
systemctl enable post-install.service

if [[ -x /usr/bin/botctl ]]; then
  /usr/bin/botctl install --mode=offline > /var/log/botctl_install.log 2>&1 &
fi
