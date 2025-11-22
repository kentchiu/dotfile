#!/bin/bash
# 手動掛載 am62x 的腳本

MOUNT_POINT="$HOME/dev/am62x"
REMOTE_PATH="am62x:/home/alientek/kent"

# 檢查是否已掛載
if mountpoint -q "$MOUNT_POINT"; then
    echo "✓ 已經掛載在 $MOUNT_POINT"
    exit 0
fi

# 建立掛載點
mkdir -p "$MOUNT_POINT"

# 執行掛載
echo "正在掛載 $REMOTE_PATH 到 $MOUNT_POINT ..."
sshfs "$REMOTE_PATH" "$MOUNT_POINT" \
  -o reconnect,ServerAliveInterval=15,ServerAliveCountMax=3

if [ $? -eq 0 ]; then
    echo "✓ 掛載成功"
else
    echo "✗ 掛載失敗，請檢查："
    echo "  1. VM am62x 是否已啟動"
    echo "  2. SSH 連線是否正常: ssh am62x 'pwd'"
    exit 1
fi
