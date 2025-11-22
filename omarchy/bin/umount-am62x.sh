#!/bin/bash
# 手動卸載 am62x 的腳本

MOUNT_POINT="$HOME/dev/am62x"

if ! mountpoint -q "$MOUNT_POINT"; then
    echo "✓ 目前沒有掛載"
    exit 0
fi

echo "正在卸載 $MOUNT_POINT ..."
fusermount -u "$MOUNT_POINT"

if [ $? -eq 0 ]; then
    echo "✓ 卸載成功"
else
    echo "✗ 卸載失敗，嘗試強制卸載..."
    fusermount -uz "$MOUNT_POINT"
    if [ $? -eq 0 ]; then
        echo "✓ 強制卸載成功"
    else
        echo "✗ 強制卸載失敗，請檢查是否有程式正在使用該掛載點"
        exit 1
    fi
fi
