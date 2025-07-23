#!/bin/bash

###############################################################################
# USER CONFIGURATION (EDIT THESE VARIABLES)
###############################################################################
#Env variables
#"VERSION=5.4.5",
#"TAG=rb\d",
#"SERVER_IP=172.30.101",
#"PORT=85"

# Log file for Packer to persist
LOG_FILE="/var/log/ridgebot-install.log"
exec > >(tee -a "$LOG_FILE") 2>&1

# Destination directory to save downloaded files
DESTINATION_PATH="/root"
BIN_PATH="/usr/bin"

# List of filenames to download from the server
FILE_LIST=(
  "botctl"
  "resource.tgz"
  "ridgebot_$VERSION.tgz"
  "venvs-en.tgz"
)

###############################################################################
# SCRIPT START (NO NEED TO EDIT BELOW THIS LINE)
###############################################################################

echo 'Installing Ridgebot...'
echo "Preparing to download files for version ${VERSION}, tag ${TAG}"
echo "From server: ${SERVER_IP}"
echo "Target directory: ${DESTINATION_PATH}"
echo "Files: ${FILE_LIST[*]}"

## Create destination directory if it doesn't exist
#mkdir -p "${DESTINATION_PATH}"

# Download each file
for file in "${FILE_LIST[@]}"; do
  FILE_URL="${SERVER_IP}:${PORT}/${VERSION}/v${VERSION}.${TAG}/${file}"

  if [[ "$file" == *.tgz ]]; then
    DEST_FILE="${DESTINATION_PATH}/${file}"
  else
    DEST_FILE="${BIN_PATH}/${file}"
  fi

  echo "Downloading: ${FILE_URL}"
  if wget --spider -q "${FILE_URL}"; then
  echo "✔ Remote file exists. Downloading..."
  wget --progress=dot:giga -O "${DEST_FILE}" "${FILE_URL}" \
    && echo "✔ Saved to ${DEST_FILE}" \
    || echo "✖ Failed to download ${file} from ${FILE_URL}" >&2
  else
    echo "✖ Remote file does not exist: ${FILE_URL}" >&2
  fi

done

chmod +x "$BIN_PATH/botctl"
#"$BIN_PATH/botctl" install --mode=offline

echo "Download complete."
