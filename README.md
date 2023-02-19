# dotfile


## pre-installed

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
  - rg
  - fd
  - lazygit
  - nerdfont


## usage

> NOTE: BACKUP all of those file before `ln` command 

linux/maxos

```bash
ln -sf ~/.config/dotfile/.gitconfig ~/.gitconfig
ln -sf ~/.config/dotfile/.ideavimrc ~/.ideavimrc
ln -sf ~/.config/dotfile/.tmux.conf ~/.tmux.conf
ln -sf ~/.config/dotfile/.profile ~/.profile
ln -sf ~/.config/dotfile/.vimrc ~/.vimrc
ln -sf ~/.config/dotfile/.zshrc ~/.zshrc
```

windows

Open powershell with administrator privileges

```powershell
New-Item -ItemType SymbolicLink -Path "$env:userprofile\.gitconfig" -Target "$env:userprofile\dev\dotfile\.gitconfig" -Force
New-Item -ItemType SymbolicLink -Path "$env:userprofile\.ideavimrc" -Target "$env:userprofile\dev\dotfile\.ideavimrc" -Force
```


