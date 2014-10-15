
(require 'package+)
(add-to-list 'package-archives
			 '("melpa" . "http://melpa.milkbox.net/packages/") t)

(package-manifest 'magit
				  'package+
				  'evil
				  'evil-surround
				  'evil-leader 
				  'evil-numbers
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
				  'epc
				  'session
				  'xcscope
				  'go-autocomplete
				  'php-mode
				  '2048-game
				  )

(provide 'init-package)

