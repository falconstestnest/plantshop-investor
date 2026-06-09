#!/bin/bash
#
# SAFE SYNC SCRIPT - Plantshop Investor Site
# 
# This script pushes to the REAL LIVE FTP only after multiple safety checks
# and explicit double confirmation from you.
#
# Recommended flow:
#   1. Make changes in this repo
#   2. Push to GitHub → Vercel gives you a preview
#   3. Review thoroughly on Vercel
#   4. Only when you're 100% sure → run this script
#

set -e

# ====================== CONFIGURATION ======================
FTP_HOST="${FTP_HOST:-13.202.141.247}"
FTP_USER="${FTP_USER:-invest_user}"
REMOTE_PATH="${REMOTE_PATH:-index.html}"
LOCAL_FILE="public/index.html"

# Safety: require clean working tree and being on main by default
REQUIRE_CLEAN_GIT=true
REQUIRE_MAIN_BRANCH=true
# ===========================================================

echo "=========================================="
echo "  PLANTSHOP INVESTOR - LIVE FTP DEPLOY"
echo "=========================================="
echo ""
echo "This will OVERWRITE the production site on the real FTP server."
echo "Target: ftp://${FTP_HOST}/${REMOTE_PATH}"
echo ""

# --- Pre-flight safety checks ---
if [ ! -f "$LOCAL_FILE" ]; then
  echo "❌ Error: $LOCAL_FILE not found."
  echo "   Make sure you are running this from the project root (~/plantshop-investor)."
  exit 1
fi

CURRENT_BRANCH=$(git rev-parse --abbrev-ref HEAD 2>/dev/null || echo "unknown")
if [ "$REQUIRE_MAIN_BRANCH" = true ] && [ "$CURRENT_BRANCH" != "main" ]; then
  echo "❌ Safety check failed: You are on branch '$CURRENT_BRANCH', not 'main'."
  echo "   It is strongly recommended to only deploy from main."
  read -p "   Type 'I know what I am doing' to continue anyway: " FORCE
  if [ "$FORCE" != "I know what I am doing" ]; then
    echo "Aborted."
    exit 1
  fi
fi

if [ "$REQUIRE_CLEAN_GIT" = true ]; then
  if ! git diff --quiet || ! git diff --cached --quiet; then
    echo "❌ Safety check failed: You have uncommitted changes."
    git status --short
    echo ""
    read -p "   Type 'deploy anyway' to continue with dirty working tree: " FORCE
    if [ "$FORCE" != "deploy anyway" ]; then
      echo "Aborted."
      exit 1
    fi
  fi
fi

# Show what we're about to deploy
echo "Last commit to be deployed:"
git log -1 --pretty=format:"  %h - %s (%cr) <%an>" 
echo ""
echo ""

FILE_SIZE=$(du -h "$LOCAL_FILE" | cut -f1)
echo "File to upload: $LOCAL_FILE ($FILE_SIZE)"
echo ""

# --- FIRST CONFIRMATION ---
echo "⚠️  You are about to push to the LIVE production FTP server."
read -p "Are you sure you want to continue? (yes/no): " CONFIRM1

if [ "$CONFIRM1" != "yes" ]; then
  echo "Deployment cancelled."
  exit 0
fi

# --- SECOND (DOUBLE) CONFIRMATION ---
echo ""
echo "This is your final confirmation."
echo "To proceed, type exactly: DEPLOY TO LIVE FTP"
read -p "> " CONFIRM2

if [ "$CONFIRM2" != "DEPLOY TO LIVE FTP" ]; then
  echo "Confirmation phrase did not match. Deployment cancelled."
  exit 0
fi

echo ""
echo "Proceeding with upload..."

# --- Actual upload ---
# Credentials can be passed via environment variables for better security:
#   FTP_USER=xxx FTP_PASS=yyy ./scripts/sync-to-ftp.sh
if [ -z "$FTP_PASS" ]; then
  echo "FTP password not found in environment."
  read -s -p "Enter FTP password for ${FTP_USER}: " FTP_PASS
  echo ""
fi

curl -T "$LOCAL_FILE" \
  -u "${FTP_USER}:${FTP_PASS}" \
  "ftp://${FTP_HOST}/${REMOTE_PATH}" \
  --ftp-create-dirs \
  --silent --show-error --fail

echo ""
echo "✅ Successfully uploaded to live FTP."
echo ""
echo "Important:"
echo "  • Cloudflare may still be serving the old version for a while."
echo "  • Do a hard refresh or wait for cache to expire on the live site."
echo "  • Consider adding a note in your commit or Vercel deployment about this FTP push."
echo ""
