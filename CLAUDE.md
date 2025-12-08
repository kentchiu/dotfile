# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## Repository Overview

這是一個跨平台個人 dotfile 配置儲存庫，主要支援 Linux (Arch) 和 macOS 環境。配置檔案透過符號連結 (symbolic links) 方式部署到使用者家目錄。

## Core Philosophy

**遵循 KISS 原則** - 所有配置以簡單、直接、易於理解為優先。避免過度複雜的配置。

## Project Structure

```
.
├── nvim/                    # Neovim 配置 (基於 LazyVim)
│   ├── init.lua            # 主要入口點
│   ├── lua/
│   │   ├── config/         # 核心配置
│   │   │   ├── lazy.lua    # Lazy.nvim 插件管理器配置
│   │   │   ├── options.lua # Vim 選項設定
│   │   │   ├── keymaps.lua # 按鍵映射
│   │   │   └── autocmds.lua # 自動命令
│   │   └── plugins/        # 自訂插件配置
│   └── lazyvim.json        # LazyVim 版本鎖定
├── hypr/                   # Hyprland 視窗管理器配置
├── kitty/                  # Kitty 終端模擬器配置
├── waybar/                 # Waybar 狀態列配置
├── fcitx5/                 # Fcitx5 輸入法配置
├── walker/                 # Walker 應用啟動器配置
├── .tmux.conf              # Tmux 配置
├── .gitconfig              # Git 配置
├── .zshrc                  # Zsh shell 配置 (macOS)
├── .wezterm.lua            # WezTerm 終端模擬器配置
├── .ideavimrc              # IntelliJ IDEA Vim 插件配置
├── .vimrc                  # 基礎 Vim 配置
├── starship.toml           # Starship prompt 配置
├── lazygit-config.yml      # Lazygit 配置
└── README.md               # 安裝說明文件
```

## Key Components

### Neovim Configuration

- **基礎框架**: LazyVim (現代化 Neovim 配置框架)
- **插件管理器**: lazy.nvim
- **版本要求**: Neovim 0.11.0+
- **特殊配置**:
  - OSC 52 clipboard 支援 (SSH 遠端複製)
  - 相對行號 + 絕對行號
  - 禁用 swap 檔案
  - 自訂 diff 選項 (histogram algorithm)

#### 重要插件模組 (nvim/lua/config/lazy.lua)

已啟用的 LazyVim extras:

- `coding.mini-surround` - 括號/引號快速編輯
- `editor.harpoon2` - 快速檔案導航
- `editor.mini-diff` - Git diff 整合
- `editor.snacks_picker` - 檔案/符號選擇器
- `editor.snacks_explorer` - 檔案瀏覽器
- `ui.mini-animate` - 平滑動畫效果
- `ui.mini-indentscope` - 縮排視覺化

自訂插件:

- `debugprint.lua` - 除錯輸出工具
- `snacks.lua` - 多功能 UI 增強

#### 自訂按鍵映射 (nvim/lua/config/keymaps.lua)

- `jk` (Insert mode) → ESC
- `gw` (Normal/Visual) → 搜尋游標下的單字
- `H` → 行首 (0^)
- `L` → 行尾 ($)
- `M` → 跳至配對符號 (%)
- `<C-a>` → 停用 (避免與 tmux leader key 衝突)

### Tmux Configuration

- **Leader Key**: `Ctrl+a` (替代預設的 `Ctrl+b`)
- **Vi Mode**: 啟用 vi 按鍵綁定
- **Vim 風格 Pane 導航**: `h/j/k/l` 切換 pane
- **歷史記錄**: 100,000 行
- **主題**: Dracula
- **狀態列**: CPU 使用率、網路頻寬
- **分割視窗**: 在當前路徑開啟新 pane

#### 主要插件

- `tmux-resurrect` + `tmux-continuum` - session 持久化
- `tmux-yank` - 系統剪貼簿整合 (支援 win32yank.exe)
- `tmux-menus` - 互動式選單
- `dracula/tmux` - Dracula 主題

#### Tmux 按鍵綁定

- Leader: `Ctrl+a`
- Pane 導航: `<leader> + h/j/k/l`
- PageUp/PageDown: 捲動模式
- `"` / `%`: 在當前路徑分割視窗

### Git Configuration

- **使用者**: Kent Chiu (kent.cwg@gmail.com)
- **編輯器**: vim
- **Diff 工具**: delta (side-by-side diff)
- **Merge 工具**: nvimdiff
- **預設分支**: main
- **LFS**: 啟用

#### Git Aliases

```bash
st = status
ci = commit
co = checkout
br = branch
reword = commit --allow-empty --amend -m
lg = log --graph (美化圖形化 log)
```

### Shell Configuration (Zsh)

適用於 macOS 環境 (Linux/Arch 使用 Bash)

- **框架**: oh-my-zsh
- **Prompt**: Starship (如果安裝)
- **插件**: fzf, git, zsh-autosuggestions, zoxide
- **編輯器**: nvim

#### 重要工具別名

```bash
lg = lazygit
vi = nvim
ff = nvim $(fzf)  # FZF 檔案選擇器
ls = exa --icons  # 現代化 ls 替代
cd = z            # zoxide 智能目錄跳轉
```

#### FZF 整合功能

- `fv` - FZF + Neovim (搜尋並開啟檔案)
- `fvr` - Ripgrep + FZF + Neovim (全文搜尋並開啟)
- `ffind <path>` - 搜尋檔案並預覽
- `fcd <dir>` - 搜尋並切換目錄

#### 環境變數路徑

- Go: `/usr/local/go/bin`
- Rust: `~/.cargo/bin`
- Flutter: `~/flutter/bin`
- UV Tools: `~/.local/bin`
- NVM: `~/.nvm`

