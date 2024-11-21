# Install Scoop package manager
if (!(Get-Command scoop -ErrorAction SilentlyContinue)) {
    Set-ExecutionPolicy RemoteSigned -Scope CurrentUser
    irm get.scoop.sh | iex
}

# Install chezmoi using scoop
scoop bucket add extras
scoop install chezmoi

# Initialize dotfiles
chezmoi init --apply $env:GITHUB_USERNAME
