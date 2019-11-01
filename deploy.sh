mkdir -p ~/.termdev
mkdir -p ~/.config/nvim

echo "[termdev] - copying bash helper scripts"
cp -v bash/*sh ~/.termdev
chmod 750 ~/.termdev/*

echo "[termdev] - git setup"
cp -v git/gitconfig ~/.gitconfig

echo "[termdev] - nvim setup"
cp -v nvim/init.vim ~/.config/nvim

curl -fLo ~/.local/share/nvim/site/autoload/plug.vim --create-dirs \
        https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

echo "[termdev] - installing plugins"
nvim -c "PlugInstall|qa"