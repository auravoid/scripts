Write-Output ""
Write-Output "Setting up git..."
Write-Output "Input your git user name. This will be used to identify you in git commits."
$USER = Read-Host
$EMAIL = "$USER@users.noreply.github.com"

Write-Output "Setting up git global email and name..."
git config --global user.name "$USER"
git config --global user.email "$EMAIL"

Write-Output "Setting up git aliases..."
git config --global alias.ci commit
git config --global alias.st status
git config --global alias.br branch
git config --global alias.co checkout
git config --global alias.last 'log -1 HEAD'

$GIT_KEY = "$HOME\.ssh\git.pub"
if ( -not (Test-Path $GIT_KEY)) {
    Write-Output ""
    Write-Output "Setting up SSH key for git..."
    ssh-keygen -t ed25519 -C "$EMAIL" -f "$HOME\.ssh\git"
    Write-Output ""
    Write-Output "Add the following ssh key to your Github or Gitlab account:"
    Write-Output "Host github.com`n`tHostName github.com`n`tUser git`n`tIdentityFile $HOME/.ssh/git`n" >> $HOME\.ssh\config
    Get-Content $HOME\.ssh\git.pub
}
else {
    Write-Output ""
    Write-Output "Looks like you already have a ssh key. Add the following ssh key to your Github or Gitlab account:"
    Write-Output -e "Host github.com`n`tHostName github.com`n`tUser git`n`tIdentityFile $HOME\.ssh\git`n" >> $HOME\.ssh\config
    Get-Content $HOME\.ssh\git.pub
}

Write-Output ""
Write-Output "Done setting up git."
