;;; ### Unset key ###
;;; --- 卸载按键 109




(require 'evil)
(require 'evil-numbers)
(require 'evil-leader)

(global-evil-leader-mode)

;;normal-state
(evil-leader/set-key
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
  "y" '(lambda ()
         (interactive )
         (let ( line-msg  txt )
           (setq line-msg (buffer-substring-no-properties
                           (line-beginning-position)
                           (line-end-position )))
           

           
           (setq txt (format "%s:%d\n%s\n" (buffer-file-name) (line-number-at-pos ) line-msg  ) )
           (message "%s" txt)
           (kill-new txt  )
           ))

  "s" 'cscope-find-egrep-pattern
  "q" '(lambda ()
         (interactive )
         (multi-term-prev 0 )
         (evil-check-close-local-mode )
         )

  "a" 'switch-file-opt
  )

;; (switch-cc-to-h ))))
(defun switch-file-opt ()
  "DOCSTRING"
  (interactive)
  (let (  line-txt  opt-file  file-list obj-file check-file-name file-name file-name-fix )
    (save-excursion
      (goto-char (point-min))
      (when (search-forward "SWITCH-TO:" nil t  )
        (setq line-txt (buffer-substring-no-properties (line-beginning-position) (line-end-position)))
        (if (string-match   "SWITCH-TO:[ \t]*\\([^ \t]*\\)[ \t]*"   line-txt)
            (setq  opt-file (match-string  1 line-txt)))))

    (if (and opt-file   (file-directory-p  opt-file) )
        (progn ;;目录
          (setq file-name (file-name-nondirectory (buffer-file-name)))
          (setq file-name-fix (file-name-base  file-name))

          (setq file-list (directory-files opt-file))
          (while (and file-list (not obj-file) )
            (setq check-file-name (car file-list) )
            (setq file-list (cdr file-list) )

            (if (and
                 (string= (file-name-base check-file-name ) file-name-fix  ) ;;
                 (not (string= file-name check-file-name   ));;后缀不一样
                 )
                (setq obj-file  (concat opt-file "/" check-file-name) ))))
      (setq obj-file opt-file))
    
    (if obj-file
        (find-file obj-file)
      (switch-cc-to-h))))

(evil-leader/set-leader ",")

;;(evil-leader/set-key-for-mode 'emacs-lisp-mode "b" 'byte-compile-file)

;;显示信息
(evil-leader/set-key-for-mode 'php-mode "i"  'ac-php-show-tip)
(evil-leader/set-key-for-mode 'php-mode "f"  'ac-php-gen-def)

(evil-leader/set-key-for-mode 'emacs-lisp-mode "e"  'eval-last-sexp)

;;编译

(evil-leader/set-key-for-mode 'js2-mode "m"  'js2-mode-display-warnings-and-errors)
(evil-leader/set-key-for-mode 'go-mode "m"
  '(lambda()(interactive)
     (let ( cmd )
       (compile "go build")
       )))


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
       (setq cmd (concat "cd "
                         (file-name-directory (buffer-file-name)  )
                         "/build && make "
                         (file-name-nondirectory (buffer-file-name) )
                         ".o"))
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
  (when (string= major-mode  "term-mode")
    (evil-local-mode 0)
    (undo-tree-mode -1 )
    )
  )


;; 等号对齐
(define-key evil-visual-state-map (kbd "=")
  '(lambda( beg end  )
     (interactive "r")

     ;;"多行注释处理"
     (if (and mark-active
              (string-match "\n"
                            (buffer-substring-no-properties (region-beginning)(region-end))))
         (progn 
           (mark-region-ex)
           (setq beg (region-beginning) )
           (setq end (region-end) )
           ))
     (align beg end)
     )) 



