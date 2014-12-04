
(add-hook
 'term-mode-hook
 '(lambda()
	(yas-minor-mode -1 )
	(setq term-bind-key-alist nil)

	(add-to-list 'term-bind-key-alist '("C-S-e" . term-send-esc  ))
	(add-to-list 'term-bind-key-alist '("C-^" . do-switch-buffer ))
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
 
;;24.3 以前的版本，颜色设置 
(if (and    (= emacs-major-version 24)  (< emacs-minor-version 3)  )
	(progn
	  (setq ansi-term-color-vector
			[unspecified "#111" "#963F3C" "#5FFB65" "#FFFD65"
						 "#0082FF" "#FF2180" "#57DCDB" "#FFFFFF"])
	  (setq ansi-color-for-comint-mode t)
	  (setq term-default-bg-color "#333333")
	  (setq term-default-fg-color "grey80"))) 

(provide 'init-term)
