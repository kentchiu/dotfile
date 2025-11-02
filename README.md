# dotfile

## pre-installed

- paru (AUR package manager)
- tmux
  1. tpm plugin
- git
  1. lazgit
  2. delta (diff tools)
- zsh
  1. oh-my-zsh
  2. powerlevel10k
  3. nerdfont
- idea
  1. vim plugin
- nvim
  1. rg
  2. fd
  3. lazygit
  4. nerdfont
  5. fzf

### clone

```bash
mkdir .config
cd .config
git clone https://github.com/kentchiu/dotfile.git

ln -sf ~/.config/dotfile/.zshrc ~/.zshrc
# or
# ln -sf ~/.config/dotfile/.zshrc-2 ~/.zshrc
ln -sf ~/.config/dotfile/.gitconfig ~/.gitconfig
ln -sf ~/.config/dotfile/.tmux.conf ~/.tmux.conf

```

### Prepare

install tpm

install oh-my-zsh

install zsh plugin

git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions

### paru

install paru for AUR package manager

```bash
sudo pacman -S --needed base-devel
git clone https://aur.archlinux.org/paru.git
cd paru
makepkg -si
```

### Useful Command (arch linux)

must have package

```bash
sudo pacman -Syu --noconfirm  \
  && sudo pacman -S --noconfirm  wget net-tools htop tree gdu less bat exa htop vim zoxide
```

best to have package

```bash
sudo pacman -S --noconfirm jq yq tldr

```

### tmux

install tmux plugin manager

```bash
sudo pacman -S --noconfirm tmux
git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
ln -sf ~/.config/dotfile/.tmux.conf ~/.tmux.conf
# start tmux
tmux

tmux source ~/.tmux.conf

# ctrl + b + I to install plugins
```

> leader + I to install plugins after install

### git

```bash
sudo pacman -S --noconfirm git lazygit git-delta
mkdir -p ~/config/lazygit
ln -sf ~/.config/dotfile/.lazygit-config ~/config/lazygit/config.yml
```

### nvim

```bash
sudo pacman -S --noconfirm neovim ripgrep fd fzf gcc curl tree-sitter-cli
ln -sf ~/.config/dotfile/nvim ~/.config/nvim
```

> run nvim and :checkhealth

### ~/.config 配置

本專案將常用的 `~/.config` 配置直接管理於根目錄，與 `nvim/` 保持一致的平面結構。

#### 已納入管理的配置

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

# Starship prompt (如果尚未建立)
ln -sf ~/.config/dotfile/starship.toml ~/.config/starship.toml
```

**注意事項**:
- `hypr/.claude/` 和各配置中的 `CLAUDE.md` 為本機特定檔案，不會納入版本控制
- `fcitx5/conf/cached_layouts` 為快取檔案，會自動生成
- 建立符號連結前請先備份現有配置

### usage

> NOTE: BACKUP all of those files before `ln` command

### windows

Open powershell with administrator privileges

```powershell
New-Item -ItemType SymbolicLink -Path "$env:userprofile\.gitconfig" -Target "$env:userprofile\dev\dotfile\.gitconfig" -Force
New-Item -ItemType SymbolicLink -Path "$env:userprofile\.wezterm.lua" -Target "$env:userprofile\dev\dotfile\.wezterm.lua" -Force
New-Item -ItemType SymbolicLink -Path "$env:userprofile\AppData\Local\nvim" -Target "$env:userprofile\dev\dotfile\nvim" -Force
```
