;;; --- 绑定扩展名到特定的模式
(dolist (elt-cons '(
                    ("\\.markdown" . markdown-mode)
                    ("\\.md" . markdown-mode)
                    ("\\.org\\'" . org-mode)
                    ("\\.cron\\(tab\\)?\\'" . crontab-mode)
                    ("cron\\(tab\\)?\\." . crontab-mode)
                    ("\\.html\\'" . web-mode)
                    ("SConstruct". python-mode)
                    ("\\.asdf\\'" . lisp-mode)
                    ("\\.js\\'" . js2-mode)
                    ("\\.h\\'" . c++-mode)
                    ("\\.mm\\'" . objc-mode)
                    ("\\.m\\'" . objc-mode)
                    ("\\.tpro\\'" . c++-mode)
                    ("\\.lua\\'" . lua-mode)
                    ("\\.php\\'" . php-mode)
                    ))
  (add-to-alist 'auto-mode-alist elt-cons))


;;; ### Auto-fill ###
;;; --- 自动换行
(setq default-fill-column 100)          ;默认显示 100列就换行
(dolist (hook (list
               'after-text-mode-hook
               'message-mode-hook
               'org-mode-hook
               ))
  (add-hook hook '(lambda () (auto-fill-mode 1))))



(add-hook 'c-mode-hook '(lambda ( )
							(modify-syntax-entry ?_ "w" c-mode-syntax-table) ;将 _ 加入 单词中
							 ) )

(add-hook 'php-mode-hook '(lambda ( )
							(modify-syntax-entry ?$ "." php-mode-syntax-table) 
							 (modify-syntax-entry ?_ "w" php-mode-syntax-table) ;将 _ 加入 单词中
                             (require 'php-align)
                             (php-align-setup)
							 ))

(add-hook 'org-mode-hook '(lambda ( )
							 (modify-syntax-entry ?_ "w" org-mode-syntax-table) ;将 _ 加入 单词中
							 ) )




(add-hook 'c++-mode-hook '(lambda ( )
							(modify-syntax-entry ?_ "w" c++-mode-syntax-table) ;将 _ 加入 单词中
							 ) )

(add-hook 'term-mode-hook '(lambda ( )
							(modify-syntax-entry ?_ "w" term-mode-syntax-table) ;将 _ 加入 单词中
							(modify-syntax-entry ?. "w" term-mode-syntax-table) ;将 _ 加入 单词中
							(modify-syntax-entry ?- "w" term-mode-syntax-table) ;将 _ 加入 单词中
							 ) )
(add-hook 'erlang-mode-hook '(lambda ( )
							(modify-syntax-entry ?_ "w" erlang-mode-syntax-table) ;将 _ 加入 单词中
							 ))



(add-hook 'nxml-mode-hook '(lambda ( )
							 (modify-syntax-entry ?= "." nxml-mode-syntax-table) 
							 (modify-syntax-entry ?_ "w" nxml-mode-syntax-table) ;将 _ 加入 单词中
							 ) )
(add-hook 'web-mode-hook '(lambda ( )
							 (modify-syntax-entry ?+ "." web-mode-syntax-table) 
							 ) )


(add-hook 'python-mode-hook '(lambda ( )
							   (modify-syntax-entry ?_ "w" python-mode-syntax-table) ;将 _ 加入 单词中
							 ) )

(add-hook 'js2-mode-hook '(lambda ( )
							(modify-syntax-entry ?_ "w" js2-mode-syntax-table) ;将 _ 加入 单词中
							 ) )
(add-hook 'sql-mode-hook '(lambda ( )
							(modify-syntax-entry ?_ "w" sql-mode-syntax-table) ;将 _ 加入 单词中
							 ) )


(add-hook 'go-mode-hook '(lambda ( )
						   (require 'go-autocomplete)
							 ) )

(add-hook 'org-agenda-mode-hook '(lambda ( )
								   (org-defkey org-agenda-mode-map "j"        'org-agenda-next-line)
								   (org-defkey org-agenda-mode-map "k"        'org-agenda-previous-line)
							 ) )



(provide 'init-mode)

;;; init-mode.el ends here
