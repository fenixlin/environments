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

# 为airline安装字体
#wget https://github.com/powerline/powerline/blob/develop/font/PowerlineSymbols.otf
#sudo mkdir -p /usr/share/fonts/custom
#sudo mv PowerlineSymbols.otf /usr/share/fonts/custom
#sudo chmod 744 /usr/share/fonts/custom/PowerlineSymbols.otf
#sudo mkfontscale
#sudo mkfontdir
#sudo fc-cache -fv

# 还是这里说的靠谱(下面那个ubuntu的答案，droid snas mono for powerline regular)
# https://vi.stackexchange.com/questions/3359/how-do-i-fix-the-status-bar-symbols-in-the-airline-plugin
sudo apt-get install powerline-fonts

# 为ale安装检查插件
# shell linter
pip install vint
# python linter
pip install pylint
# python formatter
pip install autopep8

