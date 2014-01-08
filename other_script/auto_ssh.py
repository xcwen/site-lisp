#!/usr/bin/python
# -*- coding: utf-8 -*-
#import pexpect
#import sys  
import pexpect, struct, fcntl, termios, signal, sys
import os 

ter=None

#自动SSH 函数
def auto_ssh (ip,username,password,init_cmd):
	global ter

	ip_addr=ip.split(":")[0];
	#如果带端口,将":" 转化为空格,以便于ssh使用.
	ip=ip.replace(":"," -p")
	ssh_cmd="ssh " +username+"@" + ip
	print "\033[35m+<<=====================================\033[33m|\033[32m SSH \033[33m|\033[35m=======================================>>+\033[0m"
	print "\033[34m ssh_cmd\t:\033[0m "+ssh_cmd

	print "\033[36m+=======================================================================================+\033[0m"


	ter= pexpect.spawn(ssh_cmd)
	if not password : 
		return ter;


	send_passwd_count=0;
	while True:
		try:
			index=ter.expect (['yes',"assword","[#$]","REMOTE HOST IDENTIFICATION HAS CHANGED","Connection timed out","No route to host" ],0.1 )
			if index==0:
				print "print yes"
				ter.sendline ("yes" )
				send_passwd_count=-1
			elif index==1:	
				send_passwd_count=send_passwd_count+1
				if (send_passwd_count>1):
					sys.stdout.write("re input passwd")
					break;

				print "print passwd"
				ter.sendline ( password )
			elif index==2:	
				print "login ...."
				if init_cmd:
					ter.sendline(init_cmd);
				break;
			elif index==3:#地址出问题了	
				rm_item_str="sed -i '/%s/d' %s/.ssh/known_hosts"% (ip_addr ,os.getenv("HOME"));
				os.system(rm_item_str );
				#print rm_item_str 
				print "请重新登入 "
				break;
				pass
			elif index==4:#超时
				print "Connection timed out"
				break;
			elif index==5:
				print "No route to host"
				break;
		except Exception:	
			pass

########################################################
#设置终端
def sigwinch_passthrough (sig, data):
	s = struct.pack("HHHH", 0, 0, 0, 0)
	a = struct.unpack('hhhh', fcntl.ioctl(sys.stdout.fileno(), termios.TIOCGWINSZ , s))
	global ter 
	ter.setwinsize(a[0],a[1])
	
#---------------------------

#---------------------------
def run_ssh(ip,username,passwd,init_cmd ):

	global ter

	ip_addr=ip.split(":")[0];
	#设置当前的session_id 

	try:
		auto_ssh(ip,username,passwd, init_cmd)
		#设置当前winsize
		sigwinch_passthrough(0,0)
		signal.signal(signal.SIGWINCH, sigwinch_passthrough)	
	
		#进入用户交互
		try:
			ter.interact(chr(0))
		except Exception:	
			pass
	finally:
		ter.terminate()
		pass

#######################################################
#python auto_ssh.py "ip:port", "username",  "passwd" 
#如 python auto_ssh.py 10.1.1.5:22 jim xxxxxx 
import sys
init_cmd=""
if len(sys.argv) ==5 :
	init_cmd=sys.argv[4] 

run_ssh(sys.argv[1], sys.argv[2] , sys.argv[3], init_cmd )

