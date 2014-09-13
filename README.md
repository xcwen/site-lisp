# Emacs 配置文件

xcwen jim
xcwenn@qq.com

**测试过的环境**

`ubuntu14.04`: GNU Emacs 24.3.1 (x86_64-pc-linux-gnu, GTK+ Version 3.10.7) of 2014-03-08 on lamiak, modified by Debian
`deepin2014`: GNU Emacs 24.3.1 (x86_64-pc-linux-gnu, X toolkit, Xaw3d scroll bars) of 2014-03-08 on lamiak, modified by Debian



## 说明 

* 借鉴`deepin emcas` 配置文件的文档结构

* 使用 `EVIL` 模拟 `VIM` 

* 使用  `rtags` + `clang` 作 `c++` 代码补全

* `rtags` : 基于llvm . 真正实现了能编译，就能补全，跳转

## 安装 

```
cd $HOME 
git clone https://github.com/xcwen/site-lisp.git

#复制ubuntu 字体
mkdir ~/.fonts
cp ~/site-lisp/other_script/XHei_Mono.Ubuntu.ttc  ~/.fonts/

mv ~/.emacs  ~/.emacs.bak #备份原有的文件 
cp ~/site-lisp/other_script/site-start.el ~/.emacs

#C++ 编码需要
apt-get install  clang cmake g++  libclang-dev libssl-dev

安装 rtags: 地址:
cd ~/ &&  git clone https://github.com/Andersbakken/rtags/
cd ~/rtags/src &&  git clone https://github.com/Andersbakken/rct
cd ~/rtags && mkdir build && cd ~/rtags/build/ && cmake ../ && make && sudo make install 

启动rtags 服务:
运行：rdm 

```



