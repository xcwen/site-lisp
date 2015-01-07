

;; term-mode 不开启
;;(global-hl-line-mode 1)                                        ;高亮当前行
(dolist (hook (list                     
               'emacs-lisp-mode-hook
               'lisp-mode-hook
               'lisp-interaction-mode-hook
               'c-mode-hook
               'c++-mode-hook
               'js2-mode-hook
               'sh-mode-hook
			   'php-mode-hook
			   'web-mode-hook
			   'cc-mode-hook
			   'go-mode-hook
			   'python-mode-hook
			   'org-mode-hook
               ))
  (add-hook hook '(lambda()(hl-line-mode 1 ) ) ))
(provide 'init-hl-line)
