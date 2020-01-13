# dotfiles

## Commands to run
```
sudo apt install bat ncdu curl wget git fortune vim
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
# note: chsh / logout and login again for zsh as default shell
curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.35.2/install.sh | zsh
nvm install --lts
npm i -g diff-so-fancy git-recent fkill-cli tldr
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting
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
* https://code.visualstudio.com/