(define-key evil-normal-state-map (kbd "g=") 'indent-buffer) 

(defun indent-buffer ()
  "DOCSTRING"
  (interactive)
  (let ( tab-count)
    (message "start")
    (save-excursion
      (goto-char (point-min))
      (while (re-search-forward  "^\t" nil t)
        ;;(message "1111")
        (setq tab-count 1)
        ;;(message "char ====%d" (following-char )  )
        (while (=  ?\t (following-char ) )
          (setq tab-count (1+ tab-count))
          (forward-char 1)
          )
        (delete-backward-char tab-count)
        ;;(message "tab %d" tab-count   )
        (while (> tab-count  0 )
          (insert  "    ")
          (setq tab-count (1- tab-count))
          )
        ))
    (indent-region (point-min ) (point-max ) )
    ))


(setq evil-default-cursor  '("white" box) )
(set-evil-all-state-key  (kbd "<tab>")  'yas-expand-for-vim )
(set-evil-all-state-key "\M-h"  'backward-kill-word-without-_)

(set-evil-all-state-key (kbd "C-c") 'copy-region-or-whole-line ) 
(set-evil-all-state-key (kbd "C-v") 'yank ) 

(set-evil-all-state-key ( kbd "C-}") 'find-tag-next-ex)
(set-evil-all-state-key "\C-x\C-o"  'other-window )

(set-evil-all-state-key  (kbd "C-r") 'redo)

(set-evil-normal-state-key "\C-^"  'do-switch-buffer)
(set-evil-normal-state-key "Y"  'copy-region-or-whole-line )
(set-evil-normal-state-key "D"  'kill-region-or-whole-line )

(define-key evil-visual-state-map (kbd ",d") 'show-dict )

(define-key evil-normal-state-map "gf" 'my-goto-file )


(defun my-goto-file ()
    "DOCSTRING"
  (interactive)
  (let (line-txt  line-info filename  line deal-flag)
    (setq line-txt (buffer-substring-no-properties
                    (line-beginning-position)
                    (line-end-position )))

    (setq line-info  (split-string  line-txt ":" ) )
    (when (=  (length  line-info ) 2)
      (setq filename  (nth 0 line-info) )
      (setq line (string-to-number  (nth 1 line-info)) )
      (when (file-exists-p  filename  )
        (find-file filename)
        (goto-char (point-min))
        (forward-line (1-  line ))
        (setq deal-flag t )))

    (unless deal-flag (find-file-at-point))))



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
                              (multi-term-goto-last-term )
                              ))

(evil-ex-define-cmd  "q"  '(lambda ()
                             (interactive )
                              (multi-term-goto-last-term )
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


;; emacs-lisp-mode
(defadvice find-function (before jim-find-funtion  activate compile)
  (interactive (find-function-read))
  (ring-insert find-tag-marker-ring (point-marker))
  )

(add-hook
 'emacs-lisp-mode-hook
 '(lambda()
    (interactive)
    ( define-key evil-normal-state-local-map  (kbd "C-]") 'find-function)
    ( define-key evil-insert-state-local-map  (kbd "C-]") 'find-function )
    ))
;; ================================

(defun set-rtags-bind-key ()
  "DOCSTRING"
  (when (or  (string= major-mode "c++-mode")  (string= major-mode "c-mode"))
    ( define-key evil-normal-state-local-map  (kbd "C-]") 'rtags-find-symbol-at-point)
    ( define-key evil-insert-state-local-map  (kbd "C-]") 'rtags-find-symbol-at-point)

    ( define-key evil-normal-state-local-map  (kbd "C-t") 'rtags-location-stack-back )
    ( define-key evil-insert-state-local-map  (kbd "C-t") 'rtags-location-stack-back )

    ( define-key evil-normal-state-local-map  (kbd "C-S-t") 'rtags-location-stack-forward)
    ( define-key evil-insert-state-local-map  (kbd "C-S-t") 'rtags-location-stack-forward)

    ( define-key evil-normal-state-local-map  (kbd ",s") 'rtags-find-all-references-at-point)
    ( define-key evil-normal-state-local-map  (kbd ",r") 'rtags-reparse-file)
    ( define-key evil-normal-state-local-map  (kbd ",h") 'rtags-display-summary)
    ))

;; C C++ tags 调整 
(add-hook 'c++-mode-hook 'set-rtags-bind-key)
(add-hook 'c-mode-hook 'set-rtags-bind-key)






(add-hook 'python-mode-hook
          '(lambda ()
             ( define-key evil-normal-state-local-map  (kbd "C-]") 'jedi:jump-to-definition)
             ( define-key evil-normal-state-local-map  (kbd "C-t") 'jedi:jump-back)
             ))
(add-hook 'go-mode-hook
          '(lambda ()
             ( define-key evil-normal-state-local-map  (kbd "C-]") 'godef-jump )
             ))

(defun my-web-mode-jump ( )
    "DOCSTRING"
  (interactive)
  (let (parent cur-point  start-1 end-1 start-2 end-2   jump-pos )
    (setq cur-point (point)  )
    (setq parent (web-mode-element-boundaries (point)))
    (when parent 
      (setq start-1  (car (car parent)  )) 
      (setq end-1  (cdr  ( car parent)  )) 
      (setq start-2  (car (cdr parent)  )) 
      (setq end-2  (cdr  ( cdr parent)  )) 

      (unless (= start-1 start-2)
        (if  (and (>=  cur-point   start-1 )
                  (<=  cur-point   end-1 ))
            (setq jump-pos  (+  start-2 2 ) )
          (setq jump-pos  (1+  start-1 )))

        (goto-char jump-pos)) 
      )))

(add-hook 'web-mode-hook
          '(lambda ()
             ( define-key evil-normal-state-local-map  (kbd "%") 'my-web-mode-jump )
             ( define-key evil-visual-state-local-map  (kbd "%") 'my-web-mode-jump )
             ))




(add-hook 'php-mode-hook
          '(lambda ()
             (flymake-stop-all-syntax-checks)
             (require 'ac-php)

             ( define-key evil-normal-state-local-map  (kbd "C-]") 'ac-php-find-symbol-at-point)
             ( define-key evil-normal-state-local-map  (kbd "C-t") 'ac-php-location-stack-back   )
             ( define-key evil-normal-state-local-map  (kbd ",r") 'ac-php-remake-tags )
             ( define-key evil-normal-state-local-map  (kbd ",s") 'ac-php-cscope-find-egrep-pattern )

             ))








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
    (define-key evil-normal-state-local-map  (kbd "n") '(lambda()(interactive)(evil-next-line) (cscope-show-entry-other-window)))
    (define-key evil-normal-state-local-map  (kbd "p") '(lambda()(interactive)(evil-previous-line) (cscope-show-entry-other-window)))
    ))

(add-hook
 'package-menu-mode-hook
 '(lambda()
    (interactive)
    ( define-key evil-normal-state-local-map (kbd "E") '(lambda()(interactive)
                                                          (package-menu-mark-upgrades)
                                                          (package-menu-execute )
                                                          ))
    ))


(add-hook
 'compilation-mode-hook
 '(lambda()
    (interactive)
    (define-key compilation-mode-map  (kbd  ",o")   'other-window)
    ))



(evil-mode 1)

(provide 'init-evil)
