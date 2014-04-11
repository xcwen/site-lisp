;;; xcwen-misc.el --- Some basic utility function of xcwen
;; -*- Emacs-Lisp -*-

;; Time-stamp: <2010-09-11 09:53:02 Saturday by taoshanwen>

;; This  file is free  software; you  can redistribute  it and/or
;; modify it under the terms of the GNU General Public License as
;; published by  the Free Software Foundation;  either version 3,
;; or (at your option) any later version.

;; This file is  distributed in the hope that  it will be useful,
;; but WITHOUT ANY WARRANTY; without even the implied warranty of
;; MERCHANTABILITY or FITNESS FOR  A PARTICULAR PURPOSE.  See the
;; GNU General Public License for more details.

;; You  should have  received a  copy of  the GNU  General Public
;; License along with  GNU Emacs; see the file  COPYING.  If not,
;; write  to  the Free  Software  Foundation,  Inc., 51  Franklin
;; Street, Fifth Floor, Boston, MA 02110-1301, USA.


;;; Commentary:
;; 

;;; Code:
(defun add-to-alist (alist-var elt-cons &optional no-replace)
  "Add to the value of ALIST-VAR an element ELT-CONS if it isn't there yet.
If an element with the same car as the car of ELT-CONS is already present,
replace it with ELT-CONS unless NO-REPLACE is non-nil; if a matching
element is not already present, add ELT-CONS to the front of the alist.
The test for presence of the car of ELT-CONS is done with `equal'."
  (let ((existing-element (assoc (car elt-cons) (symbol-value alist-var))))
    (if existing-element
        (or no-replace
            (rplacd existing-element (cdr elt-cons)))
      (set alist-var (cons elt-cons (symbol-value alist-var)))))
  (symbol-value alist-var))




(defun switch-file-term ()
  " 交换终端和文件"
  (interactive)
  (let ( opt-file-name find-path-str )
    (setq opt-file-name (buffer-file-name)   )
    ;;(message "%s %s %s" "====" opt-file-name "kkk")
    (if (and  opt-file-name  (file-exists-p opt-file-name ) )
	(setq file-path-str (file-name-directory opt-file-name ) )
      (setq file-path-str "~/"))
    (if (string= major-mode  "term-mode")
	(evil-buffer nil )
      (if (multi-term-list )
	  (progn
	    (multi-term-next 0 )
	    (evil-local-mode 0 )

	    ;;查看最后一行路径是不是和要转的目录一致
	    (unless  (string= file-path-str default-directory ) 
	      (term-send-raw-string
	       (concat "\C-c cd " file-path-str  "\r" )))
	    )
	(progn
	  (multi-term)
	  (evil-local-mode 0 ))))
    ))


(defun term-send-esc ()
  "Send ESC in term mode."
  (interactive)
  (term-send-raw-string "\e"))

(defun set-tags-config-for-cur-file ()
  "DOCSTRING"
  (interactive)
  (let (tags-dir) 
    (setq tags-dir (file-name-directory (buffer-file-name)  ))

    (setq tags-dir (if (file-exists-p (concat tags-dir ".tags" ) )
		       (concat tags-dir ".tags" )
		     (concat (file-name-directory
			      (substring tags-dir 0 -1)) ".tags" )))

    (setq tags-table-list
	  (list "~/.emacs.d/TAGS" tags-dir))

    (setq cscope-database-regexps
	  (list
	   ( list "^/"
		  ( list t )
		  ( list tags-dir)
		  )))


    ))
(defun cscope-find-functions-calling-this-function-and-set-tags-file (symbol)
  "Display functions calling a function."
  (interactive (list
		(cscope-prompt-for-symbol
		 "Find functions calling this function: " nil)
		))

  (set-tags-config-for-cur-file)
  (let ()
    (setq cscope-symbol symbol)
    (cscope-call (format "Finding functions calling: %s" symbol)
		 (list "-3" symbol) nil 'cscope-process-filter
		 'cscope-process-sentinel)
    ))


(defun my-recentf-open ()

  "open recent files.  In ido style if applicable --lgfang"
  (interactive)
  (let* ((path-table (mapcar
                      (lambda (x) (cons (file-name-nondirectory x) x))
                      recentf-list))
         (file-list (mapcar (lambda (x) (file-name-nondirectory x))
                            recentf-list))
         (complete-fun (if (require 'ido nil t)
                           'ido-completing-read
                         'completing-read))
         (fname (funcall complete-fun "File Name: " file-list)))
    (find-file (cdr (assoc fname path-table)))))


(defun yas-org-very-safe-expand ()
  (let ((yas/fallback-behavior 'return-nil)) (yas-expand)))

(defun set-evil-all-state-key ( key func )
  (define-key evil-insert-state-map key  func) 
  (define-key evil-normal-state-map  key  func ) 
  (define-key evil-visual-state-map key func) 
  (define-key evil-emacs-state-map key func) 
  ) 


(defun set-evil-normal-state-key ( key func )
  (define-key evil-normal-state-map key  func )
  )


(defun trim-string (string)
  "Remove white spaces in beginning and ending of STRING.
White space here is any of: space, tab, emacs newline (line feed, ASCII 10)."
(replace-regexp-in-string "\\`[ \t\n]*" "" (replace-regexp-in-string "[ \t\n]*\\'" "" string))
)

