;;; ### Unset key ###
;;; --- 卸载按键

(require 'evil)

;;重置查找函数
(evil-define-motion evil-search-word-forward (count &optional symbol)
  "Search forward for symbol under point."
  :jump t
  :type exclusive
  (interactive (list (prefix-numeric-value current-prefix-arg)
                     evil-symbol-word-search))
  (dotimes (var (or count 1))
    (evil-search-word t nil t)))

(defun do-switch-buffer ()
  "DOCSTRING"
  (interactive)
  (ido-switch-buffer )
  (evil-check-close-local-mode)
  )
(defun evil-check-close-local-mode ()
  (when (string= major-mode  "term-mode") (evil-local-mode 0)  ) 
  )




(set-evil-all-state-key (kbd  "C-p")   'dabbrev-expand  )


(setq evil-default-cursor  '("white" box) )
(set-evil-all-state-key  (kbd "<tab>")  'yas-expand-for-vim )
(set-evil-all-state-key "\M-h"  'backward-kill-word-without-_)

(set-evil-all-state-key ( kbd "C-}") 'find-tag-next-ex)
(set-evil-all-state-key "\C-x\C-o"  'other-window )
(set-evil-all-state-key (kbd "C-x C-k")  'kill-this-buffer )

(set-evil-all-state-key  (kbd "C-r") 'redo)

(set-evil-normal-state-key "\C-^"  'do-switch-buffer)
(set-evil-normal-state-key "Y"  'copy-region-or-whole-line )
(set-evil-normal-state-key "D"  'kill-region-or-whole-line )
(set-evil-normal-state-key (kbd ",a") ' switch-cc-to-h )
(set-evil-normal-state-key (kbd ",f") 'gen-function-as-kill  )
(set-evil-normal-state-key (kbd ",r") 'remake-tags)
(set-evil-normal-state-key (kbd ",u") 'upper-or-lower-whole-word)
(set-evil-normal-state-key (kbd ",w") 'save-buffer)
(set-evil-normal-state-key (kbd ",o") 'other-window)
(set-evil-normal-state-key (kbd ",c") 'find-cmd-def)
(set-evil-normal-state-key (kbd ",k") 'kill-other-buffers)
(set-evil-normal-state-key (kbd ",p") 'proto-show-msg)
(set-evil-normal-state-key (kbd ",d") 'show-dict)
(define-key evil-visual-state-map (kbd ",d") 'show-dict ) 
(set-evil-normal-state-key (kbd ",y") 'copy-whole-word)
										;(require    'compilation-mode)

(add-hook
 'compilation-mode-hook
 '(lambda()
	(interactive)
	(define-key compilation-mode-map  (kbd  ",o")   'other-window)
	))



(set-evil-normal-state-key (kbd ",s") 'cscope-find-egrep-pattern)



(set-evil-normal-state-key (kbd ",q") '(lambda ()
										 (interactive )
										 (multi-term-prev 0 )
										 (evil-check-close-local-mode ) 
										 )) 

(set-evil-normal-state-key (kbd ",m")
						   '(lambda()(interactive)
							  (if (functionp 'recompile)
								  (recompile )
								(compile "cd ./build && make "))
							  ) )

(set-evil-normal-state-key (kbd ",m")
						   '(lambda()(interactive)
							  (let ( cmd )

								(setq cmd
									  (concat "cd "
											  (file-name-directory (buffer-file-name)  )
											  "/build && make "
											  (file-name-nondirectory (buffer-file-name) )
											  ".o" 
											  )
									  )
								(message cmd)

								(compile cmd)
								)))


(setq revert-without-query '(".*"))
(set-evil-normal-state-key (kbd ",l") 'revert-buffer )


;;ex 命令行调整
(evil-ex-define-cmd  "wq"  '(lambda ()
							  (interactive )
							  (save-buffer )
							  (multi-term-prev 0 )
							  (evil-check-close-local-mode ) 
							  ))

(evil-ex-define-cmd  "q"  '(lambda ()
							 (interactive )
							 (multi-term-prev 0 )
							 (evil-check-close-local-mode ) 
							 ))



;;---------------------------- local -------------------------


(mapc (lambda (mode) (evil-set-initial-state mode 'normal ))
	  '(package-menu-mode help-mode )
	  )


(add-hook
 'emacs-lisp-mode-hook
 '(lambda()
	(interactive)
	( define-key evil-normal-state-local-map  (kbd "C-]") 'describe-function)
	( define-key evil-insert-state-local-map  (kbd "C-]") 'describe-function )
	))

;;(define-key evil-motion-state-map "\C-]" 'evil-jump-to-tag)
(set-evil-normal-state-key (kbd "C-]")
						   '(lambda()(interactive)
							  ;;得到.tags文件夹所在的目录
							  (set-tags-config-for-cur-file)
							  (evil-jump-to-tag))) 

(set-evil-normal-state-key (kbd ",t")
						   '(lambda()(interactive)
							  (set-tags-config-for-cur-file))) 

(add-hook
 'cscope-list-entry-hook
 '(lambda()
	(interactive)
	(define-key evil-normal-state-local-map  (kbd "n") 'cscope-show-next-entry-other-window )
	( define-key evil-normal-state-local-map (kbd "p") 'cscope-show-prev-entry-other-window ) ))

(evil-mode 1) 

(provide 'init-evil)
