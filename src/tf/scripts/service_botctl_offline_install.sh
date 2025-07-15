#!/bin/bash
set -e

# Watch for the botctl installation log file
cat << 'EOF' > /etc/systemd/system/qca-botctl-install-watcher.path
[Unit]
Description=Watch for botctl installation completion

[Path]
PathExists=/opt/aibot_installation.log
Unit=qca-post-install.service

[Install]
WantedBy=multi-user.target
EOF

# Execute after install-botctl.service
cat << 'EOF' > /etc/systemd/system/qca-post-install.service
[Unit]
Description=Run qca-botctl-post-install tasks
Requires=install-botctl.service
After=install-botctl.service

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
echo "Post-install script running..." | tee -a /var/log/qca-botctl-post-install.log

# Check the last line log and Wait for botctl installation to complete
while ! tail -n 1 /opt/aibot_installation.log | grep -q "Service completed. Press Ctrl+Alt+Del to reboot."; do
  echo "$(date '+%Y-%m-%d %H:%M:%S') Waiting for botctl installation to complete..." | tee -a /var/log/qca-botctl-post-install.log
  sleep 10
done

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
systemctl enable qca-botctl-install-watcher.path

if [[ -x /usr/bin/botctl ]]; then
  /usr/bin/botctl install --mode=offline
fi
