
(require 'package+)
(add-to-list 'package-archives
			 '("melpa" . "http://melpa.milkbox.net/packages/") t)
(package-manifest 'magit
				  'package+
				  'smex
				  'evil
				  'evil-surround
				  'evil-leader 
				  'evil-numbers
				  'web-mode
				  'js2-mode
				  'go-mode
				  'erlang
				  'lua-mode
				  'markdown-mode+
				  'multi-term
				  'org
				  'yasnippet
				  'rtags
				  'auto-complete
				  'auto-complete-clang
				  'jedi
				  'session
				  'xcscope
				  'go-autocomplete
				  'php-mode
				  '2048-game
				  )

(provide 'init-package)

