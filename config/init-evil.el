;;; ### Unset key ###
;;; --- 卸载按键 109




(require 's)
(require 'evil)
(require 'evil-numbers)
(require 'evil-leader)
;; evil-surround
(require 'evil-surround)
(global-evil-surround-mode 1)
(setq-default evil-surround-pairs-alist '((?\( . ("(" . ")"))
                                          (?\[ . ("[" . "]"))
                                          (?\{ . ("{" . "}"))

                                          (?\) . ("( " . " )"))
                                          (?\] . ("[ " . " ]"))
                                          (?\} . ("{ " . " }"))
                                          (?>  . ("< " . " >"))

                                          (?# . ("#{" . "}"))
                                          (?p . ("(" . ")"))
                                          (?b . ("[" . "]"))
                                          (?B . ("{" . "}"))
                                          (?< . ("<" . ">"))
                                          (?t . evil-surround-read-tag)))

(defun cofi/surround-add-pair (trigger begin-or-fun &optional end)
  "Add a surround pair.
If `end' is nil `begin-or-fun' will be treated as a fun."
  (push (cons (if (stringp trigger)
                  (string-to-char trigger)
                trigger)
              (if end
                  (cons begin-or-fun end)
                begin-or-fun))
        evil-surround-pairs-alist))

(add-hook  'emacs-lisp-mode-hook (lambda ()
                                   (cofi/surround-add-pair "`" "`"  "'"))
           )
;; (add-to-hooks (lambda ()
;;                 (cofi/surround-add-pair "~" "``"  "``"))
;;               '(markdown-mode-hook rst-mode-hook python-mode-hook))
;; (add-hook 'LaTeX-mode-hook (lambda ()
;;                              (cofi/surround-add-pair "~" "\\texttt{" "}")
;;                              (cofi/surround-add-pair "=" "\\verb=" "=")
;;                              (cofi/surround-add-pair "/" "\\emph{" "}")
;;                              (cofi/surround-add-pair "*" "\\textbf{" "}")
;;                              (cofi/surround-add-pair "P" "\\(" "\\)")))
;; (add-to-hooks (lambda ()
;;                 (cofi/surround-add-pair "c" ":class:`" "`")
;;                 (cofi/surround-add-pair "f" ":func:`" "`")
;;                 (cofi/surround-add-pair "m" ":meth:`" "`")
;;                 (cofi/surround-add-pair "a" ":attr:`" "`")
;;                 (cofi/surround-add-pair "e" ":exc:`" "`"))
;;               '(rst-mode-hook python-mode-hook)))

;;;=====================
(global-evil-leader-mode)
;;normal-state
(evil-leader/set-key
  "k" 'kill-other-buffers
  "t" 'set-tags-config-for-cur-file
  "l" 'revert-buffer
  "f" 'gen-function-as-kill
  "u" 'upper-or-lower-whole-word
  "w" 'save-buffer
  "j" 'my-join-line
  "o" 'other-window
  "c" 'find-cmd-def
  "p" 'ac-php-reformat
  "d" 'show-dict
  "y" '(lambda ()
         (interactive )
         (let ( line-msg  txt file-name other-file-name )
           (setq line-msg (buffer-substring-no-properties
                           (line-beginning-position)
                           (line-end-position )))
           (setq file-name (buffer-file-name) )
           

           ;; /home/jim/telepresence-read-only/doubango-read-only/tinySIP/src/tsip_message.c:243
           ;; /home/jim/doubango-read-only/tinySIP/src/tsip_message.c:243
           ;; 	tsk_size_t index = 0;
           (cond
            ((s-match  "telepresence-read-only"    file-name   )
             (progn
               (setq other-file-name (s-replace "telepresence-read-only/" "" file-name ))
               (setq txt (format "%s:%d\n%s:%d\n%s\n"
                                 file-name  (line-number-at-pos )
                                 other-file-name  (line-number-at-pos )
                                 line-msg  ) )))
            ((s-match  "jim/doubango-read-only"   file-name   )
             (progn
               (setq other-file-name (s-replace "/jim/" "/jim/telepresence-read-only/"  file-name ))
               (setq txt (format "%s:%d\n%s:%d\n%s\n"
                                 file-name  (line-number-at-pos )
                                 other-file-name  (line-number-at-pos )
                                 line-msg  ) )))

             (t
              (setq txt (format "%s:%d\n%s\n" file-name  (line-number-at-pos ) line-msg  ) )))
           (message "%s" txt)
           (kill-new txt  )
           ))

  "q" '(lambda ()
         (interactive )
         (multi-term-prev 0 )
         ;;(evil-check-close-local-mode )
         )

  "a" 'switch-file-opt
  )

(defun my-join-line ()
    "DOCSTRING"
  (interactive)
  (let (var1 pos-start post-end buf)
    (setq pos-start (region-beginning)   )
    (setq pos-end   (region-end) )
    (setq buf (buffer-substring-no-properties  pos-start pos-end )  )
    (setq buf (s-replace  "\n" "" buf ) )
    (kill-new buf )
    ))

(defun ac-php-reformat-args ( args-str)
  (let ((args-arr (s-split "\\[" (s-replace "$..." "$__args__" args-str) )) match-arr )
    (setq args-str (car args-arr ) )
    (dolist (item (cdr args-arr) )
      (setq args-str (concat  args-str  (if (s-match "="  item  )
          item
        (setq match-arr (s-match "\\(.*\\)\\(\\$[a-zA-Z_0-9]+\\)\\(.*\\)"  item ) )
        (concat (nth 1  match-arr)  (nth 2  match-arr) "=NULL " (nth 3 match-arr) )
          )))
      
        )
    
    (if (string= (s-trim args-str ) "void" )
        ""
      (s-replace-all '(("["."" )  ("]"."" )) args-str  ))) 
  )

(defun ac-php-reformat ()
  "DOCSTRING"
  (interactive)
  (let (line-txt (txt nil) m-data )
    (setq line-txt (buffer-substring-no-properties
                    (line-beginning-position)
                    (line-end-position )))
    (cond
     ((not (s-matches-p ".*(.*).*" line-txt) )
      ;;const integer CALL_TOSTRING = 1 ;
      (setq m-data (s-match "^[\t ]*\\(\\w+\\)[ \t]+\\(\\w+\\)[ \t]+\\(.*\\)$" line-txt) )
      (when m-data 
        (setq txt (format"\t/** @var %s */\n\t %s  %s"
                         (nth 2 m-data ) (nth 1 m-data) (nth 3 m-data)) )))

     (t
      (let ( function-items function-args return-type  (items-str "" ) (end-str "{}") function-name)

        (setq m-data (s-match "^\\([^(]*\\)(\\(.*\\))[ \t]*$" line-txt) )
        (setq function-items (s-split " " (s-trim  (nth 1 m-data))))
        (setq function-args (ac-php-reformat-args (nth 2 m-data)))
        
        
        (dolist (item function-items )
          (if (or (string= item  "public")
                  (string= item  "static")
                  (string= item  "protected")
                  (string= item  "readonly")
                  (string= item  "private")
                  (string= item  "final")
                  (string= item  "abstract"))
              
              (progn 
                (when (string= item  "abstract" ) (setq end-str ";"))
                (when (not (string= item "readonly"  ) )
                  (setq items-str  (concat items-str  item  " " )))
                )

            (if return-type
                (setq function-name item )
              (progn 
                (if (string= "__construct" item)
                    (progn
                      (setq function-name item )
                      (setq return-type "void")
                      )
                  (setq return-type item)
                  )
                )
              ))
          )
        (setq txt (format "\t/** @return %s */\n\t%s function %s(%s)%s " return-type items-str function-name function-args end-str ))
        )


      )) 

    (when txt 
      (beginning-of-line)
      (kill-line)
      (insert txt )
      (next-line))

    ))

(defun js-get-file-at-point ()
  (interactive)
  (let( cur-path  pos-info)
        (save-excursion
          (let (file-name-begin file-name-end file-name  )

            (skip-chars-backward "a-zA-Z0-9._/"   ) 
            (setq file-name-begin (point))

            (skip-chars-forward "a-zA-Z0-9._/"   ) 

            (setq file-name-end (point))
            (setq cur-path (buffer-substring-no-properties file-name-begin file-name-end )) 
            (setq file-name ( concat  (nth 1  (s-split "/" cur-path  )) ".php" ) )
            (setq pos-info ( concat "/function.*" (nth 2  (s-split "/" cur-path  )) ) )
            (setq cur-path (concat (nth 0  (s-split "/public/" (buffer-file-name)) ) "/app/Http/Controllers/" file-name ))
            (message "xxx %s" cur-path)
            ))
        (list cur-path pos-info)
    ))
(defun web-get-file-at-point ()
  (interactive)
  (let( cur-path  pos-info)
        (save-excursion
          (let (file-name-begin file-name-end file-name  )

            (skip-chars-backward "a-zA-Z0-9._/"   ) 
            (setq file-name-begin (point))

            (skip-chars-forward "a-zA-Z0-9._/"   ) 


            (setq file-name-end (point))
            (setq cur-path (buffer-substring-no-properties file-name-begin file-name-end )) 

            (if (s-match "\.js"  cur-path )
                (setq cur-path (concat (nth 0  (s-split "/template/" (buffer-file-name)) ) "/webroot/" cur-path ))
              (progn 
                (setq file-name ( concat  (nth 1  (s-split "/" cur-path  )) ".class.php" ) )
                (setq pos-info ( concat "/function.*" (nth 2  (s-split "/" cur-path  )) ) )
                (setq cur-path (concat (nth 0  (s-split "/template/" (buffer-file-name)) ) "/handler/" file-name )))
            )
            ))
        (list cur-path pos-info)
    ))

(defun php-get-html-in-handle ()
    "DOCSTRING"
  (interactive)
  (let (line-txt opt-file opt-dir )
    (save-excursion
      (goto-char (point-min))

      (when (search-forward "APP_PATH" nil t  )
        (setq line-txt (buffer-substring-no-properties (line-beginning-position) (line-end-position)))
        (if (string-match   "APP_PATH[ \t]*\\.[ \t]*'\\(.*\\)'[ \t]*;"   line-txt)
            (setq opt-dir  (concat "../" (match-string  1 line-txt)  ) )
          )
        ))


    (if opt-dir 
        (save-excursion
          (let (file-name-begin file-name-end )

            (skip-chars-backward "a-zA-Z0-9._/"   ) 
            (setq file-name-begin (point))

            (skip-chars-forward "a-zA-Z0-9._/"   ) 

            (setq file-name-end (point))

            (setq opt-file (concat opt-dir "/"  (buffer-substring-no-properties file-name-begin file-name-end )) )

            )))

    (list opt-file  nil )
    ))
;; (switch-cc-to-h ))))
(defun switch-file-opt ()
  "DOCSTRING"
  (interactive)
  (let (  line-txt  opt-file  file-list obj-file check-file-name file-name file-name-fix  (use-default t) pos-info )
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
   ;;check for   php html js
    (unless obj-file
      (let ((path-name (buffer-file-name)) ctrl-name action-name tmp-arr )
        (cond
         ((string= major-mode  "php-mode")

          (progn
            (setq ctrl-name (f-base  (f-base path-name )) )
            (save-excursion
              (let (line-txt  ) 
                (beginning-of-defun)
                (setq line-txt (buffer-substring-no-properties (line-beginning-position) (line-end-position)))
                (setq tmp-arr (s-match  ".*function[ \t]+\\([a-zA-Z0-9_]*\\)"  line-txt ) )
                (when tmp-arr
                  (setq action-name (nth 1 tmp-arr) )
                  )))
            (when (and (s-match "/Controllers/" path-name )  (not (string= action-name "__construct")) )
              (setq  obj-file  (concat "../../../resources/views/" ctrl-name  "/" action-name ".blade.php" ) )
              )
            ))

         ((string= major-mode  "web-mode" )
          (setq tmp-arr (s-match  "/\\([a-zA-Z0-9_-]*\\)/\\([a-zA-Z0-9_-]*\\).blade.php"  path-name ) )
          (when tmp-arr
            (setq  ctrl-name   (nth 1 tmp-arr) )
            (setq  action-name   (nth 2 tmp-arr) ))

          (when (s-match "/views/" path-name )  
            (setq  obj-file  (concat"../../../public/page_ts/" ctrl-name  "/" action-name ".ts" ) )
            
            )
          (let (js-obj-file)
          (when ( and (not (f-exists? obj-file )) (s-match "/views/" path-name )   )
            (setq  js-obj-file  (concat"../../../public/page_js/" ctrl-name  "/" action-name ".js" ) )
            (when (  f-exists? js-obj-file ) (setq obj-file js-obj-file)  )
            ))
          )
         ((string= major-mode  "jade-mode" )
          (setq tmp-arr (s-match  "/\\([a-zA-Z0-9_-]*\\)/\\([a-zA-Z0-9_-]*\\).jade"  path-name ) )
          (when tmp-arr
            (setq  ctrl-name   (nth 1 tmp-arr) )
            (setq  action-name   (nth 2 tmp-arr) ))

          (when (s-match "/views/" path-name )  
            (setq  obj-file  (concat"../../web_public/page_ts/" ctrl-name  "/" action-name ".ts" ) )
            
            )
          )


         ((string= major-mode  "js2-mode" )
          (setq tmp-arr (s-match  "page_js/\\([a-zA-Z0-9_-]*\\)/\\([a-zA-Z0-9_-]*\\).js"  path-name ) )
          (when tmp-arr
            (setq  ctrl-name   (nth 1 tmp-arr) )
            (setq  action-name   (nth 2 tmp-arr) ))
          (when (s-match "/public/page_js/" path-name )  
            (setq  obj-file  (concat"../../../app/Http/Controllers/" ctrl-name  ".php" ) )
            (setq pos-info ( concat "/function[ \t]+" action-name "[ \t]*("  ) )

            ))
         ((string= major-mode  "typescript-mode" )
          (setq tmp-arr (s-match  "/public/page_ts/\\([a-zA-Z0-9_-]*\\)/\\([a-zA-Z0-9_-]*\\).ts"  path-name ) )
          ;; php ts
          (when tmp-arr
            (setq  ctrl-name   (nth 1 tmp-arr) )
            (setq  action-name   (nth 2 tmp-arr) )
            (when (s-match "/public/page_ts/" path-name )  
              (setq  obj-file  (concat"../../../app/Http/Controllers/" ctrl-name  ".php" ) )
              (setq pos-info ( concat "/function[ \t]+" action-name "[ \t]*("  ) )

              ))

          ;; nodejs javascript ts
          (message "  nodejs javascript ts: %s" path-name)
          (setq tmp-arr (s-match  "/web_public/page_ts/\\([a-zA-Z0-9_-]*\\)/\\([a-zA-Z0-9_-]*\\).ts"  path-name ) )
          (when tmp-arr

            (message " check OK " )
            (setq  ctrl-name   (nth 1 tmp-arr) )
            (setq  action-name   (nth 2 tmp-arr) )
            (setq  obj-file  (concat "../../../routes/" ctrl-name  ".ts" ) )
            (setq pos-info ( concat "/public[ \t]+" action-name "[ \t]*("  ) )

            ) 
          ;; nodejs  ts

          (when (s-match "/routes/" path-name )  
            (progn
              (setq ctrl-name (f-base  (f-base path-name )) )
              (save-excursion
                (let (line-txt  ) 
                  (re-search-backward "[ \t]*public[ \t]+"  0 t 1 )
                  (setq line-txt (buffer-substring-no-properties (line-beginning-position) (line-end-position)))
                  (setq tmp-arr (s-match  ".*public[ \t]+\\([a-zA-Z0-9_]*\\)"  line-txt ) )
                  (when tmp-arr
                    (setq action-name (nth 1 tmp-arr) )
                    )))
              (when (and   (not (string= action-name "constructor")) )
                (setq  obj-file  (concat "../views/" ctrl-name  "/" action-name ".jade" ) )
                )
              ))

         
          ))))

      (when obj-file
        (unless (f-exists? obj-file)
          (message "no find %s" obj-file )
          (setq use-default  nil)
          (setq obj-file nil)
          )
        )
    
      (if obj-file
          (let(line-txt (move-flag t ))
            (find-file obj-file)
            (when pos-info  
              (when (string=(substring-no-properties pos-info 0 1 )  "/")


                (when (> (line-number-at-pos )  2)   
                  (save-excursion
                    (if (string= major-mode "typescript-mode" )
                        (re-search-backward "[ \t]*public[ \t]+" 0 t 1 )
                      ( evil-backward-section-begin)
                      )
                    (setq line-txt (buffer-substring-no-properties
                                    (line-beginning-position)
                                    (line-end-position )))
                    (message "line-txt:%s" line-txt)
                    (when (s-matches-p (substring-no-properties pos-info 1 ) line-txt  ) ;;同一个区域
                      (setq move-flag nil ))
                    ))
                (when move-flag
                  (goto-char (point-min))
                  (re-search-forward  (substring-no-properties pos-info 1 ) )
                  (next-line))
                )
              ))

        (when use-default (switch-cc-to-h))
      )))

(evil-leader/set-leader ",")

;;(evil-leader/set-key-for-mode 'emacs-lisp-mode "b" 'byte-compile-file)


(defun php-gen-proto ()
    "DOCSTRING"
  (interactive)
  (let (var1)
    (kill-new (concat "http://api.weiyi.com/" (f-base   (f-base (buffer-file-name) ) ) "/"  (current-word)  ) )
    
    )) 
;;显示信息
(evil-leader/set-key-for-mode 'php-mode "i"  'ac-php-show-tip)
(evil-leader/set-key-for-mode 'php-mode "f"  'ac-php-gen-def)




(evil-leader/set-key-for-mode 'emacs-lisp-mode "e"  'eval-last-sexp)
(evil-leader/set-key-for-mode 'lisp-mode "e"  'eval-last-sexp)
(evil-leader/set-key-for-mode 'typescript-mode "e"  'flycheck-next-error)

;;org
(evil-leader/set-key-for-mode 'org-mode "t"  'org-todo)

;;编译

(evil-leader/set-key-for-mode 'js2-mode "m"  'js2-mode-display-warnings-and-errors)
(defun ts2js ()
  "DOCSTRING"
  (interactive)
  (let ( obj-file  (obj-data ""))
    (when ( and (string= major-mode "typescript-mode" )
                (s-matches-p "/page_ts/" (buffer-file-name))
                (not (s-matches-p "\\.d\\.ts$" (buffer-file-name) ))
                             ) 
      (setq obj-file  (s-replace ".ts" ".js" (s-replace "page_ts" "page_js" (buffer-file-name) ) ) )
      (when (not (f-exists?  (f-dirname obj-file) ) )
        (f-mkdir (f-dirname obj-file) )
        )

      (when (f-exists? obj-file  )
        (setq obj-data ( f-read obj-file ) ))

      (if (or (not (f-exists? obj-file  )) (s-matches-p "reference path" obj-data)
              (string= (s-trim  obj-data ) "" )
              )

          (progn 
            (when (f-exists? obj-file  )
              (f-delete obj-file  ))

            (if (s-matches-p "//TS_FLAG:true" (buffer-string) )
                (compile (concat "tsc  --out  " obj-file " "  (buffer-file-name) ) ) 
              (f-copy (buffer-file-name) obj-file  ))
            (message "%s:生成完毕" obj-file  ))
        (message "%s :不是 typescript 生成的文件, 请备份为其它文件." obj-file  ))
      ))
  )
(evil-leader/set-key-for-mode 'typescript-mode "m" 'ts2js)


(evil-leader/set-key-for-mode 'json-mode  "m"  'json-mode-beautify)
(evil-leader/set-key-for-mode 'emacs-lisp-mode  "m"  'byte-compile-file )
(evil-leader/set-key-for-mode 'erlang-mode  "m"  'edts-code-compile-and-display)
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

(set-evil-normal-state-key "\C-^"  'ido-switch-buffer )
(set-evil-normal-state-key "Y"  'copy-region-or-whole-line )
(set-evil-normal-state-key "D"  'kill-region-or-whole-line )

(define-key evil-visual-state-map (kbd ",d") 'show-dict )

(define-key evil-normal-state-map "gf" 'my-goto-file )


(defun my-goto-file ()
    "DOCSTRING"
  (interactive)
  (let (line-txt  line-info filename  line deal-flag file-info)
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

     ;;$this->tpl->display('audition.html')
     (when (string= "php-mode" major-mode)
       (setq file-info (php-get-html-in-handle) ))
     (when (string= "js2-mode" major-mode)
       (setq file-info (js-get-file-at-point) ))

     (when (string= "typescript-mode" major-mode)
       (setq file-info (js-get-file-at-point) ))



     (when (string= "web-mode" major-mode)
       (setq file-info (web-get-file-at-point) ))

    (when  ( and (nth 0 file-info) (file-exists-p  (nth 0 file-info)  ) )
      (find-file  (nth 0 file-info)  )
      ;;pos info
      (let ((pos-info (nth 1 file-info)) )
        (when pos-info  
          (when (string=(substring-no-properties pos-info 0 1 )  "/")
            (goto-char (point-min))
            (re-search-forward  (substring-no-properties pos-info 1 ) )
            )
        ))
      (setq deal-flag t ))

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
  ;;(ring-insert find-tag-marker-ring (point-marker))
  )


(add-hook
 'emacs-lisp-mode-hook
 '(lambda()
    (interactive)
    ( define-key evil-normal-state-local-map  (kbd "C-]") 'find-function)
    ( define-key evil-insert-state-local-map  (kbd "C-]") 'find-function )
    ))

;; erlang-mode
(defadvice edts-find-source-under-point (before  jim-edts-find-source-under-point activate compile)
  (interactive)
  (ring-insert find-tag-marker-ring (point-marker))
  )


(add-hook
 'erlang-mode-hook
 '(lambda()
    (interactive)
    ( define-key evil-normal-state-local-map  (kbd "C-]") 'edts-find-source-under-point)
    ( define-key evil-insert-state-local-map  (kbd "C-]") 'edts-find-source-under-point )
    ))


;; ================================

(defun set-rtags-bind-key ()
  "DOCSTRING"
  (when (or  (string= major-mode "c++-mode")  (string= major-mode "c-mode"))
    (let (mode-map)
      (setq mode-map (if (string= major-mode "c++-mode") c++-mode-map  c-mode-map )  )
      (set-evil-normal-or-insert-state-key-on-mode mode-map  (kbd "C-]") 'rtags-find-symbol-at-point)
      (set-evil-normal-or-insert-state-key-on-mode mode-map  (kbd "C-t") 'rtags-location-stack-back )
      (set-evil-normal-or-insert-state-key-on-mode mode-map  (kbd "C-S-t") 'rtags-location-stack-forward)
      (set-evil-normal-state-key-on-mode mode-map  (kbd ",s") 'rtags-find-all-references-at-point)
      (set-evil-normal-state-key-on-mode mode-map  (kbd ",r") 'rtags-reparse-file)
      ))) 
;; C C++ tags 调整 
(add-hook 'c++-mode-hook 'set-rtags-bind-key)
(add-hook 'c-mode-hook 'set-rtags-bind-key)






(add-hook 'python-mode-hook
          '(lambda ()
             ( define-key evil-normal-state-local-map  (kbd "C-]") 'elpy-goto-definition)
             ))
(add-hook 'go-mode-hook
          '(lambda ()
             ( define-key evil-normal-state-local-map  (kbd "C-]") 'godef-jump )
             ))
(add-hook 'typescript-mode-hook
          '(lambda ()
             ( define-key evil-normal-state-local-map  (kbd "C-]") 'tide-jump-to-definition )
             ( define-key evil-normal-state-local-map  (kbd "C-t") 'tide-jump-back )
             ))

(add-hook 'java-mode-hook
          '(lambda ()
             ( define-key evil-normal-state-local-map  (kbd "C-]") 'eclim-java-find-declaration )

             (set-evil-normal-state-key-on-mode  java-mode-map (kbd ",s")  'eclim-java-find-references  )
             ))

;; js2-mode 
;; (defadvice  tern-find-definition(before jim-tern-find-definition activate compile)
;;   (interactive)
;;   (ring-insert find-tag-marker-ring (point-marker))
;;   )

(add-hook 'js2-mode-hook
          '(lambda ()
             ;;( define-key evil-normal-state-local-map  (kbd "C-]") 'tern-find-definition )
             ( define-key evil-normal-state-local-map  (kbd "C-]") 'tide-jump-to-definition )
             ( define-key evil-normal-state-local-map  (kbd "C-t") 'tide-jump-back )
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
             ;;(require 'ac-php-company)
             ;;(company-mode t)
             ;;(add-to-list 'company-backends 'company-ac-php-backend )
             ;;(setq ac-php-cscope nil)
             (set-evil-normal-or-insert-state-key-on-mode  php-mode-map  (kbd "C-]") 'ac-php-find-symbol-at-point)
             (set-evil-normal-or-insert-state-key-on-mode  php-mode-map  (kbd "C-t") 'ac-php-location-stack-back   )
             (set-evil-normal-or-insert-state-key-on-mode  php-mode-map  (kbd "C-}") 'ac-php-location-stack-forward  )
             (set-evil-normal-state-key-on-mode  php-mode-map  (kbd ",r") 'ac-php-remake-tags )
             (set-evil-normal-state-key-on-mode  php-mode-map  (kbd ",R") 'ac-php-remake-tags-with-lib )
             (set-evil-normal-state-key-on-mode  php-mode-map  (kbd ",s") 'ac-php-cscope-find-egrep-pattern )
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

;;切换buffer 时，调整 term-mode no in evil  
(add-hook 'buffer-list-update-hook '(lambda()
                                        (evil-check-close-local-mode )
                                      ))



(evil-mode 1)

(provide 'init-evil)
