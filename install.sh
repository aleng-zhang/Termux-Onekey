#!/data/data/com.termux/files/usr/bin/bash

clear
termux-setup-storage

sed -ie '2cdeb https://mirrors.tuna.tsinghua.edu.cn/termux stable main' "$PREFIX/etc/apt/sources.list"

apt update && apt upgrade -y
apt install -y git zsh vim

curl -fsSL https://raw.githubusercontent.com/wklken/vim-for-server/master/vimrc > ~/.vimrc

git clone https://github.com/aleng-zhang/Termux-Onekey.git "$HOME/Termux-Onekey" --depth 1
cp -R "$HOME/Termux-Onekey/.termux" "$HOME/.termux"
rm -rf "$HOME/Termux-Onekey"

git clone git://github.com/robbyrussell/oh-my-zsh.git "$HOME/.oh-my-zsh" --depth 1
cp "$HOME/.oh-my-zsh/templates/zshrc.zsh-template" "$HOME/.zshrc"
sed -i '/^ZSH_THEME/d' "$HOME/.zshrc"
sed -i '1iZSH_THEME="agnoster"\nexport EDITOR=vim' "$HOME/.zshrc"

git clone https://github.com/zsh-users/zsh-syntax-highlighting.git "$HOME/.zsh-syntax-highlighting" --depth 1
echo "source $HOME/.zsh-syntax-highlighting/zsh-syntax-highlighting.zsh" >> "$HOME/.zshrc"

chsh -s zsh

echo "Done!\nPlease restart Termux app..."
exit