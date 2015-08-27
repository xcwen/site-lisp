;;; ### Indent ###
;;; --- 缩进设置
(setq-default indent-tabs-mode nil)     ;默认用Tab模式
(setq default-tab-width 4)              ;设置TAB默认的宽度
(setq tab-width 4)                      ;设置TAB默认的宽度

(defun c-setting()
  (interactive)
  (setq tab-width 4
		c-basic-offset 4
		c-hanging-comment-ender-p nil
		indent-tabs-mode nil)

  ;; { 的配对 单独处理
  (make-local-variable 'skeleton-pair-alist)
  (setq skeleton-pair-alist  '((?{ \n > _ \n ?} >)))
  (setq skeleton-pair t)
  (define-key evil-insert-state-map  (kbd "{") 'skeleton-pair-insert-maybe)   
  )

;;minibuffer-inactive-mode 不使用

(defvar my-electic-pair-modes '(minibuffer-inactive-mode))

(defun my-inhibit-electric-pair-mode (char)
  (not (member major-mode my-electic-pair-modes)))

(setq electric-pair-inhibit-predicate #'my-inhibit-electric-pair-mode)

;;正常符号配对
(electric-pair-mode 1)


(dolist (hook (list                     ;设置用空格替代TAB的模式
              'emacs-lisp-mode-hook
              'lisp-mode-hook
              'c-mode-hook
              'c++-mode-hook
              'js2-mode-hook
              'sh-mode-hook
			  'php-mode-hook
			  'go-mode-hook
			  'web-mode-hook
               ))
  (add-hook hook 'c-setting ))

(add-hook 'python-mode-hook
		  '(lambda()

			 (setq tab-width 4  indent-tabs-mode nil)
			 ;;正常符号配对
			 ))


(provide 'init-indent)
;;; init-indent.el ends here
