
(require 'package)


(setq package-archives
			 '(("melpa" . "https://melpa.org/packages/")) )

(package-initialize)
(unless (package-installed-p 'package+ )
  (package-refresh-contents)
  (package-install 'package+ )
 )

(require 'package+)

(package-manifest
 ;;'magit
				  'smex
				  's
				  'f
                  'htmlize
				  'package+
                  'showkey
                  'auto-package-update
                  'elpy
                  'yaml-mode
;;                  'tern-auto-complete
                  'edts
				  'evil
				  'evil-surround
				  'evil-leader 
				  'evil-numbers
				  'emacs-eclim
                  'cmake-mode
                  'ac-html-bootstrap 
                  'ac-html
                  'ac-html-csswatcher
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
				  'ac-php
				  'jedi
				  'session
				  'xcscope
				  'go-autocomplete
				  'php-mode
				  'json-mode
                  'company
                  'powerline-evil
                  'diminish
				  )
(require 'auto-package-update)

(provide 'init-package)

