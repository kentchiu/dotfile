# Wireplumber 配置

## 問題背景

### 問題 1: Firefox 音量在 Seek 時跳動

**現象**：在 Arch Linux + Hyprland 環境下，Firefox 播放影片時，每次拖動進度條（seek）會導致系統音量跳到與網站 player 音量相關的特定值。

**根本原因**：

- Firefox 在 seek 時會重建音頻流（sink-input ID 改變）
- 重建時 Firefox 把網站 player 音量傳給 PipeWire 作為新流的初始值
- Chromium 沒有此問題（不會在 seek 時重建流）

**實驗證據**：

| Player 音量 | 系統跳到 |
| ----------- | -------- |
| 6%          | 34%      |
| 50%         | 73%      |
| 100%        | 92%      |

### 問題 2: 藍牙耳機切換

**現象**：當切換到藍牙耳機（Redmi Buds 6）時，keyboard 和 waybar 的音量控制仍然控制 HDA Intel PCH，而不是當前播放的藍牙設備。

**需求**：

- 預設輸出：HDA Intel PCH
- 藍牙連線時：自動切換到 Redmi Buds 6
- 藍牙斷開時：自動切回 HDA Intel PCH
- 音頻流跟隨預設設備切換

## 解決方案

### 方案 1: 統一音量控制 (`50-stream-volume-policy.conf`)

**策略**：放棄控制個別應用程式音量，統一使用主音量控制。

```
┌─────────────────────────────────────────┐
│  Player 100% → Playback 100% → 主音量   │
└─────────────────────────────────────────┘
```

**使用方式**：

- 網站 player 固定 **100%**
- 只用主音量（Output Device）控制整體音量

### 方案 2: 藍牙自動切換 (`51-bluetooth-autoswitch.conf`)

**策略**：透過 priority.session 控制設備優先級。

| 設備          | priority.session |
| ------------- | ---------------- |
| 藍牙設備      | 2000             |
| HDA Intel PCH | 1500             |
| 其他 USB 設備 | 預設 (~1000)     |

## 配置文件說明

### `50-stream-volume-policy.conf`

```conf
wireplumber.settings = {
  node.stream.restore-props = false      # 不記憶個別應用程式音量
  node.stream.default-playback-volume = 1.0  # 新流預設 100%
}
```

### `51-bluetooth-autoswitch.conf`

```conf
# 藍牙設備高優先級
monitor.bluez.rules = [
  {
    matches = [ { device.name = "~bluez_card.*" } ]
    actions = { update-props = { priority.session = 2000 } }
  }
]

# HDA Intel PCH 設為預設 fallback
monitor.alsa.rules = [
  {
    matches = [ { node.name = "alsa_output.pci-0000_00_1f.3.hdmi-stereo" } ]
    actions = { update-props = { priority.session = 1500 } }
  }
]

# 音頻流自動跟隨預設設備切換
wireplumber.settings = {
  linking.follow-default-target = true
}
```

### `51-rename-usb-audio.conf`

將 USB 音頻設備重新命名為 JAZZ UB720，方便識別。

## 行為總結

| 狀態     | 預設輸出      | 音量控制      |
| -------- | ------------- | ------------- |
| 藍牙斷開 | HDA Intel PCH | HDA Intel PCH |
| 藍牙連線 | Redmi Buds 6  | Redmi Buds 6  |

| 動作             | 結果                 |
| ---------------- | -------------------- |
| 調整 player 音量 | wiremix 即時顯示變化 |
| seek 或重新播放  | 回到 player 當前音量 |
| 調整主音量       | 控制整體音量         |

## 參考資料

- [Arch Wiki - PipeWire](https://wiki.archlinux.org/title/PipeWire)
- [Wireplumber Documentation](https://pipewire.pages.freedesktop.org/wireplumber/)
