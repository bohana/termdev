function show_info()
{
  local msg="OK!"
  if [ ! -z "$1" ]; then
    msg="$1"
  fi
  echo -e "\033[0;36m${msg}\033[0m"
}


function backup_copy(){
  # backup_copy src_file tgt_file

  tgt = $(basename $2)

  # backup the target
  cp $2 ~/.termdev/backup/${tgt}.`date +%Y%m%d%H%M%s`

  # copy
  cp -v $1 $2
}


function termdev_setup_root()
{
  show_info "[termdev] - copying bash helper scripts"
  mkdir -p ~/.termdev
  mkdir -p ~/.termdev/backup
  mkdir -p ~/.termdev/bin
  cp -v bash/*sh ~/.termdev
  chmod 750 ~/.termdev/*sh
}


function termdev_setup_git()
{
  show_info "[termdev] - git setup"
  backup_copy git/gitconfig ~/.gitconfig
}


function termdev_setup_nvim()
{
  show_info "[termdev] - nvim setup"
  mkdir -p ~/.config/nvim
  backup_copy nvim/init.vim ~/.config/nvim

  curl -fLo ~/.local/share/nvim/site/autoload/plug.vim --create-dirs \
          https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

  show_info "[termdev] - installing nvim plugins"
  nvim -c "PlugInstall|qa"
}


function termdev_setup_python()
{
  show_info "[termdev] - python packages"
  pip install -r python/requirements.txt
}


function termdev_setup_tmux()
{
  show_info "[termdev] - tmux"
  backup_copy tmux/tmux.conf ~/.tmux.conf
}


function termdev_setup_starship()
{
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
}


function termdev_setup_bintools()
{
  show_info "[termdev] - bin tools (jq)"
  bintools/jq.sh
  show_info "[termdev] - bin tools (gron)"
  bintools/gron.sh

  # add to bashrc
  cp ~/.bashrc ~/.termdev/backup/bashrc.`date +%Y%m%d%H%M%s`
  echo 'export PATH=$PATH:~/.termdev/bin' >> ~/.bashrc
}


#
# main
#
function termdev_main()
{
  show_info "[termdev] - Available actions"
  declare -F | grep -o 'termdev_setup_.*' | cut -d'_' -f 3 | grep -v root | sort
 
  if [ -z $1 ];
  then
     printf "\nUsage: deploy.sh <action>"
     exit 1
  fi;

  action=$1
  echo "... you chose: $1"

  # always run root action
  termdev_setup_root
  termdev_setup_${action}
}


termdev_main $*