### Application Configurations (Linux 特定)

以下配置直接放在 dotfile 根目錄，與 `nvim/` 保持一致的平面結構。主要用於 Linux (Arch) 環境。

#### Hyprland (視窗管理器)

- **配置檔案**: 約 10 個 .conf 檔案模組化管理
- **主配置**: `hyprland.conf`
- **子模組**:
  - `bindings.conf` - 按鍵綁定
  - `monitors.conf` - 顯示器設定
  - `input.conf` - 輸入裝置設定
  - `autostart.conf` - 自動啟動應用
  - `envs.conf` - 環境變數
  - `looknfeel.conf` - 外觀設定
  - `hypridle.conf` - 閒置管理
  - `hyprlock.conf` - 鎖屏設定
  - `hyprsunset.conf` - 色溫調整
- **本機檔案**: `.claude/` (權限設定，不納入版本控制)

#### Waybar (狀態列)

- **配置檔案**:
  - `config.jsonc` - 主配置
  - `style.css` - 樣式表

#### Ghostty (終端模擬器)

- **配置檔案**: `~./dotfile/ghostty/config`
- **特點**: 跨平台終端模擬器配置

#### Fcitx5 (輸入法框架)

- **配置檔案**:
  - `config` - 主配置
  - `profile` - 輸入法設定檔
  - `conf/` - 子配置目錄
- **快取檔案**: `conf/cached_layouts` (自動生成，不納入版本控制)

#### Walker (應用啟動器)

- **配置檔案**: `config.toml`

## Installation & Deployment

### 符號連結建立

**重要**: 所有配置檔案都透過符號連結部署，不要直接複製檔案。

#### 家目錄配置

```bash
# Git
ln -sf ~/.config/dotfile/.gitconfig ~/.gitconfig

# Tmux
ln -sf ~/.config/dotfile/.tmux.conf ~/.tmux.conf

# Neovim
ln -sf ~/.config/dotfile/nvim ~/.config/nvim

# Zsh (macOS)
ln -sf ~/.config/dotfile/.zshrc ~/.zshrc

# WezTerm
ln -sf ~/.config/dotfile/.wezterm.lua ~/.wezterm.lua
```

#### ~/.config 配置目錄

```bash
# Kitty 終端模擬器
ln -sf ~/.config/dotfile/kitty ~/.config/kitty

# Hyprland 視窗管理器
ln -sf ~/.config/dotfile/hypr ~/.config/hypr

# Waybar 狀態列
ln -sf ~/.config/dotfile/waybar ~/.config/waybar

# Fcitx5 輸入法
ln -sf ~/.config/dotfile/fcitx5 ~/.config/fcitx5

# Walker 應用啟動器
ln -sf ~/.config/dotfile/walker ~/.config/walker

# Starship prompt
ln -sf ~/.config/dotfile/starship.toml ~/.config/starship.toml
```

### 平台相依套件

**Arch Linux**:

```bash
# 必要套件
sudo pacman -S wget net-tools htop tree gdu less bat exa vim zoxide

# 開發工具
sudo pacman -S tmux neovim ripgrep fd fzf gcc git lazygit git-delta

# Tmux 插件管理器
git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
```

**Ubuntu**:

```bash
# 參考 ubuntu_dotfile_guide.md
# Neovim 需要從官方下載 >= 0.11 版本
curl -LO https://github.com/neovim/neovim/releases/latest/download/nvim-linux-x86_64.tar.gz
sudo tar -C /opt -xzf nvim-linux-x86_64.tar.gz
sudo ln -sf /opt/nvim-linux-x86_64/bin/nvim /usr/local/bin/nvim
```

**macOS**:

```bash
brew install tmux neovim ripgrep fd fzf git lazygit git-delta
brew install exa bat zoxide
```

## Common Development Tasks

### Neovim

```bash
# 檢查健康狀態
nvim
:checkhealth

# 更新插件
:Lazy sync

# 查看按鍵映射
:WhichKey
```

### Tmux

```bash
# 安裝/更新插件
tmux
<Ctrl+a> + I

# 重新載入配置
tmux source ~/.tmux.conf

# 恢復 session (自動)
# tmux-continuum 會自動在啟動時恢復上次的 session
```

### Git

```bash
# 使用別名
git st          # status
git lg          # 圖形化 log
git reword "new message"  # 修改最後一次 commit message

# Delta diff
git diff        # 自動使用 delta 渲染
```

## Important Notes

### 修改配置時的注意事項

1. **符號連結**: 修改配置時，直接編輯此儲存庫的檔案，修改會立即反映到家目錄
2. **Neovim 子模組**: nvim/ 目錄是獨立的 git 子儲存庫，有自己的 .git 目錄
3. **平台檢測**:
   - `.wezterm.lua` 有平台檢測邏輯 (Windows/macOS)
   - `.tmux.conf` 會檢測 win32yank.exe 是否存在
4. **私密環境變數**: `.zshrc` 會載入 `~/.dev.env` (如果存在) - 此檔案不應納入版本控制

### Tmux Leader Key 衝突

Neovim 中 `<C-a>` 被停用，避免與 tmux leader key 衝突。如需在 Neovim 中使用行首跳轉，請使用 `H` 而非 `<C-a>`。

### Clipboard 支援

- **本機**: 使用系統剪貼簿 (`clipboard=unnamedplus`)
- **SSH 遠端**: 使用 OSC 52 協定 (`vim.g.clipboard = "osc52"`)
- **Windows WSL**: tmux-yank 會自動偵測並使用 win32yank.exe

## Version Requirements

- Neovim: >= 0.11.0
- Tmux: >= 3.0
- Git: >= 2.30
- Zsh: >= 5.8 (macOS)
