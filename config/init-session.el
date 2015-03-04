


(require 'session)
(custom-set-variables
 '(session-use-package t nil (session)))

(session-initialize)


(desktop-save-mode 1)
(load "desktop") 
(desktop-load-default)
(desktop-save-mode t)
(setq desktop-path '("~/.emacs.d/"))
(setq desktop-dirname "~/.emacs.d/")
(setq desktop-base-file-name ".desktop_save" )
;;(add-hook 'desktop-after-read-hook '(lambda () (message "desktop-after-read-hook")))

;;创建文件备份目录
(when  (not (file-exists-p "~/.emacs.d/bak_dir" ))
	(mkdir "~/.emacs.d/bak_dir" ))

(setq
 backup-by-copying t ; 自动备份
 backup-directory-alist
 '(("." . "~/.emacs.d/bak_dir")) ; 自动备份在目录"~/.saves"下
 delete-old-versions t ; 自动删除旧的备份文件
 kept-new-versions 6 ; 保留最近的6个备份文件
 kept-old-versions 2 ; 保留最早的2个备份文件
 version-control t) ; 多次备份
(setq auto-save-default nil);;不生成#F#文件 .

(provide 'init-session)
