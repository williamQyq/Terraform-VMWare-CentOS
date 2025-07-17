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
  nohup /usr/bin/botctl install --mode=offline & > /var/log/qca_post_install.log 2>&1 &
  sleep 1
  echo '📦 Botctl offline install started in background.'
fi

exit 0