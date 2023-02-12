# dotfile

## usage


linux/maxos

```bash
ln -sf ~/dev/kent/dotfile/.gitconfig ~/.gitconfig
ln -sf ~/dev/kent/dotfile/.ideavimrc ~/.ideavimrc
ln -sf ~/dev/kent/dotfile/.tmux.conf ~/.tmux.conf
ln -sf ~/dev/kent/dotfile/.profile ~/.profile
ln -sf ~/dev/kent/dotfile/.vimrc ~/.vimrc
ln -sf ~/dev/kent/dotfile/.zshrc ~/.zshrc
```

windows

Open powershell with administrator privileges

```powershell
New-Item -ItemType SymbolicLink -Path "$env:userprofile\.gitconfig" -Target "$env:userprofile\dev\dotfile\.gitconfig" -Force
New-Item -ItemType SymbolicLink -Path "$env:userprofile\.ideavimrc" -Target "$env:userprofile\dev\dotfile\.ideavimrc" -Force


```


