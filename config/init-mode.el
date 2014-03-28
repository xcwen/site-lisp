;;; --- 绑定扩展名到特定的模式
(dolist (elt-cons '(
                    ("\\.markdown" . markdown-mode)
                    ("\\.md" . markdown-mode)
                    ("\\.coffee$" . coffee-mode)
                    ("\\.iced$" . coffee-mode)
                    ("Cakefile" . coffee-mode)
                    ("\\.stumpwmrc\\'" . lisp-mode)
                    ("\\.[hg]s\\'" . haskell-mode)
                    ("\\.hi\\'" . haskell-mode)
                    ("\\.hs-boot\\'" . haskell-mode)
                    ("\\.chs\\'" . haskell-mode)
                    ("\\.l[hg]s\\'" . literate-haskell-mode)
                    ("\\.inc\\'" . asm-mode)
                    ("\\.max\\'" . maxima-mode)
                    ("\\.lrc\\'" . emms-lyrics-mode)
                    ("\\.org\\'" . org-mode)
                    ("\\.cron\\(tab\\)?\\'" . crontab-mode)
                    ("cron\\(tab\\)?\\." . crontab-mode)
                    ("\\.a90\\'" . intel-hex-mode)
                    ("\\.hex\\'" . intel-hex-mode)
                    ("\\.html\\'" . html-helper-mode)
                    ("SConstruct". python-mode)
                    ("\\.ml\\'" . tuareg-mode)
                    ("\\.mli\\'" . tuareg-mode)
                    ("\\.mly\\'" . tuareg-mode)
                    ("\\.mll\\'" . tuareg-mode)
                    ("\\.mlp\\'" . tuareg-mode)
                    ("\\.qml\\'" . qml-mode)
                    ("\\.jl\\'" . lisp-mode)
                    ("\\.asdf\\'" . lisp-mode)
                    ("\\.js\\'" . js2-mode)
                    ("\\.h\\'" . c++-mode)
                    ("\\.tpro\\'" . c++-mode)
                    ("\\.lua\\'" . lua-mode)
                    ("\\.php\\'" . php-mode)
                    ))
  (add-to-alist 'auto-mode-alist elt-cons))

;;; Qml mode
(autoload 'qml-mode "qml-mode")
(autoload 'php-mode "php-mode")
(autoload 'js2-mode "js2-mode")
(autoload 'nxml-mode "nxml-mode")
(autoload 'lua-mode "lua-mode")

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


(add-hook 'c++-mode-hook '(lambda ( )
							(modify-syntax-entry ?_ "w" c++-mode-syntax-table) ;将 _ 加入 单词中
							 ) )


(add-hook 'sgml-mode-hook '(lambda ( )
							 (modify-syntax-entry ?_ "w" html-mode-syntax-table) ;将 _ 加入 单词中
							 ) )

(add-hook 'nxml-mode-hook '(lambda ( )
							 (modify-syntax-entry ?= "." nxml-mode-syntax-table) 
							 (modify-syntax-entry ?_ "w" nxml-mode-syntax-table) ;将 _ 加入 单词中
							 ) )

(add-hook 'python-mode-hook '(lambda ( )
							   (modify-syntax-entry ?_ "w" python-mode-syntax-table) ;将 _ 加入 单词中
							 ) )

(add-hook 'js2-mode-hook '(lambda ( )
							(modify-syntax-entry ?_ "w" js2-mode-syntax-table) ;将 _ 加入 单词中
							 ) )




(provide 'init-mode)

;;; init-mode.el ends here
