# dotfile


## pre-installed

- tmux + tpm plugin
- git
- zsh
- oh-my-zsh
- powerlevel10k
- idea + vim plugin
- lazgit
- delta (diff tools)

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


