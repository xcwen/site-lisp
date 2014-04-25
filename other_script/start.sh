#!/bin/bash
cd ~/bin/xptray/ && ./xptray.py &
virtualbox --startvm xp  &
#fcitx
rm ~/.emacs.d/session.*
emacs& 
firefox&
gnome-terminal --maximize &
~/work/sshmount.sh &
goldendict &

setxkbmap -option terminate:ctrl_alt_bksp 

#VBoxManage setextradata global GUI/Customizations noMenuBar,noStatusBar
#halt: shutduwn -h now
#--------------- 设置 xp 自动登录 -------------
#根键位置：
#HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Winlogon
#修改内容：
#在右边的窗口中的新建字符串"AutoAdminlogon"，并把他们的键值为"1"，把“DefaultUserName”的值设置为用户名，并且另外新建一个字符串值“DefaultPassword”，并设其值为用户的密码。:142857@xcwen

#flash 开启本地存储
#echo "LocalStorageLimit = 1" > /etc/adobe/mms.cfg 
