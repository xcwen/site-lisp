
(add-hook
 'term-mode-hook
 '(lambda()
	(yas-minor-mode -1 )

	(add-to-list 'term-bind-key-alist '("C-c C-e" . term-send-esc  ))
	(add-to-list 'term-bind-key-alist '("C-^" . do-switch-buffer ))
	(add-to-list 'term-bind-key-alist '( "M-o". other-window ))
	(add-to-list 'term-bind-key-alist '( "C-y". term-paste ))
	(add-to-list 'term-bind-key-alist '( "C-t". (lambda() (interactive) (multi-term) (evil-check-close-local-mode )  ) ))
	(add-to-list 'term-bind-key-alist '( "C-h". (lambda() (interactive) (multi-term-prev 1 ) (evil-check-close-local-mode )  ) ))
	(add-to-list 'term-bind-key-alist '( "C-l". (lambda() (interactive) ( multi-term-next 1 ) (evil-check-close-local-mode )  ) ))

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
