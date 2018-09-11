#!/data/data/com.termux/files/usr/bin/bash
# -*- coding:utf-8 -*-

clear
termux-setup-storage

echo "欢迎使用termux一键配置脚本！"
echo "正在进行安装...请稍后...\n正在更换软件源..."
sed -ie '2cdeb https://mirrors.ustc.edu.cn/termux stable main' /data/data/com.termux/files/usr/etc/apt/sources.list

echo "Done！\n更新中..."
apt update && apt upgrade -y

echo "安装必备组件中..."
apt install -y git zsh vim

echo "正在进行 vim 配置&美化..."
curl -fsSL https://raw.githubusercontent.com/wklken/vim-for-server/master/vimrc > ~/.vimrc
echo "Done!"

echo "安装&配置 ohmyzsh"
git clone https://github.com/aleng-zhang/Termux-Onekey.git "$HOME/Termux-Onekey" --depth 1
mv "$HOME/Termux-Onekey/.termux" "$HOME/.termux"
rm -rf "$HOME/Termux-Onekey"

git clone git://github.com/robbyrussell/oh-my-zsh.git "$HOME/.oh-my-zsh" --depth 1
cp "$HOME/.oh-my-zsh/templates/zshrc.zsh-template" "$HOME/.zshrc"
sed -i '/^ZSH_THEME/d' "$HOME/.zshrc"
sed -i '1iZSH_THEME="agnoster"' "$HOME/.zshrc"

git clone https://github.com/zsh-users/zsh-syntax-highlighting.git "$HOME/.zsh-syntax-highlighting" --depth 1
echo "source $HOME/.zsh-syntax-highlighting/zsh-syntax-highlighting.zsh" >> "$HOME/.zshrc"

chsh -s zsh

echo "Done!\nPlease restart Termux app..."
exit