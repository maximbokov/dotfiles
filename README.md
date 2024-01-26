My collection of dotfiles for vim, bash, git, and tmux.

Running init.sh will symlink $HOME/.{file} to $HOME/dotfiles/{file}, and back up the original in $HOME/dotfiles.bak/ as well as pull in all the vim plugin submodules.

Make sure that .bash_aliases is called from your .bashrc:

echo "if [ -f $HOME/.bash_aliases ]; then . $HOME/.bash_aliases; fi" >> ~/.bashrc

Configure git to use the global gitignore_global

git config --global core.excludesfile ~/.gitignore_global

