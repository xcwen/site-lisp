# Emacs 配置文件

xcwen jim
xcwenn@qq.com

**测试过的环境**

`ubuntu14.04`: GNU Emacs 24.3.1 (x86_64-pc-linux-gnu, GTK+ Version 3.10.7) of 2014-03-08 on lamiak, modified by Debian

`deepin2014`: GNU Emacs 24.3.1 (x86_64-pc-linux-gnu, X toolkit, Xaw3d scroll bars) of 2014-03-08 on lamiak, modified by Debian



## 说明 

* 使用 `EVIL` 模拟 `VIM`  ,使得emacs的编辑和vim 保持95%以上的一致性

* 借鉴`deepin emcas` 配置文件的文档结构

* 基于  `package.el`  管理所有的包

* 使用  `rtags` + `clang` 作 `c++` 代码补全

* `rtags` : 基于llvm . 真正实现了能编译，就能补全，跳转 :https://github.com/Andersbakken/rtags/

## 安装 

```
cd $HOME 
git clone https://github.com/xcwen/site-lisp.git

#复制ubuntu 字体
mkdir ~/.fonts
cp ~/site-lisp/other_script/XHei_Mono.Ubuntu.ttc  ~/.fonts/

mv ~/.emacs  ~/.emacs.bak #备份原有的文件 
cp ~/site-lisp/other_script/site-start.el ~/.emacs

#c++ 编码需要
apt-get install  fcitx  clang cmake g++  libclang-dev libssl-dev libcurses-ocaml-dev 
# 查看 rtags 说明: https://github.com/Andersbakken/rtags
安装 rtags: 地址:
cd ~/ &&  git clone https://github.com/Andersbakken/rtags/
cd ~/rtags/src &&  git clone https://github.com/Andersbakken/rct
cd ~/rtags && mkdir build && cd ~/rtags/build/ && cmake ../ && make && sudo make install 

#export 放到~/.bashrc
export PATH=~/bin/:$PATH
alias vi="emacsclient -n"

ln -s ~/rtags/bin/gcc-rtags-wrapper.sh ~/bin/c++
ln -s ~/rtags/bin/gcc-rtags-wrapper.sh ~/bin/cc
ln -s ~/rtags/bin/gcc-rtags-wrapper.sh ~/bin/g++
ln -s ~/rtags/bin/gcc-rtags-wrapper.sh ~/bin/gcc

启动 rtags 服务:
运行：rdm 

#python  补全epc 需要
apt-get install virtualenv


```




