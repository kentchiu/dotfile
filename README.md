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

### usage

> NOTE: BACKUP all of those files before `ln` command

### windows

Open powershell with administrator privileges

```powershell
New-Item -ItemType SymbolicLink -Path "$env:userprofile\.gitconfig" -Target "$env:userprofile\dev\dotfile\.gitconfig" -Force
New-Item -ItemType SymbolicLink -Path "$env:userprofile\.wezterm.lua" -Target "$env:userprofile\dev\dotfile\.wezterm.lua" -Force
New-Item -ItemType SymbolicLink -Path "$env:userprofile\AppData\Local\nvim" -Target "$env:userprofile\dev\dotfile\nvim" -Force
```
