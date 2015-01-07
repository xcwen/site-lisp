
(require 'multi-term)
(add-hook
 'term-mode-hook
 '(lambda()
	(yas-minor-mode -1 )

	(setq term-unbind-key-list  nil)
	(setq term-bind-key-alist nil)

	(add-to-list 'term-bind-key-alist '("C-S-e" . term-send-esc  ))
	(add-to-list 'term-bind-key-alist '("TAB" . term-send-raw))
	(add-to-list 'term-bind-key-alist '("M-x" . smex ))
	(add-to-list 'term-bind-key-alist '("M-1" .  delete-other-windows ))
	(add-to-list 'term-bind-key-alist '("C-^" . do-switch-buffer ))
	;;(add-to-list 'term-bind-key-alist '("C-6" . do-switch-buffer ))
	(add-to-list 'term-bind-key-alist '( "C-S-t". (lambda() (interactive) (multi-term) (evil-check-close-local-mode )  ) ))
	(add-to-list 'term-bind-key-alist '( "C-S-h". (lambda() (interactive) (multi-term-prev 1 ) (evil-check-close-local-mode )  ) ))
	(add-to-list 'term-bind-key-alist '( "C-S-l". (lambda() (interactive) ( multi-term-next 1 ) (evil-check-close-local-mode )  ) ))
	(add-to-list 'term-bind-key-alist '( "C-S-c".   term-interrupt-subjob  ))

	(add-to-list 'term-bind-key-alist '( "C-c".  copy-region-or-whole-line  ))
	(add-to-list 'term-bind-key-alist '( "C-v". term-paste ))
	(add-to-list 'term-bind-key-alist '( "C-y". term-paste ))
    
	))


(custom-set-faces
 '(term-color-blue ((t (:background "blue" :foreground "steel blue"))))
 '(term-color-green ((t (:background "green3" :foreground "lime green"))))
 '(term-color-red ((t (:background "red3" :foreground "brown")))))
 

(provide 'init-term)
