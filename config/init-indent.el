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
  (electric-pair-mode 1)
  )

;;(defun evil-c-mode-auto-pair ()
;;  (interactive)
;;;;  (make-local-variable 'skeleton-pair-alist)
;;;;  (setq skeleton-pair-alist  '(
;;;;			       (?{ \n > _ \n ?} >)))
;;;;  (setq skeleton-pair t)
;;;;  (define-key evil-insert-state-map  (kbd "(") 'skeleton-pair-insert-maybe)
;;;;  (define-key evil-insert-state-map  (kbd "[") 'skeleton-pair-insert-maybe)
;;;;  (define-key evil-insert-state-map  (kbd "'") 'skeleton-pair-insert-maybe)
;;;;  (define-key evil-insert-state-map  (kbd "\"") 'skeleton-pair-insert-maybe)
;;;;  (define-key evil-insert-state-map  (kbd "{") 'skeleton-pair-insert-maybe)   
;;  )
;;


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
			 (setq tab-width 4 indent-tabs-mode nil  python-indent-offset 4)
			 ))

(provide 'init-indent)

;;; init-indent.el ends here
