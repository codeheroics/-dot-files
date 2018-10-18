# dotfiles

## Commands to run
```
curl -o- https://raw.githubusercontent.com/creationix/nvm/v0.33.11/install.sh | bash
sudo apt install bat ncdu
npm i -g diff-so-fancy git-recent fkill-cli tldr
sudo curl -o /usr/bin/prettyping https://raw.githubusercontent.com/denilsonsa/prettyping/master/prettyping
sudo chmod +x /usr/bin/prettyping
git clone --depth 1 https://github.com/junegunn/fzf.git ~/.fzf
~/.fzf/install
curl -L $(curl -s https://api.github.com/repos/variadico/noti/releases/latest | awk '/browser_download_url/ { print $2 }' | grep 'linux-amd64' | sed 's/"//g') | tar -xz
sudo mv noti /usr/bin
```
## Install manually

* https://hyper.is/#installation
* https://github.com/sharkdp/fd/releases
