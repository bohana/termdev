#
# termdev
#
for fn in $(ls ~/.termdev/bash*sh)
do
    source $fn
done;

# fuzzy finder
[ -f ~/.fzf.bash ] && source ~/.fzf.bash

# WSL is annoying
export TERM=xterm-256color

# aws auto complete
complete -C '/home/bohana/miniconda3/envs/py3/bin/aws_completer' aws

export PATH="$PATH:$HOME/.bash-my-aws/bin"
source ~/.bash-my-aws/aliases
source ~/.bash-my-aws/bash_completion.sh

# switch to my favorite conda env
sw py3

# WSL - I want home dir on Linux
cd

# starship
if [ "${BASH_VERSINFO[0]}" -gt 4 ] || ([ "${BASH_VERSINFO[0]}" -eq 4 ] && [ "${BASH_VERSINFO[1]}" -ge 1 ])
then
        source <("/usr/local/bin/starship" init bash --print-full-init)
else
        source /dev/stdin <<<"$("/usr/local/bin/starship" init bash --print-full-init)"
fi
