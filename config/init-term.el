
(require 'multi-term)

(defvar term-local-cmd-start-line-regex-str
  "^localhost.*\\$[ \t]*$"
  "doc ,line like:
localhost:~/site-lisp/config$"
  )

(add-hook
 'term-mode-hook
 '(lambda()
	(yas-minor-mode -1 )

	(setq term-unbind-key-list  '("C-x"))
	(setq term-bind-key-alist nil)

	(add-to-list 'term-bind-key-alist '("M-x" . smex ))
	(add-to-list 'term-bind-key-alist '("M-1" .  delete-other-windows ))
	(add-to-list 'term-bind-key-alist '("C-^" . do-switch-buffer ))
	;;(add-to-list 'term-bind-key-alist '("C-6" . do-switch-buffer ))

    ;; C-6 -> C-^ 
	(add-to-list 'term-bind-key-alist '( "C-6". (lambda() (interactive)  (term-send-raw-string "\C-^" ) ) ))

	(add-to-list 'term-bind-key-alist '( "C-S-t". (lambda() (interactive) (multi-term) (evil-check-close-local-mode )  ) ))
	(add-to-list 'term-bind-key-alist '( "C-S-h". (lambda() (interactive) (multi-term-prev 1 ) (evil-check-close-local-mode )  ) ))
	(add-to-list 'term-bind-key-alist '( "C-S-l". (lambda() (interactive) ( multi-term-next 1 ) (evil-check-close-local-mode )  ) ))
	(add-to-list 'term-bind-key-alist '( "C-S-c".   term-interrupt-subjob  ))

	(add-to-list 'term-bind-key-alist '( "C-c".  copy-region-or-whole-line  ))
	(add-to-list 'term-bind-key-alist '( "M-w". copy-region-or-whole-line ))
	(add-to-list 'term-bind-key-alist '( "C-v". term-paste ))
	(add-to-list 'term-bind-key-alist '( "C-y". term-paste ))
	))


(custom-set-faces
 '(term-color-blue ((t (:background "blue" :foreground "steel blue"))))
 '(term-color-green ((t (:background "green3" :foreground "lime green"))))
 '(term-color-red ((t (:background "red3" :foreground "brown")))))

(defun  multi-term-goto-last-term ()
  "DOCSTRING"
  (interactive)
  (let (find-flag opt-file-name find-path-str init-cmd  line-txt)
    (setq opt-file-name (buffer-file-name)   )

    (dolist  ( opt-buffer (buffer-list) )
      (when (term-check-proc opt-buffer )
        (switch-to-buffer opt-buffer) 
        (setq find-flag t)
        (return )
        ))
    (unless find-flag
      (multi-term  ))

    (evil-local-mode 0)
    (undo-tree-mode -1 )

    ;;go to file location dir 
    (if (and  opt-file-name  (file-exists-p opt-file-name ) )
        (setq file-path-str (file-name-directory opt-file-name ) )
      (setq file-path-str (concat  (getenv "HOME") "/" )))

    (setq line-txt (buffer-substring-no-properties
                    (line-beginning-position)
                    (line-end-position )))

    ;;(message "===%s %s" default-directory file-path-str )
    ;;进入当前文件所在文件夹
    (when (and  (not (string= file-path-str default-directory ))
                (string-match term-local-cmd-start-line-regex-str line-txt ) ;;本地，处于命令行完成状态
                )
      (setq init-cmd  (concat "cd " file-path-str  " # goto file location   \r" ) )
      (term-send-raw-string init-cmd ))
    ))

(defun switch-file-term ()
  " 交换终端和文件"
  (interactive)
  ;;(message "%s %s %s" "====" opt-file-name "kkk")
  (if (string= major-mode  "term-mode")
      (evil-buffer nil )
    (multi-term-goto-last-term)
    ))


(provide 'init-term)
