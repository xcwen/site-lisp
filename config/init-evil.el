;;; ### Unset key ###
;;; --- 卸载按键 109

(require 'evil)
(require 'evil-numbers)
(require 'evil-leader)


(global-evil-leader-mode)

;;normal-state
(evil-leader/set-key
  "-" 'evil-numbers/dec-at-pt
  "=" 'evil-numbers/inc-at-pt
  "k" 'kill-other-buffers
  "t" 'set-tags-config-for-cur-file
  "l" 'revert-buffer 
  "f" 'gen-function-as-kill  
  "r" 'remake-tags
  "u" 'upper-or-lower-whole-word
  "w" 'save-buffer
  "o" 'other-window
  "c" 'find-cmd-def
  "p" 'proto-show-msg
  "d" 'show-dict
  "y" 'copy-whole-word
  "s" 'cscope-find-egrep-pattern
  "q" '(lambda ()
		 (interactive )
		 (multi-term-prev 0 )
		 (evil-check-close-local-mode ) 
		 )

  "a" '(lambda()
		 (interactive )
		 (let ((file-ext (file-name-extension (buffer-file-name ))))
		   (message file-ext )
		   (if  (string= file-ext "html")
			   (progn
				 (if (string= major-mode "html-mode" ) (js2-mode) (html-mode)))
			 (switch-cc-to-h ))))
  )
(evil-leader/set-leader ",") 

;;(evil-leader/set-key-for-mode 'emacs-lisp-mode "b" 'byte-compile-file)

;;编译
(evil-leader/set-key-for-mode 'js2-mode "m"  'js2-mode-display-warnings-and-errors)
(evil-leader/set-key-for-mode 'php-mode "m" '(lambda()

											   (interactive)
											   (flymake-mode 1)
											   (flymake-goto-next-error)
											   (flymake-display-err-menu-for-current-line)
											   (flymake-mode 0)
											   ))
(evil-leader/set-key-for-mode 'c++-mode "m" 
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




;;设置查找是否按照symbol方式
(custom-set-variables
 '(evil-symbol-word-search  t))

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

(define-key evil-visual-state-map (kbd ",d") 'show-dict ) 
										;(require    'compilation-mode)

(define-key evil-normal-state-map "gf" '(lambda()
											  (interactive )
											  (let ((cur-word (current-word )))
												(if (and (string= major-mode "php-mode")
														 (string-match  "_model$" cur-word ) ) 
													(find-file (concat  "../model/" cur-word ".class.php"  )  )

												  (find-file-at-point)))))





;;按 ESC 同时关闭输入法
;;(define-key evil-normal-state-map [escape] 'evil-force-normal-state)
;;(define-key evil-insert-state-map [escape] 'evil-normal-state)
(define-key evil-normal-state-map [escape] '(lambda()
											  (interactive )
											  (fcitx-inactivate-input-method)
											  (evil-force-normal-state)
											  ))
(define-key evil-insert-state-map [escape] '(lambda()
											  (interactive )
											  (fcitx-inactivate-input-method)
											  (evil-normal-state)
											  ))







( define-key evil-visual-state-map (kbd "*") '(lambda ()
										 (interactive )
										 (setq word (if (and  mark-active
															  (not  (= (region-beginning) (region-end) )))
														(buffer-substring-no-properties (region-beginning)(region-end)) (current-word )))
										 (evil-normal-state)
										 (evil-search word t t )
										 ))




(setq revert-without-query '(".*"))


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

(set-evil-normal-state-key (kbd "g C-]")
						   '(lambda()(interactive)
							  
							  ;;得到.tags文件夹所在的目录
							  (message " tags-table-list=%s " tags-table-list  )
							  (set-tags-config-for-cur-file)
							  (message " end tags-table-list=%s " tags-table-list  )
							  (evil-jump-to-tag))) 







;;---------------------------- 模式特殊处理 -------------------------


(mapc (lambda (mode) (evil-set-initial-state mode 'normal ))
	  '(package-menu-mode help-mode ))

;;(evil-leader/set-key-for-mode 'emacs-lisp-mode "b" 'byte-compile-file)


(add-hook
 'emacs-lisp-mode-hook
 '(lambda()
	(interactive)
	( define-key evil-normal-state-local-map  (kbd "C-]") 'find-function)
	( define-key evil-insert-state-local-map  (kbd "C-]") 'find-function )
	))

(defun set-rtags-bind-key ()
  "DOCSTRING"
	( define-key evil-normal-state-local-map  (kbd "C-]") 'rtags-find-symbol-at-point)
	( define-key evil-insert-state-local-map  (kbd "C-]") 'rtags-find-symbol-at-point)

	( define-key evil-normal-state-local-map  (kbd "C-t") 'rtags-location-stack-back )
	( define-key evil-insert-state-local-map  (kbd "C-t") 'rtags-location-stack-back )

	( define-key evil-normal-state-local-map  (kbd "C-S-t") 'rtags-location-stack-forward)
	( define-key evil-insert-state-local-map  (kbd "C-S-t") 'rtags-location-stack-forward)

	( define-key evil-normal-state-local-map  (kbd ",s") 'rtags-find-all-references-at-point)
	( define-key evil-normal-state-local-map  (kbd ",r") 'rtags-reparse-file)
	( define-key evil-normal-state-local-map  (kbd ",h") 'rtags-display-summary)
	)

;; C C++ tags 调整 
(add-hook 'c++-mode-hook 'set-rtags-bind-key)
(add-hook 'c-mode-hook 'set-rtags-bind-key)






(add-hook 'python-mode-hook
          '(lambda ()
			 ( define-key evil-normal-state-local-map  (kbd "C-]") 'jedi:jump-to-definition)
			 ( define-key evil-normal-state-local-map  (kbd "C-t") 'jedi:jump-back)
			 ))

(add-hook 'php-mode-hook
          '(lambda ()
			 (flymake-stop-all-syntax-checks)))




(add-hook
 'rtags-mode-hook
 '(lambda()
	(interactive)
	(define-key evil-normal-state-local-map  (kbd "j") '(lambda()
														  (interactive)
														  (evil-next-line)
														  (rtags-show-in-other-window) ))
	(define-key evil-normal-state-local-map  (kbd "k") '(lambda()
														  (interactive)
														  (evil-previous-line)
														  (rtags-show-in-other-window) ))
	(define-key evil-normal-state-local-map  (kbd "<return>") '(lambda()
														  (interactive)
														  (rtags-select-other-window) ))

	))


(add-hook
 'cscope-list-entry-hook
 '(lambda()
	(interactive)
	(define-key evil-normal-state-local-map  (kbd "n") 'cscope-show-next-entry-other-window )
	( define-key evil-normal-state-local-map (kbd "p") 'cscope-show-prev-entry-other-window ) ))

(add-hook
 'package-menu-mode-hook
 '(lambda()
	(interactive)
	( define-key evil-normal-state-local-map (kbd "E") 'package-menu-execute ) ))


(add-hook
 'compilation-mode-hook
 '(lambda()
	(interactive)
	(define-key compilation-mode-map  (kbd  ",o")   'other-window)
	))



(evil-mode 1) 

(provide 'init-evil)
