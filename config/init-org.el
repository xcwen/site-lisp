
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
	( define-key evil-normal-state-local-map  (kbd ",h")
	  '(lambda ()
		 (interactive)
		 (load-theme 'tsdh-light )
		 (org-export-as-html-and-open )
		 (load-theme 'tsdh-dark )
		 )
	  )
	( define-key evil-normal-state-local-map  (kbd "<tab>") 'org-cycle )
	( define-key evil-insert-state-local-map  (kbd "<tab>") 'yas-expand )
	( define-key evil-normal-state-local-map  (kbd ",1") 'org-agenda )
	))
(provide 'init-org)
