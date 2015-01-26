# Emacs 配置文件

xcwen jim
xcwenn@qq.com

**测试过的环境**

`ubuntu14.10`

`deepin2014`



## 说明 

* 使用 `EVIL` 模拟 `VIM`  ,使得emacs的编辑和vim 保持95%以上的一致性

* 使用 `multi-term` 实现多终端模拟器， 基本上不用系统自带的终端模拟器

* 借鉴`deepin emcas` 配置文件的文档结构

* 基于  `package.el`  管理所有的包

* 基于 phpctags + 自己开发的 auto-complete-php.el 实现的 php 补全，跳转 

* 使用  `rtags` + `clang` 作 `c++` 代码补全

* `rtags` : 基于llvm . 真正实现了能编译，就能补全，跳转 :https://github.com/Andersbakken/rtags/

## 安装 

###基本安装
```
cd $HOME 
git clone https://github.com/xcwen/site-lisp.git
 #复制ubuntu 字体
mkdir ~/.fonts
cp ~/site-lisp/other_script/XHei_Mono.Ubuntu.ttc  ~/.fonts/
mv ~/.emacs  ~/.emacs.bak #备份原有的文件 
cp ~/site-lisp/other_script/site-start.el ~/.emacs
alias vi="emacsclient -n"
```

### multi-term
屏蔽的大部分的emacs 本身的快捷键
可在term 中使用vim 

可用快捷键:
```
"M-x"    M-x 
"M-1"    最大化 
"C-^"    打开当前文件列表
"C-6"    发"\C-^"   # C-^  在vim 中有用 ，使用  C-6 代替
"C-S-t"  新建终端 
"C-S-h"  上个终端
"C-S-l"  下个终端
"C-S-c"  发C-c 
"C-c"    复制 
"M-w"    复制 
"C-v"    黏贴
"C-y"    黏贴
```

###php 补全 
安装phpctags 
```
cd ~
git clone https://github.com/vim-php/phpctags.git
cd ~/phpctags/ && make 
sudo cp phpctags /usr/bin/ 
```

指定项目所在的根目录,在项目根目录上生成.tags目录

``` bash
cd /project/to/path # 项目根目录
mkdir .tags
```

emacs php-mode 快捷键 
```
    tab       : -> 补全 
    C-tab     : 补全
    C-]       : 跳转到定义
    C-t       : 跳转返回
    ,i        : 查看定义
    ,s        : 在项目中查找 引用, 出现的地方
    ,r        : 重新生成tags
```
补全案例：

![补全案例gif](https://raw.githubusercontent.com/xcwen/site-lisp/master/other_script/ac-php.gif)


###c++ 编码需要
``` bash
apt-get install fcitx clang cmake g++ libclang-dev libssl-dev libcurses-ocaml-dev cscope
```

查看 rtags 说明: https://github.com/Andersbakken/rtags
安装 rtags: 地址:

``` bash
cd ~/ &&  git clone https://github.com/Andersbakken/rtags/
cd ~/rtags/src &&  git clone https://github.com/Andersbakken/rct
cd ~/rtags && mkdir build && cd ~/rtags/build/ && cmake ../ && make && sudo make install 
ln -s ~/rtags/bin/gcc-rtags-wrapper.sh ~/bin/c++
ln -s ~/rtags/bin/gcc-rtags-wrapper.sh ~/bin/cc
ln -s ~/rtags/bin/gcc-rtags-wrapper.sh ~/bin/g++
ln -s ~/rtags/bin/gcc-rtags-wrapper.sh ~/bin/gcc
 #export 放到~/.bashrc
export PATH=~/bin/:$PATH
```

启动 rtags 服务:

``` bash
$rdm 
```


###python  补全jedi 需要
```
apt-get install virtualenv
or:
apt-get install python-virtualenv
```
