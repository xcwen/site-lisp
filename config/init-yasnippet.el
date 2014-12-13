;;; Require

(require 'yasnippet)
(setq yas-snippet-dirs   (list   "~/site-lisp/config/my-yas" )  )
(yas-global-mode 1)

;; Disable yasnippet mode on some mode.
(dolist (hook (list
               'term-mode-hook
               ))
  (add-hook hook '(lambda () (yas-minor-mode -1))))

(defun delete-args-to-end ()
  "DOCSTRING"
  (interactive)
  (let (start-pos end-pos)
	(save-excursion
      (re-search-backward "[(,]" ) 
	  (setq start-pos (point))
	  (when(= ?\(  (following-char))
		  (setq start-pos (+  1 start-pos ))
          (insert "(")
		  )
	  
      (re-search-forward "[)\n]")   
	  (setq end-pos (1- (point)) )
	  (kill-region start-pos end-pos )
	  )
	))

;;删除多余参数
(define-key  yas-keymap  (kbd "C-e") 'delete-args-to-end)


(provide 'init-yasnippet)

;;; init-yasnippet.el ends here
