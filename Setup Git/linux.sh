echo ""
echo "Setting up git..."
echo "Input your git user name. This will be used to identify you in git commits."
read USER
EMAIL="$USER@users.noreply.github.com"

echo "Setting up git global email and name..."
git config --global user.name "$USER"
git config --global user.email "$EMAIL"

echo "Setting up git aliases..."
git config --global alias.ci commit
git config --global alias.st status
git config --global alias.br branch
git config --global alias.co checkout
git config --global alias.last 'log -1 HEAD'

GIT_KEY="$HOME/.ssh/git.pub"
if [ ! -f "$GIT_KEY" ]; then
    echo ""
    echo "Setting up SSH key for git..."
    ssh-keygen -t ed25519 -C "$EMAIL" -f "$HOME/.ssh/git"
    echo ""
    echo "Add the following ssh key to your Github or Gitlab account:"
    cat ~/.ssh/git.pub
    echo -e "Host github.com\n\tHostName github.com\n\tUser git\n\tIdentityFile ~/.ssh/git\n" >> ~/.ssh/config
elif [ -f "$GIT_KEY" ]; then
    echo ""
    echo "Looks like you already have a ssh key. Add the following ssh key to your Github or Gitlab account:"
    cat ~/.ssh/git.pub
    echo -e "Host github.com\n\tHostName github.com\n\tUser git\n\tIdentityFile ~/.ssh/git\n" >> ~/.ssh/config
fi

echo ""
echo "Done setting up git."