(defun proto-get-cur-cmd()
  "DOCSTRING"
  (let (cmdid  obj-tag)
    (setq  cmdid (thing-at-point 'symbol))
	(if cmdid 
		(progn 
		  (setq obj-tag  cmdid)
		  (setq obj-tag (replace-regexp-in-string  "\\(.*\\)_in$" "\\1" cmdid ) ) 
		  (if (string= obj-tag cmdid)
			  (setq obj-tag (replace-regexp-in-string  "\\(.*\\)_out$" "\\1" cmdid ) ))
		  (if (string= obj-tag cmdid)
			  (setq obj-tag (replace-regexp-in-string  "\\(.*\\)_cmd$" "\\1" cmdid ) ))
		  (if (string= obj-tag cmdid)
			  (setq obj-tag (replace-regexp-in-string  "send_\\(.*\\)$" "\\1" cmdid ) ))



		  (if (string= obj-tag cmdid)
			  (setq obj-tag (replace-regexp-in-string  "^n_\\(.*\\)$" "\\1" cmdid ) ))

		  (if (string= obj-tag cmdid)
			  (setq obj-tag (replace-regexp-in-string  "0[xX]\\(.*\\)$" "\\1" cmdid ) ))

		  obj-tag
		  )
	 "" 
	  ))
  )
;;
(defun find-cmd-def ( cmdid )
  "查找命令号所在调用函数"
  ;;(interactive  (list (read-string cmdid) "sCMD:")) 
  (interactive (list (read-string  (format "CMD(default %s) :" (proto-get-cur-cmd) ) )) )

	      
  ;;(interactive (find-tag-interactive "Find tag: "))

  (let (cmd-name obj-tag ) 
    (setq obj-tag (if (string= cmdid "")
		      (proto-get-cur-cmd )
		    cmdid
		    ))

    ;;重置tags 文件
    (set-tags-config-for-cur-file)
    


    (if (get-buffer  "*tmp-cmd-info*") (kill-buffer "*tmp-cmd-info*"))
    ;;(call-process  "awk"  nil "*tmp-cmd-info*" nil  "-F[,(]"  "{print   substr(tolower(v),0,length(v)-3); } "  (format  "v=%s" cmdid )  "./.tags/bind_all.h"   )
    (call-process  "awk"  nil "*tmp-cmd-info*" nil  "-F[,(]"  " {cmdid=$2; if ( tolower( substr(cmdid,1,2 )) == \"0x\" ){cmdid=substr(cmdid,3 );} if (tolower(cmdid)==tolower(v) ||  tolower(v)==tolower($3)    ){printf (\"%s\",$3); exit;}  } "  (format  "v=%s" obj-tag )  "./.tags/bind_all.h"   )

    (with-current-buffer
	"*tmp-cmd-info*"
      (setq cmd-name  (trim-string (buffer-substring-no-properties (point-min) (point-max)) ) )
      (kill-buffer  "*tmp-cmd-info*")
      (message "cmd funcion:%s" cmd-name)

      )
    (if  (string= (trim-string cmd-name) "")
		(message  "nofind cmd:[%s] " obj-tag   )
      (find-tag   cmd-name nil nil))
    )

  )

;;------------------------------------------------------------
(defun show-dict ()
  "翻译"
  (interactive)
  (let ((cmd "goldendict")(word))
    (setq word (if (and  mark-active
	    (not  (= (region-beginning) (region-end) )))
	(buffer-substring-no-properties (region-beginning)(region-end)) (current-word )))
    (call-process  cmd nil 0 nil  word   )
    ))

(defun proto-show-msg ()
  "查看协议数据"
  (interactive)
  (let (line-msg message-type io-type hex-buf io-type-arg)
    (setq line-msg (buffer-substring-no-properties
		    (line-beginning-position)
		    (line-end-position )))
    ;;找到buffer
    (string-match
     "^.*\\([A-Za-z]+\\)\\([IO]\\)[ \t]*\\[\\(.*\\)\\]\\[\\([0-9A-F ]*\\)\\][\t ]*$"
     line-msg)
    (setq cat_proto "/home/jim/framework/gen_proto/gen_proto_app/bin/cat_proto")
    
    (match-string 0 line-msg)
    (setq message-type (match-string  1 line-msg))
    (setq io-type (match-string  2 line-msg))
    (setq hex-buf (match-string  4 line-msg))
    (if (not hex-buf)
	(progn
	  
	  (message "it no a data line "))
      (progn
	(when (string= message-type "C")
	  (progn
	    (setq io-type-arg (if (string= io-type "I")  "-i" ""))
	    (setq bigend-flag "-b")
	    (setq header-arg "-fcmdid,H,4,2|userid,L,6,4|seqid,L,10,4|result,l,14,4")
	    (setq proto-src-arg "-p/home/jim/server/online/trunk/gen_proto/python/ultraman_online_proto.py") ))
	(when (string= message-type "S")
	  (progn
	    (setq io-type-arg (if (string= io-type "I")  "" "-i"))
	    (setq bigend-flag "")
	    (setq header-arg "")
	    (setq proto-src-arg "-p/home/jim/work/ultraman/online/trunk/gen_proto/python/ultraman_db_proto.py") ))
	
	;;(message "%s %s %s %s %s %s"  cat_proto io-type-arg bigend-flag header-arg proto-src-arg hex-buf  )
	(if (get-buffer  "*proto-out*") (kill-buffer "*proto-out*"))
	(call-process  cat_proto nil "*proto-out*" nil  io-type-arg bigend-flag header-arg proto-src-arg hex-buf  )
	(delete-other-windows)
	(unless (get-buffer-window  "*proto-out*")
	  (set-window-buffer (split-window-below 17)  "*proto-out*"))
	(switch-to-buffer-other-window "*proto-out*")
	(goto-line 20)
	(other-window 1)
	))))

;;全屏
(defun my-fullscreen ()
  (interactive)
  (x-send-client-message
   nil 0 nil "_NET_WM_STATE" 32
   '(2 "_NET_WM_STATE_FULLSCREEN" 0))
  )
;;最化大
(defun my-maximized ()
  (interactive)
  (x-send-client-message
   nil 0 nil "_NET_WM_STATE" 32
   '(2 "_NET_WM_STATE_MAXIMIZED_HORZ" 0))
  (x-send-client-message
   nil 0 nil "_NET_WM_STATE" 32
   '(2 "_NET_WM_STATE_MAXIMIZED_VERT" 0))
  )
;;(progn (skip-syntax-backward "w_") (point))

(defun get-whole-word-pos (&optional arg)
  "得到当前单词的开始和结束"
  (save-excursion
    (let ((beg
	   (progn (skip-syntax-backward "w_") (point)))
	  (end
	   (progn (skip-syntax-forward "w_") (point))
	  ))
      (list beg end))))
(defun copy-whole-word (&optional arg)
  "Copy a sequence of string into kill-ring"
  (interactive)
  (let ( pos )
    (setq pos (get-whole-word-pos))
    (copy-region-as-kill (car pos) (cadr pos))
    ))
(defun gen-function-as-kill ()
  "由类的函数定义 生成函数的实现"
  (interactive)
  (save-excursion
    (let (func-msg class-type pos re-str arg-1 )
      ;;找到当前行定义的函数
      (beginning-of-line)
      (setq func-msg (buffer-substring-no-properties (point)
		       (re-search-forward ";" (point-max) t 1 )  ))
      ;;处理前置的 virtual static
      (setq func-msg (replace-regexp-in-string  "\\`[ \t\n]*\\(virtual\\|static\\)[ \t\n]+\\(.*\\)" "\\2" func-msg   ) ) 

	  ;;去掉其中的 =0 , =NULL 之类的东西 
      (setq func-msg (replace-regexp-in-string  "=[ \t]*[a-zA-Z0-9]\+" ""  func-msg ))

      

      ;;找到是哪一个类的
      (re-search-backward "^\s*class" 0 t 1) 
      (forward-word 2)
      (setq pos (get-whole-word-pos))
      (setq class-type (buffer-substring-no-properties
			(car pos)(cadr pos )))
      ;;在函数名前加上 class-name::
      ;;在最后加上 {}
      (setq re-str "\\`[ \t\n]*\\([a-zA-Z0-9_]+[ \t]*[&*]*\\)[ \t\n]*\\(\\(.\\|\n\\)*\\);")

      (setq arg-1  (replace-regexp-in-string re-str "\\1" func-msg))
      (if (or (string= arg-1 class-type ) (string= arg-1 (concat  "~" class-type  ) ) )
	  (setq func-msg (replace-regexp-in-string
			  re-str
			  (concat "\n"  class-type "::\\1\\2\n{\n\n}\n" )
			  func-msg
			  ))

	(setq func-msg (replace-regexp-in-string
			re-str
			(concat "\n\\1\n" class-type "::\\2\n{\n\n}\n" )
			func-msg
			))
	)

      ;;加入剪切列表
      (kill-new func-msg))))


;;删除当前单词
(defun kill-whole-word (&optional arg)
  "kill a word  into kill-ring"
  (interactive)
  (let (pos)
    (setq pos (get-whole-word-pos))
    (kill-region (car pos) (cadr pos))))
(defun upper-or-lower-whole-word (&optional arg)
  "kill a word  into kill-ring"
  (interactive)
  (let (pos cur_char)
    (setq pos (get-whole-word-pos))
    (setq cur_char (following-char))
    (if (and (>= cur_char ?a ) (<= cur_char ?z )  )
	(upcase-region (car pos) (cadr pos))
      (downcase-region (car pos) (cadr pos))
      )
    ))
;;---------------------------------------------------------------------------


(defun my-c-mode-auto-pair ()
  (interactive)
  (make-local-variable 'skeleton-pair-alist)
  (setq skeleton-pair-alist  '(
			       (?{ \n > _ \n ?} >)))
  (setq skeleton-pair t)
  (local-set-key (kbd "(") 'skeleton-pair-insert-maybe)
  (local-set-key (kbd "[") 'skeleton-pair-insert-maybe)
  (local-set-key (kbd "'") 'skeleton-pair-insert-maybe)
  (local-set-key (kbd "\"") 'skeleton-pair-insert-maybe)
  (local-set-key (kbd "{") 'skeleton-pair-insert-maybe)   
  (backward-char))


(defun vimpulse-c-mode-auto-pair ()
  (interactive)
  (make-local-variable 'skeleton-pair-alist)
  (setq skeleton-pair-alist  '(
			       (?{ \n > _ \n ?} >)))
  (setq skeleton-pair t)
  ;;(vimpulse-local-set-key 'insert-state (kbd "(") 'skeleton-pair-insert-maybe)
  ;;(vimpulse-local-set-key 'insert-state (kbd "[") 'skeleton-pair-insert-maybe)
  ;;(vimpulse-local-set-key 'insert-state (kbd "'") 'skeleton-pair-insert-maybe)
  ;;(vimpulse-local-set-key 'insert-state (kbd "\"") 'skeleton-pair-insert-maybe)
  ;;(vimpulse-local-set-key 'insert-state (kbd "{") 'skeleton-pair-insert-maybe)   
  )

(defun evil-c-mode-auto-pair ()
  (interactive)
  (make-local-variable 'skeleton-pair-alist)
  (setq skeleton-pair-alist  '(
			       (?{ \n > _ \n ?} >)))
  (setq skeleton-pair t)
  (define-key evil-insert-state-map  (kbd "(") 'skeleton-pair-insert-maybe)
  (define-key evil-insert-state-map  (kbd "[") 'skeleton-pair-insert-maybe)
  (define-key evil-insert-state-map  (kbd "'") 'skeleton-pair-insert-maybe)
  (define-key evil-insert-state-map  (kbd "\"") 'skeleton-pair-insert-maybe)
  (define-key evil-insert-state-map  (kbd "{") 'skeleton-pair-insert-maybe)   
  )


(defun match-paren (arg)
  "Go to the matching paren if on a paren; otherwise insert %."
  (interactive "p")
  (cond ((looking-at "\\s(") (forward-list 1) (backward-char 1))
	((looking-at "\\s)") (forward-char 1) (backward-list 1))
	(t (self-insert-command (or arg 1)))))
;;---------------------------------------------------------------------------

(defun join-line-0 (arg)
  ""
  (interactive "p")
  (join-line 0))

(defun copy-whole-line(num)
  (save-excursion
    (beginning-of-line)
    (let ((begin-point (point)))
      (forward-line num)
      (copy-region-as-kill begin-point (point)))
    ))

(defun get-mark-pos-ex ()
  "跨行，则得到所有行的开始和结束"
  (setq reg-begin-pos (region-beginning))
  (setq reg-end-pos (region-end))
  (forward-char (- reg-begin-pos (point) ))
  (beginning-of-line)
  (setq  start-pos  (point))
  (forward-char (- reg-end-pos (point) ))  ;;------
  (if (= (current-column) 0 )
      (backward-char 1 ))
  (end-of-line)
  (setq  end-pos  (if (= (point) (point-max) ) (point-max) (+ (point) 1 ) ))
  (list start-pos end-pos ))

(defun mark-region-ex(&optional arg)
  (interactive "P")
  (setq tmp-mark-pos  (get-mark-pos-ex))
  (forward-char (- (car tmp-mark-pos) (point) ))
  (push-mark (cadr tmp-mark-pos) nil t ))



;;功能
;;
(defun opt-region-or-whole-line(opt-type   arg)
  "提供高级的复制 剪切功能
"
  (save-excursion 
    (if (string= opt-type "copy")
	(setq do-region-func 'copy-region-as-kill do-line-func  'copy-whole-line  )
      (setq do-region-func 'kill-region do-line-func  'kill-whole-line  )
      )

    (if (and  mark-active
	      (not  (= (region-beginning) (region-end) ))
	      )
	(if (string-match "\n"
			  (buffer-substring-no-properties (region-beginning)(region-end)))
	    (progn
	      (if (string= opt-type "copy" ) (point-to-register 0))
	      (setq tmp-mark-pos  (get-mark-pos-ex))
	      (funcall do-region-func (car tmp-mark-pos) (cadr tmp-mark-pos)  )
	      (if (string= opt-type "copy" ) (jump-to-register 0))
	      ) ;-----------
	  (funcall do-region-func (region-beginning) (region-end) ))
      (progn
	(or arg (setq arg 1))
	(message "%s line :%d"  opt-type arg)
	(funcall do-line-func arg)))))

;;;###autoload
(defun copy-region-or-whole-line(&optional arg)
  "有选择区域时：
	1:复制的内容是跨行的：复制区域所在的所有行的内容。不仅仅是区域内的内容
	2:复制的内容没有跨行：复制区域中的内内容
没有选择区域时: 
	1:复制所在的行
	2:支持复制多行.  如 复制3行是  M-3 C-w  
"
  (interactive "P")
  (opt-region-or-whole-line "copy" arg)
  )

;;;###autoload
(defun kill-region-or-whole-line(&optional arg)
  "有选择区域时：
	1:剪切的内容是跨行的：剪切区域所在的所有行的内容。不仅仅是区域内的内容
	2:剪切的内容没有跨行：剪切区域中的内内容
没有选择区域时: 
	1:剪切所在的行
	2:支持剪切多行.  如 剪切3行是  M-3 C-k
"
  (interactive "P")
  (opt-region-or-whole-line "kill" arg))



(defun find-tag-ex (  &optional next-p)
  ""
  (interactive "P")
  ;; (find-tag  (current-word) next-p t)
  (let ((cur-word (current-word )))
    (find-tag   cur-word next-p nil)
    )
  )

(defun find-tag-next-ex (  )
  ""
  (interactive "")
  (find-tag-ex  t)
  )


(defun qiang-comment-dwim-line (&optional arg)
  "Replacement for the comment-dwim command.
If no region is selected and current line is not blank and we are not at the end of the line,
then comment current line.
Replaces default behaviour of comment-dwim, when it inserts comment at the end of the line."
  (interactive "*P")
  (comment-normalize-vars)
  (if (and (not (region-active-p)) (not (looking-at "[ \t]*$")))
      (comment-or-uncomment-region (line-beginning-position) (line-end-position))
    (comment-dwim arg)))


;;------------------------------------------------------------

(defun begin-line-and-insert-line ( arg)
  "C-o"
  (interactive "P")
  (move-beginning-of-line 1)
  (open-line 1))

;;
(defun  region-indent-ex ( is-add )
  "整体缩进"
  (interactive)
  (save-excursion
    (setq mark-pos  (get-mark-pos-ex))
    (message  "%d %d" (car mark-pos) (cadr mark-pos) )
    (if is-add
	(replace-regexp "^" "\t" nil (nth 0 mark-pos) (- (nth 1 mark-pos) 1) )
      (replace-regexp "^\t" "" nil (nth 0 mark-pos) (- (nth 1 mark-pos)  1)))
    ))
(defun region-indent-add ()
  "DOCSTRING"
  (interactive)
  (region-indent-ex t)
  )
(defun region-indent-sub ()
  "DOCSTRING"
  (interactive)
  (region-indent-ex nil)
  )
(defun remake-tags ()
  "DOCSTRING"
  (interactive)
  (message "run metags")
  (message (shell-command-to-string  "./.tags/metags" ))
  )
(defun kill-other-buffers ()
  "Kill all other buffers."
  (interactive)
  (mapc 'kill-buffer (delq (current-buffer) (buffer-list))))

(defun wcy-mark-some-thing-at-point()
  (interactive)
  (let* ((from (point))
         (a (mouse-start-end from from 1))
         (start (car a))
         (end (cadr a))
         (goto-point (if (= from start )
			 end
                       start)))
    (if (eq last-command 'wcy-mark-some-thing-at-point)
        (progn
          ;; exchange mark and point
          (goto-char (mark-marker))
          (set-marker (mark-marker) from))
      (push-mark (if (= goto-point start) end start) nil t)
      (when (and (interactive-p) (null transient-mark-mode))
        (goto-char (mark-marker))
        (sit-for 0 500 nil))
      (goto-char goto-point))))
(defun backward-kill-word-without-_ ()
  "DOCSTRING"
  (interactive)
  (if (and  mark-active
	    (not  (= (region-beginning) (region-end) ))
	    )
      (kill-region (region-beginning) (region-end) )
    (progn
      (let (start-pos end-pos)
	(setq start-pos (point))
	(save-excursion
	  (skip-chars-backward "^a-z0-9A-Z一-龠^")
	  (skip-chars-backward "a-z0-9一-龠^")
	  (skip-chars-backward "A-Z")
	  (setq end-pos (point))
	  )
	(kill-region start-pos end-pos)))))

(defun switch-case-char (&optional arg)
  ""
  (interactive)
  (let (pos cur_char)
    (setq pos (if (< (point) (point-max)) (+ (point) 1) (point) ))
    (setq cur_char (following-char))
    (if (and (>= cur_char ?a ) (<= cur_char ?z )  )
	(upcase-region (point) pos)
      (downcase-region (point)  pos)
      )
    ))


(defun yas-expand-for-vim(&optional field)
  "Expand a snippet before point.

If no snippet expansion is possible, fall back to the behaviour
defined in `yas-fallback-behavior'.

Optional argument FIELD is for non-interactive use and is an
object satisfying `yas--field-p' to restrict the expansion to."
  (interactive)
  (setq yas--condition-cache-timestamp (current-time))
  (let (templates-and-pos)
    (unless (and yas-expand-only-for-last-commands
                 (not (member last-command yas-expand-only-for-last-commands)))
      (setq templates-and-pos (if field
                                  (save-restriction
                                    (narrow-to-region (yas--field-start field)
                                                      (yas--field-end field))
                                    (yas--current-key))
                                (yas--current-key))))
    (if (and templates-and-pos
             (first templates-and-pos))
        (yas--expand-or-prompt-for-template (first templates-and-pos)
                                           (second templates-and-pos)
                                           (third templates-and-pos))
	  (progn
		(message "do indent-for-tab-command  %s" major-mode )
		(let ((c (char-before)))
		  (cond
		   ((and (string= major-mode "c++-mode") (or (eq ?\. c)
					;; ->
					(and (eq ?> c)
						 (eq ?- (char-before (1- (point)))))
					;; ::
					(and (eq ?: c)
						 (eq ?: (char-before (1- (point)))))))
			( auto-complete  '(ac-source-clang )))

		   ((and (string= major-mode "go-mode")  (eq ?\. c))
			( auto-complete  '(ac-source-go )))


		   ( t (indent-for-tab-command ))))
		
		)
     )))


(defun search-proto-info ()
  "Search for symbol near point.
If FORWARD is nil, search backward, otherwise forward."
  (interactive)
  (let (string obj-str tmp-str )
    (setq isearch-forward t)
    (setq string (evil-find-symbol  t) )
    
    (if  (null string) 
        (error "No proto item under point"))

    (setq tmp-str "")
    (cond
     ((string= (substring string -4 ) "_out" )
      (setq tmp-str (substring string 0 -4)))
     ((string= (substring string -3 ) "_in" )
      (setq tmp-str (substring string 0 -3)))
     ((string= (substring string -4 ) "_cmd" )
      (setq tmp-str (substring string 0 -4)))
     )
    (if (not (string= tmp-str ""))
	(setq obj-str  (format "\\_<%s_cmd\\_>\\|\\_<%s_in\\_>\\|\\_<%s_out\\_>" tmp-str tmp-str tmp-str   ))
      (setq obj-str string))
    

    (evil-search obj-str t t)))



(provide 'xcwen-misc)

;;; xcwen-misc.el ends here


;;(require 'emaci)

;;------------------------------------------------------
;;(eal-define-keys
;; 'emaci-mode-map
;; `(
;;   ("/" ignore) ("." ignore) ("a" switch-cc-to-h)("," ignore)  ("i" emaci-q) ("w" forward-word) ("I"  ignore)
;;   ("d"  ignore) ("s"  ignore) ("*"  ignore) (";"  ignore) ("g"  ffap) ("u"  ignore)
;;   ("<backspace>"  backward-word) ("<return>" next-logical-line) ("r"  remake-tags) ("z"  ignore)
;;   ("p" proto-show-msg)
;;   ("<SPC>" ignore)
;;   ("j" my-next-line)
;;   ("G" end-of-buffer)
;;   ("k" previous-logical-line)
;;   ("K" man)
;;   (":" viper-ex)
;;   ("["  ignore) ("]" ignore))) 
;;;;------------------------------------------------------
