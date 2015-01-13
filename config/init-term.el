
(require 'multi-term)

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
  (let (find-flag)
  (dolist  ( opt-buffer (buffer-list) )
    (when (term-check-proc opt-buffer )
      (switch-to-buffer opt-buffer) 
      (setq find-flag t)
      (return )
      ))
  (unless find-flag
    (multi-term-next 0 )

    )))

(defun switch-file-term ()
  " 交换终端和文件"
  (interactive)
  (let ( opt-file-name find-path-str init-cmd  line-txt)
    (setq opt-file-name (buffer-file-name)   )
    ;;(message "%s %s %s" "====" opt-file-name "kkk")
    (if (and  opt-file-name  (file-exists-p opt-file-name ) )
		(setq file-path-str (file-name-directory opt-file-name ) )
      (setq file-path-str "~/"))
    (if (string= major-mode  "term-mode")
		(evil-buffer nil )

	  (progn
		(if (=  (length multi-term-buffer-list) 0)
            (progn
              (setq init-cmd  "" )
              (multi-term-next 0 )
              )
          (progn
            ;;找到最近的term
            (multi-term-goto-last-term)
            (setq init-cmd  (concat "\C-c cd " file-path-str  "\r" ) )))

		(evil-local-mode 0 )
        (undo-tree-mode -1 )

        (when (not (string=  init-cmd "" ) )
          (setq line-txt (buffer-substring-no-properties
                          (line-beginning-position)
                          (line-end-position )))

          ;;进入当前文件所在文件夹
          (when (and  (not (string= file-path-str default-directory ))
                      (string-match "^localhost.*\\$[ \t]*$" line-txt ) ;;本地，处于命令行完成状态
                      )

            (term-send-raw-string init-cmd )) )

		))))


(provide 'init-term)
