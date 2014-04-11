;;; ### Unset key ###
;;; --- 卸载按键

(define-key ac-completing-map  (kbd  "C-p")   'ac-previous)
(define-key ac-completing-map  (kbd  "C-n")   'ac-next)
(define-key ac-completing-map [f1] nil)
(define-key ac-mode-map  [(control tab )] 'auto-complete)
(define-key ac-mode-map  [(backtab)] '(lambda()
										(interactive )
										(if (string= major-mode  "go-mode")
											( auto-complete  '(ac-source-go ))
										  ( auto-complete  '(ac-source-clang )))
										))

(global-set-key (kbd "M-w") 'copy-region-or-whole-line)
(global-set-key (kbd "C-SPC") nil)

(global-set-key (kbd "C-h") 'delete-backward-char)
(global-set-key (kbd "C-S-h") 'region-indent-sub)
(global-set-key (kbd "C-S-l") 'region-indent-add)
(global-set-key (kbd "C-?") 'replace-regexp)
(global-set-key "\M-;" 'qiang-comment-dwim-line)
(global-set-key (kbd "C-^") 'do-switch-buffer )
(global-set-key (kbd "C-/") 'cscope-find-egrep-pattern)

(define-key global-map (kbd "M-l") 'wcy-mark-some-thing-at-point)

(global-set-key (kbd "RET") 'newline-and-indent)
(global-set-key (kbd "C-x C-z") 'ignore)
(global-set-key (kbd "<f8>") 'switch-file-term)   
(global-set-key (kbd "<f7>") 'search-proto-info )   
(global-set-key (kbd "<f10>") nil )   
(global-set-key (kbd "M-`") nil )   


(global-set-key (kbd "C-*") 'evil-search-word-forward ) 
(global-set-key (kbd "C-x C-k") 'kill-this-buffer ) 

(global-set-key "\M-1" 'delete-other-windows)

(define-key global-map [f5] 'my-recentf-open) 

(provide 'init-key)
