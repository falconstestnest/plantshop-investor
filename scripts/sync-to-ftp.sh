#!/bin/bash
# Sync the built index.html to the live FTP server
# Run this only after changes have been reviewed on Vercel.

set -e

# === CONFIGURE THESE ===
FTP_HOST="13.202.141.247"
FTP_USER="invest_user"
FTP_PASS="Kwa4WRiXyjNEDzJy"
REMOTE_PATH="index.html"
# =======================

LOCAL_FILE="public/index.html"

if [ ! -f "$LOCAL_FILE" ]; then
  echo "Error: $LOCAL_FILE not found. Run from the project root."
  exit 1
fi

echo "Uploading $LOCAL_FILE to ftp://$FTP_HOST/$REMOTE_PATH ..."

curl -T "$LOCAL_FILE" \
  -u "$FTP_USER:$FTP_PASS" \
  "ftp://$FTP_HOST/$REMOTE_PATH" \
  --ftp-create-dirs

echo "✅ Uploaded successfully to live FTP."
echo "Note: You may need to wait for Cloudflare cache to clear or hard refresh."
