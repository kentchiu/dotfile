# Ubuntu Dotfile Setup Guide

## 安裝流程

### 1. 產生 SSH Key (ed25519 格式)

```bash
# 生成 SSH key (可選添加 -C "your_email@example.com" 作為註釋)
ssh-keygen -t ed25519
eval "$(ssh-agent -s)"
ssh-add ~/.ssh/id_ed25519

# 複製公鑰到剪貼板
cat ~/.ssh/id_ed25519.pub
```

### 2. 安裝必要套件

```bash
sudo apt update && sudo apt upgrade -y

sudo apt install -y \
  git \
  tmux \
  btop \
  htop \
  tree \
  gdu \
  curl \
  fzf \
  ripgrep \
  fd-find \
  build-essential
```

### 3. Clone dotfile 專案

```bash
mkdir -p ~/.config
cd ~/.config
git clone https://github.com/kentchiu/dotfile.git

# 建立符號連結
ln -sf ~/.config/dotfile/.gitconfig ~/.gitconfig
ln -sf ~/.config/dotfile/.tmux.conf ~/.tmux.conf
```

### 4. 安裝 Neovim 0.11+

Ubuntu 預設的 neovim 版本太舊，需要手動安裝最新版本：

```bash
# 移除舊版本 (如果有安裝)
sudo apt remove -y neovim

# 下載並安裝最新版 neovim (注意: 新版檔名格式已變更)
curl -LO https://github.com/neovim/neovim/releases/latest/download/nvim-linux-x86_64.tar.gz
sudo rm -rf /opt/nvim /opt/nvim-linux64
sudo tar -C /opt -xzf nvim-linux-x86_64.tar.gz

# 建立符號連結
sudo ln -sf /opt/nvim-linux-x86_64/bin/nvim /usr/local/bin/nvim

# 清理下載檔案
rm nvim-linux-x86_64.tar.gz

# 驗證版本 (應顯示 v0.11.2 或更新版本)
nvim --version
```

### 5. 配置 Tmux

```bash
# 安裝 tmux plugin manager
git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm

# 啟動 tmux
tmux

# 在 tmux 中重新載入配置
# Ctrl+b 然後輸入:
tmux source ~/.tmux.conf

# 安裝插件: Ctrl+b + I
```

### 6. 配置 Neovim

```bash
# 建立 neovim 配置符號連結
ln -sf ~/.config/dotfile/nvim ~/.config/nvim

# 啟動 neovim 並檢查健康狀態
nvim
# 在 neovim 中執行 :checkhealth
```

