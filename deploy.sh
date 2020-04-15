function show_info()
{
  local msg="OK!"
  if [ ! -z "$1" ]; then
    msg="$1"
  fi
  echo -e "\033[0;36m${msg}\033[0m"
}

mkdir -p ~/.termdev
mkdir -p ~/.config/nvim

show_info "[termdev] - copying bash helper scripts"
cp -v bash/*sh ~/.termdev
chmod 750 ~/.termdev/*sh

show_info "[termdev] - git setup"
cp -v git/gitconfig ~/.gitconfig

show_info "[termdev] - nvim setup"
cp -v nvim/init.vim ~/.config/nvim

curl -fLo ~/.local/share/nvim/site/autoload/plug.vim --create-dirs \
        https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

show_info "[termdev] - installing nvim plugins"
nvim -c "PlugInstall|qa"

show_info "[termdev] - python packages"
pip install -r python/requirements.txt

show_info "[termdev] - tmux"
cp tmux/tmux.conf ~/.tmux.conf

# fancy-looking fonts
# https://github.com/powerline/fonts
show_info "[termdev] - powerline fonts"
ROOT=$PWD
mkdir -p ~/tmp && cd ~/tmp
git clone https://github.com/powerline/fonts.git --depth=1
cd fonts
./install.sh
cd $ROOT

show_info "[termdev] - starship prompt"
curl -fsSL https://starship.rs/install.sh | bash
mkdir -p ~/.config && touch ~/.config/starship.toml
cp -v starship/starship.toml ~/.config/starship.toml
