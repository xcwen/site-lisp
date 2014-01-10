;;; Require

(require 'yasnippet)

(defun load-yas ()
  "-----加载 yasnippet ---------------
;;auto-complete 本来不应该在此运行的, auto-complete-clang 和 yasnippet 有冲突
;;如果不运行 在c++ clang补全时会出现无法增量补全"
  ;;盒子外处理问题:>
  (find-file  "/tmp/__a__.el") 		;打开一个临时文件 ,防止auto-complete 在一个不确认的地方运行。
  (auto-complete)			;fix for clang 
  (kill-buffer (current-buffer))	;关闭临时文件
  (setq yas-snippet-dirs   (list   "~/site-lisp/config/my-yas" )  )

  (require 'yasnippet)
  (yas-global-mode 1)
  
  )


(add-hook 'after-init-hook 'load-yas)

;; Disable yasnippet mode on some mode.
(dolist (hook (list
               'term-mode-hook
               ))
  (add-hook hook '(lambda () (yas-minor-mode -1))))


(provide 'init-yasnippet)

;;; init-yasnippet.el ends here
