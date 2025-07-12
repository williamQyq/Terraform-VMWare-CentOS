#!/bin/bash

# Wait for cloud-init to complete
while [ ! -f /var/lib/cloud/instance/boot-finished ]; do
  echo 'Waiting for cloud-init...'
  sleep 1
done
echo 'Cloud-init finished...'

# Start botctl offline install systemd service
echo 'Running post install'
chmod +x /opt/service_botctl_offline_install.sh
nohup /opt/service_botctl_offline_install.sh > /var/log/setup_post_service.log 2>&1 &
sleep 1
echo '📦 Script launched in background, Terraform exiting before IP changes.'
