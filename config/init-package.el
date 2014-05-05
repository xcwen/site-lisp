
(package-initialize)
(add-to-list 'package-archives
			 '("melpa" . "http://melpa.milkbox.net/packages/") t)
(unless (package-installed-p 'package+)
  (package-install 'package+))

(package-manifest 'magit
				  'package+
				  'ssh
				  'evil
				  'js2-mode
				  'go-mode
				  'lua-mode
				  'multi-term
				  'org
				  'yasnippet
				  'auto-complete
				  'auto-complete-clang
				  'jedi
				  'epc
				  'session
				  'xcscope
				  'go-autocomplete
				  'php-mode
				  )

(provide 'init-package)

