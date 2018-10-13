# neovim 环境安装及设置

# vim-8的deoplete没有用，改用neovim试试。主要是异步功能吧
sudo apt install software-properties-common
sudo add-apt-repository ppa:neovim-ppa/unstable
sudo apt update
sudo apt-get install neovim

# python安装neovim依赖
pip3 install --upgrade neovim
# 或
sudo apt-get install python3-neovim

# 安装vim-plug
curl -fLo ~/.local/share/nvim/site/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

# 修改~/.config/nvim/init.vim
mkdir -p ~/.config/nvim
#nvim ~/.config/nvim/init.vim
cp ./init.vim ~/.config/nvim/init.vim

# 安装init.vim中声明的插件
:PlugInstall

# 为airline安装字体，安装好后使用droid snas mono for powerline regular)
# 参考https://vi.stackexchange.com/questions/3359/how-do-i-fix-the-status-bar-symbols-in-the-airline-plugin
sudo apt-get install fonts-powerline

# 如果安装不了参考下面方案
wget https://github.com/Lokaltog/powerline/raw/develop/font/PowerlineSymbols.otf https://github.com/Lokaltog/powerline/raw/develop/font/10-powerline-symbols.conf
sudo mv PowerlineSymbols.otf /usr/share/fonts/
sudo fc-cache -vf
sudo mv 10-powerline-symbols.conf /etc/fonts/conf.d/

# 为ale安装检查插件，后面可以使用:ALEFix来直接修复格式
# shell linter
pip install vint
# python linter
pip install pylint
# python formatter
pip install autopep8

