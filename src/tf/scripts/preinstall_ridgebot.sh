#!/bin/bash

# Wait for cloud-init to complete
while [ ! -f /var/lib/cloud/instance/boot-finished ]; do
  echo 'Waiting for cloud-init...'
  sleep 1
done
echo 'Cloud-init finished...'

echo 'Running post install...'

# Start botctl offline install systemd service
if [[ -x /usr/bin/botctl ]]; then
  nohup /usr/bin/botctl install --mode=offline &
  sleep 1
  echo '📦 Botctl offline install started in background.'
  exit 0
fi