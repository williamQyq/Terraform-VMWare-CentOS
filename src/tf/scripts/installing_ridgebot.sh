#!/bin/bash

# List of required systemd services
services=(
  vsyslogd api upgrade vktd carrier dispatcher backup knowledge
  lscdetection monitor attackchain hostscan report systeminfo
  tasks task-summary timed-backup logagent taskevent attackack
  knowledgehook dag-worker
)

# Services to exclude from checking
excluded_services=(
  assembler
  worker
  dispatcher
  task-summary
)

# Max wait time per service (seconds)
max_wait=1800
interval=5

# Function to wait for a single service
wait_for_service() {
  local svc="$1"
  local waited=0

  echo "⏳ Waiting for service: $svc"

  while ! systemctl is-active --quiet "$svc";  do
    if (( waited >= max_wait )); then
      echo "❌ Timeout waiting for $svc after $max_wait seconds."
      return 1
    fi
    sleep $interval
    (( waited += interval ))
  done

  echo "✅ $svc is active."
  return 0
}

# Filter out excluded services
filtered_services=()
for service in "${services[@]}"; do
  skip=false
  for excluded in "${excluded_services[@]}"; do
    if [[ "$service" == "$excluded" ]]; then
      skip=true
      break
    fi
  done
  if ! $skip; then
    filtered_services+=("$service")
  fi
done

# Main loop
all_ok=true

for service in "${filtered_services[@]}"; do
  if ! wait_for_service "$service"; then
    all_ok=false
  fi
done

if $all_ok; then
  echo "✅ All services are active."
else
  echo "⚠️ Some services failed to start."
fi

while ! tail -n 1 /opt/aibot_installation.log | grep -q "Service completed. Press Ctrl+Alt+Del to reboot."; do
  echo "$(date '+%Y-%m-%d %H:%M:%S') Waiting for botctl installation to complete..."
  sleep 5
done

echo "Removed root from otpusers group"
gpasswd -d root otpusers

nmcli device disconnect ens192
sleep 1
nmcli device connect ens192
