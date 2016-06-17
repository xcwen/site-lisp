;;; ### Unset key ###
;;; --- 卸载按键

(define-key ac-completing-map  (kbd  "C-p")   'ac-previous)
(define-key ac-completing-map  (kbd  "C-n")   'ac-next)
(define-key ac-completing-map "\C-s" 'ac-isearch)
(define-key ac-completing-map [f1] nil)
(define-key ac-mode-map  [(control tab )] 'auto-complete)
(define-key ac-mode-map  [(backtab)] 'my-ac-mode-complete ) 
(require 'company)
(define-key company-mode-map  [(control tab )] 'company-complete )

(defun ac-filename ()
    "DOCSTRING"
  (interactive)
  (let ()
    (if (string= major-mode "js2-mode" )
        (progn
          (company-mode-on)
          (company-complete)
          )
        (auto-complete '(ac-source-filename ))
        )
    ))
(define-key ac-mode-map  (kbd "C-:") 'ac-filename )

;;查找时,使用trim-string,去掉前后空格
(define-key isearch-mode-map (kbd "C-y")  '(lambda()(interactive)
											   (isearch-yank-string (trim-string (current-kill 0) ))))

(define-key isearch-mode-map (kbd "C-v")  '(lambda()(interactive)
											   (isearch-yank-string (trim-string (current-kill 0) ))))


(define-key  minibuffer-inactive-mode-map (kbd "C-y")  '(lambda()(interactive)
											   (insert (trim-string (current-kill 0) ))))

(define-key  minibuffer-inactive-mode-map (kbd "C-v")  '(lambda()(interactive)
											   (insert (trim-string (current-kill 0) ))))




(global-set-key (kbd "M-w")   'copy-region-or-whole-line)
(global-set-key (kbd "C-SPC") nil)
(global-set-key (kbd "C-\\") nil)

(global-set-key (kbd "C-h")   'delete-backward-char)
(global-set-key (kbd "C-S-h") 'multi-term-prev)
(global-set-key (kbd "C-S-l") 'multi-term-next)
(global-set-key (kbd "C-?")   'replace-regexp)


(define-key global-map (kbd "M-l") 'wcy-mark-some-thing-at-point)

(global-set-key (kbd "RET")     'newline-and-indent)
(global-set-key (kbd "C-x C-z") 'ignore)
(global-set-key (kbd "C-x C-k") '(lambda()(interactive) (message "1111") (ido-kill-buffer ) (message "1111")   ) )
(global-set-key (kbd "<f4>")    'package-list-packages)   
(global-set-key (kbd "<f8>")    'switch-file-term)   
(global-set-key (kbd "<f7>")    'open-term-file )   
(global-set-key (kbd "<f10>") nil )   


(global-set-key (kbd "M-`") nil )   


(global-set-key (kbd "C-*") 'evil-search-word-forward ) 


(global-set-key "\M-1" 'delete-other-windows)

(define-key global-map [f5] 'my-recentf-open) 

;; smex set key
(global-set-key (kbd "M-x") 'smex)



(provide 'init-key)
