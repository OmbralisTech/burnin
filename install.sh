#!/bin/bash
set -euo pipefail

# Hard-pinned stressdisk version + expected SHA256
STRESSDISK_VERSION="1.0.13"
STRESSDISK_SHA256="PUT_CORRECT_HASH_HERE"   # ← Replace with actual sha256sum

echo "=== Burn-In Installer for Debian/Proxmox ==="

echo "[1/4] Updating apt package lists..."
apt update -y

echo "[2/4] Installing dependencies: whiptail, smartmontools, curl..."
apt install -y whiptail smartmontools curl

echo "[3/4] Installing burnin script..."
curl -sSL https://raw.githubusercontent.com/<your-username>/burnin-tool/main/burnin -o /usr/local/bin/burnin
chmod +x /usr/local/bin/burnin

echo "[4/4] Installing stressdisk v${STRESSDISK_VERSION}..."
DOWNLOAD_URL="https://github.com/ncw/stressdisk/releases/download/v${STRESSDISK_VERSION}/stressdisk_linux_x86_64"
curl -L -o /usr/local/bin/stressdisk "${DOWNLOAD_URL}"

echo "[Verifying checksum]"
echo "${STRESSDISK_SHA256}  /usr/local/bin/stressdisk" | sha256sum -c -

chmod +x /usr/local/bin/stressdisk

echo
echo "✅ Installation complete!"
echo "You can now run: burnin"
echo
