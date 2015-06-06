(setq org-src-fontify-natively t)
(setq org-export-html-validation-link nil)
(setq org-startup-indented t)
(setq org-agenda-files (list "~/todo.org"))
(add-hook 'org-mode-hook
		  (lambda ()
			(make-variable-buffer-local 'yas-trigger-key)
			(setq yas-trigger-key [tab])
			(add-to-list 'org-tab-first-hook 'yas-org-very-safe-expand)
			(define-key yas/keymap [tab] 'yas-next-field)))

(add-hook 'org-mode-hook 
		  (lambda () (setq truncate-lines nil)))


(add-hook
 'org-mode-hook
 '(lambda()
	(interactive)
	(message "====org-mode-hook====")
	(toggle-truncate-lines 0 )
	(evil-define-key 'normal org-mode-map  (kbd ",h")
	  '(lambda ()
		 (interactive)
		 (load-theme 'tsdh-light )
		 (org-html-export-to-html)
		 (load-theme 'tsdh-dark )))

	(evil-define-key  'normal org-mode-map   (kbd "<tab>") 'org-cycle )
	(evil-define-key 'insert org-mode-map    (kbd "<tab>") 'yas-expand )
	(evil-define-key 'normal org-mode-map    (kbd ",1") 'org-agenda )
	))

(provide 'init-org)
