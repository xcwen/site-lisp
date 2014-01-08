;;; ### Indent ###
;;; --- 缩进设置
(setq-default indent-tabs-mode t)       ;默认用Tab模式
(setq default-tab-width 4)              ;设置TAB默认的宽度

(defun c-setting()
  (interactive)
  (setq tab-width 4
	c-basic-offset 4
	c-hanging-comment-ender-p nil
	indent-tabs-mode t)

  (evil-c-mode-auto-pair))


(dolist (hook (list                     ;设置用空格替代TAB的模式
               'emacs-lisp-mode-hook
               'lisp-mode-hook
               'lisp-interaction-mode-hook
               'scheme-mode-hook
               'c-mode-hook
               'c++-mode-hook
               'java-mode-hook
               'haskell-mode-hook
               'asm-mode-hook
               'emms-tag-editor-mode-hook
               'sh-mode-hook
               'haskell-cabal-mode-hook
               'qml-mode-hook
               ))
  (add-hook hook 'c-setting ))

(add-hook 'python-mode-hook
		  '(lambda()
			 (setq tab-width 4 indent-tabs-mode t python-indent-offset 4)
			 ))

(provide 'init-indent)

;;; init-indent.el ends here
