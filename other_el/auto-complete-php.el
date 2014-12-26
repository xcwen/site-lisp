;;; auto-complete-php.el --- Auto Completion source for php for GNU Emacs

;; Copyright (C) 2014  jim 

;; Author: xcwenn@qq.com 
;; Keywords: completion, convenience
;; Version: 20140409.352
;; X-Original-Version: 0.1i
;; Package-Requires: ((auto-complete "1.3.1"))

;; This program is free software; you can redistribute it and/or modify
;; it under the terms of the GNU General Public License as published by
;; the Free Software Foundation, either version 3 of the License, or
;; (at your option) any later version.

;; This program is distributed in the hope that it will be useful,
;; but WITHOUT ANY WARRANTY; without even the implied warranty of
;; MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
;; GNU General Public License for more details.

;; You should have received a copy of the GNU General Public License
;; along with this program.  If not, see <http://www.gnu.org/licenses/>.

;; 参考 auto-complete-clang (补全), rtags (跳转堆栈 ac-php-location-stack-index )

;;; Commentary:
;;
;; Auto Completion source for php. Most of codes are taken from

;;; Code:


(provide 'auto-complete-php)

;;load sys-data
(require 'auto-complete-php-sys-data)

(require 'auto-complete)
(require 'popup)
(require 'json)



(defvar ac-php-location-stack-index 0)
(defvar ac-php-location-stack nil)

(defvar ac-php-max-bookmark-count 500 )
(defun ac-php-location-stack-push ()
  (let ((bm (ac-php-current-location)))
    (while (> ac-php-location-stack-index 0)
      (decf ac-php-location-stack-index)
      (pop ac-php-location-stack))
    (unless (string= bm (nth 0 ac-php-location-stack))
      (push bm ac-php-location-stack)
      (if (> (length ac-php-location-stack) ac-php-max-bookmark-count)
          (nbutlast ac-php-location-stack (- (length ac-php-location-stack) ac-php-max-bookmark-count))))))


(defun ac-php-goto-line-col (line column)
  (goto-char (point-min))
  (forward-line (1- line))
  (beginning-of-line)
  (forward-char (1- column)))

(defun ac-php-current-location (&optional offset)
  (format "%s:%d:%d" (or (buffer-file-name) (buffer-name))
          (line-number-at-pos offset) (1+ (- (or offset (point)) (point-at-bol)))))

(defun ac-php-find-file-or-buffer (file-or-buffer &optional other-window)
  (if (file-exists-p file-or-buffer)
      (if other-window
          (find-file-other-window file-or-buffer)
        (find-file file-or-buffer))
    (let ((buf (get-buffer file-or-buffer)))
      (cond ((not buf) (message "No buffer named %s" file-or-buffer))
            (other-window (switch-to-buffer-other-window file-or-buffer))
            (t (switch-to-buffer file-or-buffer))))))


(defun ac-php-goto-location (location &optional other-window )
  "Go to a location passed in. It can be either: file,12 or file:13:14 or plain file"
  ;; (message (format "ac-php-goto-location \"%s\"" location))
  (when (> (length location) 0)
    (cond ((string-match "\\(.*\\):\\([0-9]+\\):\\([0-9]+\\)" location)
           (let ((line (string-to-number (match-string-no-properties 2 location)))
                 (column (string-to-number (match-string-no-properties 3 location))))
             (ac-php-find-file-or-buffer (match-string-no-properties 1 location) other-window)
             ;;(run-hooks ac-php-after-find-file-hook)
             (ac-php-goto-line-col line column)
             t))
          ((string-match "\\(.*\\):\\([0-9]+\\)" location)
           (let ((line (string-to-number (match-string-no-properties 2 location))))
             (ac-php-find-file-or-buffer (match-string-no-properties 1 location) other-window)
             ;;(run-hooks ac-php-after-find-file-hook)
             (goto-char (point-min))
             (forward-line (1- line))
             t))
          ((string-match "\\(.*\\),\\([0-9]+\\)" location)
           (let ((offset (string-to-number (match-string-no-properties 2 location))))
             (ac-php-find-file-or-buffer (match-string-no-properties 1 location) other-window)
             ;;(run-hooks ac-php-after-find-file-hook)
			 (goto-char (1+ pos))
             t))
          (t
           (if (string-match "^ +\\(.*\\)$" location)
               (setq location (match-string-no-properties 1 location)))
           (ac-php-find-file-or-buffer location other-window)))
	(ac-php-location-stack-push)
   ))





(defsubst ac-php-clean-document (s)
  (when s
    (setq s (replace-regexp-in-string "<#\\|#>\\|\\[#" "" s))
    (setq s (replace-regexp-in-string "#\\]" " " s)))
  s)

(defun ac-php-document (item)
  (if (stringp item)
      (let (s)
        (setq s (get-text-property 0 'ac-php-help item))
        (ac-php-clean-document s)))
   ;;(popup-item-property item 'ac-php-help)
  )


(defface ac-php-candidate-face
  '((t (:background "lightgray" :foreground "navy")))
  "Face for php candidate"
  :group 'auto-complete)

(defface ac-php-selection-face
  '((t (:background "navy" :foreground "white")))
  "Face for the php selected candidate."
  :group 'auto-complete)

(defun ac-php-get-cur-class-name ()
  "DOCSTRING"
  (let (line-txt cur-class-name )  
    (save-excursion
      (when (re-search-backward "^[ \t]*\\(abstract[ \t]+\\)*class[ \t]+" 0 t 1)
        (setq line-txt (buffer-substring-no-properties (line-beginning-position) (line-end-position)))
        (if (string-match   "class[ \t]+\\(\\w+\\)"   line-txt)
            (setq  cur-class-name  (match-string  1 line-txt)))))
    cur-class-name ))
(defun ac-php-get-class-at-point( )
  (let (line-txt    key-list   tmp-key-list frist-class-name  frist-key  ret-str )
  (setq line-txt (buffer-substring-no-properties
		    (line-beginning-position)
		    (point )))
  
  (setq line-txt (replace-regexp-in-string "\\<return\\>" "" line-txt  ))
  (setq line-txt (replace-regexp-in-string ".*[=(,]" "" line-txt  ))
  (setq line-txt (replace-regexp-in-string "[\t \\$]" "" line-txt  ))
  ;;检查 :: 
  (if (string-match  "::"  line-txt )
      (progn 
        (setq key-list (split-string line-txt "::" ))
        (setq frist-key (nth 0 key-list))
        (setq frist-class-name  frist-key  )
        (when (string= frist-key "parent" ) 
          (setq frist-class-name (concat (ac-php-get-cur-class-name) ".__parent__" ) )))

    (progn
      (setq key-list (split-string line-txt "->" ))
      (setq frist-key (nth 0 key-list))

      (save-excursion
        (re-search-backward (concat  frist-key"::" ) 0 t 1) 
        (setq key-line-txt (buffer-substring-no-properties
                            (line-beginning-position)
                            (line-end-position )))
        (if (string-match ( concat  frist-key "::\\(\\w+\\)" ) key-line-txt)
            (setq  frist-class-name  (match-string  1 key-line-txt))))

      (when (and(not frist-class-name) (or (string= frist-key "this")  ) ) 
        (setq frist-class-name (ac-php-get-cur-class-name)  ))
      ))

  
  (if frist-class-name 
	  (progn
		(setq ret-str  (concat frist-class-name ))
		(dolist (field-value (cdr key-list) )
		  (setq ret-str  (concat  ret-str "." field-value )))
		ret-str
		)
	;;(message "no find class from %s" frist-key )
	nil)))

(defun ac-php-candidate-class ( key-str-list  )
  ;;得到变量
  (let ( ret-list key-word output-vec cmd  )
  (if key-str-list
	  (progn
		(setq output-vec  (ac-php-exec-complete-cmd-to-string "--list-class-member" key-str-list    ))
		(mapcar (lambda (x)
				  (setq key-word (elt x 1))
				  (setq key-word (propertize key-word 'ac-php-help  (elt   x 2) ))
				  (push key-word ret-list  )
				  nil
				  ) output-vec )
  ret-list))
	  ))

(defun ac-php-get-complete-cmd ()
  "DOCSTRING"
  (let (tag-dir)
	(setq  tag-dir (ac-php-get-tags-dir)  )

	(if tag-dir
		(concat  tag-dir ".tags/get_php_tags.py")
	  nil)))

(defun ac-php-candidate-other ()
  
  (let (ret-list (ac-prefix-len (length ac-prefix)) cmp-value )
  ;;系统函数
  (dolist  (key-word ac-php-sys-function-list)
	
	(when (>= (length key-word) ac-prefix-len)
	  (setq cmp-value   (substring-no-properties  key-word 0 ac-prefix-len ) )
	  (if (string<   ac-prefix  cmp-value) (return ))
	  (if (string= cmp-value  ac-prefix ) (push key-word ret-list  ))
	  ))
  ;;用户函数
  (let ((key-word) cmd  output-list (complete-cmd  (ac-php-get-complete-cmd)) )
	(when  complete-cmd  
	  (setq output-vec  (ac-php-exec-complete-cmd-to-string "--list-function" ac-prefix))
	  (mapcar (lambda (x)
				(setq key-word (elt x 1))
				(setq key-word (propertize key-word 'ac-php-help  (elt   x 2) ))
				(push key-word ret-list  )
				nil
				) output-vec )))
  ret-list
  ))

(defun ac-php-get-tags-dir  ()
  "DOCSTRING"
  (let (tags-dir tags-file) 
    (setq tags-dir (file-name-directory (buffer-file-name)  ))
    (while (not (or (file-exists-p  (concat tags-dir  ".tags" )) (string= tags-dir "/") ))
	  (setq tags-dir  ( file-name-directory (directory-file-name  tags-dir ) ) ))
	(if (string= tags-dir "/") (setq tags-dir nil )   )
	tags-dir
	)
  )

(defun ac-php-remake-tags ()
  "DOCSTRING"
  (interactive)
  (let ((tags-dir (ac-php-get-tags-dir) ) ) 
	(message "remake %s" tags-dir )
	(if tags-dir 
		(message (shell-command-to-string  (concat tags-dir "/.tags/metags") )))))

(defun  ac-php-exec-complete-cmd-to-string( &rest args )
  "DOCSTRING"
  (let ((cmd (ac-php-get-complete-cmd)  ) ret_vec err-flag  )
	;;加入参数
	(while args 
	  (setq  cmd (concat cmd  " " (car  args)  ))
	  (setq args  (cdr  args)))

	(message "CMD:%s" cmd )
	(setq ret_vec (json-read-from-string (shell-command-to-string  cmd )))
	(if (= (length ret_vec) 2)
		(setq err-flag  	(elt ret_vec 0)))
	(if (and (stringp err-flag)  (string= err-flag "__PHP_COMPLETE_ERROR__") )
		(progn
		  (message "ERROR: %s" (elt ret_vec 1)  )
		  [] 
		  )
	  ret_vec))) 

(defun ac-php-find-symbol-at-point (&optional prefix)
  (interactive "P")
  ;;检查是类还是 符号 
  (let ( key-str-list  line-txt cur-word val-name class-name output-vec    jump-pos  cmd complete-cmd  find-flag)
	  (setq line-txt (buffer-substring-no-properties
					  (line-beginning-position)
					  (line-end-position )))
	  (setq cur-word  (current-word))
      (setq key-str-list (ac-php-get-class-at-point ))
	  (if  key-str-list  
		  (progn
            (setq key-str-list (replace-regexp-in-string "\\.[^.]*$" (concat "." cur-word ) key-str-list ))
            (setq output-vec  (ac-php-exec-complete-cmd-to-string "--find-class-member" key-str-list    ))

			(when (> (length  output-vec) 0)
			  (setq jump-pos  (concat (ac-php-get-tags-dir)  (elt (elt  output-vec 0)  3 )))
			  (ac-php-location-stack-push)
			  (ac-php-goto-location jump-pos )
			  ) 
			)
		(progn ;;function
		  (setq complete-cmd (ac-php-get-complete-cmd)  )
		  (if complete-cmd
			  (progn
				(setq output-vec  (ac-php-exec-complete-cmd-to-string "--find-function" cur-word   ))
				(if (> (length  output-vec) 0)
					(progn 
					  (setq jump-pos  (concat (ac-php-get-tags-dir)  (elt (elt  output-vec 0)  3 )))
					  (ac-php-location-stack-push)
					  (ac-php-goto-location jump-pos )
					  (setq find-flag t)
					  ))))
		  (if (not find-flag )

			(progn
			  
			  (dolist (function-str ac-php-sys-function-list )
				(when (string= function-str cur-word)

				  (php-search-documentation cur-word  )
				  (return )))

			  ))))
		))

(defun ac-php-gen-def ()
  "DOCSTRING"
  (interactive)
  (let (line-txt (cur-word  (current-word) ) )
	(setq line-txt (buffer-substring-no-properties
					(line-beginning-position)
					(line-end-position )))
	  (if  (string-match ( concat  "$" cur-word ) line-txt)
		  (kill-new (concat "\t/*$" cur-word "::`<...>` */\n") )
		(kill-new (concat "\tpublic /*::"cur-word" */ $" cur-word ";\n") )
		  )
	))
(defun ac-php-location-stack-forward ()
  (interactive)
  (ac-php-location-stack-jump -1))

(defun ac-php-location-stack-back ()
  (interactive)
  (ac-php-location-stack-jump 1))



(defun ac-php-location-stack-jump (by)
  (interactive)
  (let ((instack (nth ac-php-location-stack-index ac-php-location-stack))
        (cur (ac-php-current-location)))
    (if (not (string= instack cur))
        (ac-php-goto-location instack )
      (let ((target (+ ac-php-location-stack-index by)))
        (when (and (>= target 0) (< target (length ac-php-location-stack)))
          (setq ac-php-location-stack-index target)
          (ac-php-goto-location (nth ac-php-location-stack-index ac-php-location-stack) ))))))



(defun ac-php-candidate ()
  (let ( key-str-list )
    (setq key-str-list (ac-php-get-class-at-point))
    (if key-str-list
        (ac-php-candidate-class key-str-list  )
      (ac-php-candidate-other))
    ))
(defun ac-php-show-tip	(&optional prefix)
  (interactive "P")
  ;;检查是类还是 符号 
  (let ( key-str-list  line-txt cur-word val-name class-name output-vec    class-name doc  cmd complete-cmd  find-flag)
	  (setq line-txt (buffer-substring-no-properties
					  (line-beginning-position)
					  (line-end-position )))
	  (setq cur-word  (current-word))

      (setq key-str-list (ac-php-get-class-at-point ))
	  (if  key-str-list  
		  (progn

            (setq key-str-list (replace-regexp-in-string "\\.[^.]*$" (concat "." cur-word ) key-str-list ))
            (setq output-vec  (ac-php-exec-complete-cmd-to-string "--find-class-member" key-str-list   ))

			(when (> (length  output-vec) 0)
			  (setq  doc   (elt (elt  output-vec 0)  2 ))
			  (setq  class-name   (elt (elt  output-vec 0)  6 ))
			  (popup-tip (concat "[user]:" class-name  "::"  (ac-php-clean-document doc)    ))

			  ) 
			)
		(progn ;;function
		  (setq complete-cmd  (ac-php-get-complete-cmd ) )
		  (if complete-cmd
			  (progn 
				(setq output-vec  (ac-php-exec-complete-cmd-to-string "--find-function" cur-word   ))
				(if (> (length  output-vec) 0)
					(progn  ;;user function
					  (setq  doc   (elt (elt  output-vec 0)  2 ))
					  (popup-tip (concat "[user]:"  (ac-php-clean-document doc)  ))
					  (setq find-flag t)

					  ))))
		  (if (not find-flag) 
			  (let ((cur-function (php-get-pattern) ) function-info) ;;sys function
				(dolist (function-str ac-php-sys-function-list )
				  (when (string= function-str cur-function)
					(setq function-info (get-text-property 0 'ac-php-help  function-str ) )
					;;显示信息
					(popup-tip (concat "[system]:" (ac-php-clean-document function-info)))
					(return )))
				
				))))
	  ))



(defvar ac-template-start-point nil)
(defvar ac-template-candidates (list "ok" "no" "yes:)"))

(defun ac-php-action ()
  (interactive)
  ;; (ac-last-quick-help)
  (let ((help (ac-php-clean-document (get-text-property 0 'ac-php-help (cdr ac-last-completion))))
        (raw-help (get-text-property 0 'ac-php-help (cdr ac-last-completion)))
        (candidates (list)) ss fn args (ret-t "") ret-f)
    (setq ss (split-string raw-help "\n"))
    (dolist (s ss)
      (when (string-match "\\[#\\(.*\\)#\\]" s)
        (setq ret-t (match-string 1 s)))
      (setq s (replace-regexp-in-string "\\[#.*?#\\]" "" s))
      (cond ((string-match "^\\([^(]*\\)\\((.*)\\)" s)
             (setq fn (match-string 1 s)
                   args (match-string 2 s))
             (push (propertize (ac-php-clean-document args) 'ac-php-help ret-t
                               'raw-args args) candidates)
             (when (string-match "\{#" args)
               (setq args (replace-regexp-in-string "\{#.*#\}" "" args))
               (push (propertize (ac-php-clean-document args) 'ac-php-help ret-t
                                 'raw-args args) candidates))
             (when (string-match ", \\.\\.\\." args)
               (setq args (replace-regexp-in-string ", \\.\\.\\." "" args))
               (push (propertize (ac-php-clean-document args) 'ac-php-help ret-t
                                 'raw-args args) candidates)))
            ((string-match "^\\([^(]*\\)(\\*)\\((.*)\\)" ret-t) ;; check whether it is a function ptr
             (setq ret-f (match-string 1 ret-t)
                   args (match-string 2 ret-t))
             (push (propertize args 'ac-php-help ret-f 'raw-args "") candidates)
             (when (string-match ", \\.\\.\\." args)
               (setq args (replace-regexp-in-string ", \\.\\.\\." "" args))
               (push (propertize args 'ac-php-help ret-f 'raw-args "") candidates)))))
    (cond (candidates
           (setq candidates (delete-dups candidates))
           (setq candidates (nreverse candidates))
           (setq ac-template-candidates candidates)
           (setq ac-template-start-point (point))
           (ac-complete-template)

           (unless (cdr candidates) ;; unless length > 1
             (message (replace-regexp-in-string "\n" "   ;    " help))))
          (t
           (message (replace-regexp-in-string "\n" "   ;    " help))))))
(defun ac-php-prefix ()
  (or (ac-prefix-symbol)
      (let ((c (char-before)))
        (when (or
                  ;; ->
                  (and (eq ?> c) (eq ?- (char-before (1- (point)))))
                  ;; :: 
                  (and (eq ?: c) (eq ?: (char-before (1- (point))))))

          (point)))))


(ac-define-source php
  '((candidates . ac-php-candidate)
    (candidate-face . ac-php-candidate-face)
    (selection-face . ac-php-selection-face)
    (prefix . ac-php-prefix)
    (requires . 0)
    (document . ac-php-document)
    (action . ac-php-action)
    (cache)
    (symbol . "p")))

