#!/usr/bin/env bash
# delete-clean-vm.sh
# Delete a vSphere VM/template by name (substring match) using govc.

set -euo pipefail

# ---- Config ----
# You can hardcode or load from a config file here
export GOVC_URL="https://172.16.101.242/sdk"
export GOVC_USERNAME="administrator@qca.local"
export GOVC_PASSWORD="QCA25@Office"
export GOVC_INSECURE=true

# ---- Input ----
if [ $# -ne 2 ]; then
  echo "Usage: $0 <rb-version> <rb-tag>"
  echo "Example: $0 1.0.0 rb3"
  exit 1
fi

#Threshold version
TARGET_VER="$1"
TARGET_TAG="$2"
TARGET_TAG_NUM=$(echo "$TARGET_TAG" | sed -En 's/.*rb([0-9]+)$/\1/p') #Extract number from $TARGET_TAG e.g. rb20

# ---- Locate Matching VMs ----
echo "🔍 Searching for VMs containing: $"
MATCHES=$(govc find /QCA-Office/vm/willqiao-vm/ -type m | grep -E "centos(9)?-.*")

if [ -z "$MATCHES" ]; then
  echo "❌ No VMs/templates found."
  exit 1
fi

echo "✅ Found: $MATCHES"

# ---- Loop through matches ----
for VM_PATH in $MATCHES; do
  VM_NAME=$(basename "$VM_PATH")

  # Extract version (5.5.0) and rb number (rb20)
  VERSION=$(echo "$VM_NAME" | sed -E 's/.*-([0-9]+\.[0-9]+\.[0-9]+)-rb[0-9]+.*$/\1/')
  RB_NUM=$(echo "$VM_NAME" | sed -E 's/.*-rb([0-9]+).*/\1/')

  if [[ "$VERSION" =~ ^[0-9]+\.[0-9]+\.[0-9]+$ && "$RB_NUM" =~ ^[0-9]+$ ]]; then
    # Compare versions using sort -V
    if [[ "$(printf '%s\n%s\n' "$TARGET_VER" "$VERSION" | sort -V | head -n1)" != "$TARGET_VER" ]]; then
      echo "Skipping $VM_NAME (version $VERSION >= $TARGET_VER)"
      continue
    fi

    if (( RB_NUM < TARGET_TAG_NUM )); then
      echo "🗑️  Deleting $VM_NAME (version $VERSION-rb$RB_NUM is lower than $TARGET_VER-rb$TARGET_TAG_NUM)"
      govc vm.destroy "$VM_PATH"
    else
      echo "Skipping $VM_NAME (rb$RB_NUM >= rb$TARGET_TAG_NUM)"
    fi
  else
    echo "⚠️ Could not parse version/rb from $VM_NAME"
  fi
done