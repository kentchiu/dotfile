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
tmux source ~/.tmux.conf
```

### git

```bash
sudo pacman -S --noconfirm git lazygit git-delta
mkdir -p ~/config/lazygit
ln -sf ~/.config/dotfile/.lazygit-config ~/config/lazygit/config.yml
```

### nvim

```bash
sudo pacman -S --noconfirm neovim ripgrep fd fzf gcc curl
git clone git@github.com:kentchiu/nvim-config.git ~/.config/nvim-config
ln -sf ~/.config/nvim-config ~/config/nvim
```

### usage

> NOTE: BACKUP all of those files before `ln` command

### linux/maxos

```bash
ln -sf ~/.config/dotfile/.zshrc ~/.zshrc
ln -sf ~/.config/dotfile/.gitconfig ~/.gitconfig
ln -sf ~/.config/dotfile/.tmux.conf ~/.tmux.conf


ln -sf ~/.config/dotfile/.ideavimrc ~/.ideavimrc
ln -sf ~/.config/dotfile/.wezterm.lua ~/.wezterm.lua
ln -sf ~/.config/dotfile/.vimrc ~/.vimrc

ln -sf ~/.config/dotfile/.zshrc-2 ~/.zshrc
```

### windows

Open powershell with administrator privileges

```powershell
New-Item -ItemType SymbolicLink -Path "$env:userprofile\.gitconfig" -Target "$env:userprofile\dev\dotfile\.gitconfig" -Force
New-Item -ItemType SymbolicLink -Path "$env:userprofile\.ideavimrc" -Target "$env:userprofile\dev\dotfile\.ideavimrc" -Force
New-Item -ItemType SymbolicLink -Path "$env:userprofile\.wezterm.lua" -Target "$env:userprofile\dev\dotfile\.wezterm.lua" -Force
```
