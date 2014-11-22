;;; auto-complete-php.el --- Auto Completion source for php for GNU Emacs

;; Copyright (C) 2010  Brian Jiang

;; Author: Brian Jiang <brianjcj@gmail.com>
;; Keywords: completion, convenience
;; URL: https://github.com/brianjcj/auto-complete-php
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


;;; Commentary:
;;
;; Auto Completion source for php. Most of codes are taken from

;;; Code:


(provide 'auto-complete-php)
(require 'auto-complete)


(defcustom ac-php-executable
  (executable-find "php")
  "*Location of php executable"
  :group 'auto-complete
  :type 'file)

(defcustom ac-php-auto-save nil
  "*Determines whether to save the buffer when retrieving completions.
Old version of php can only complete correctly when the buffer has been saved.
Now php can parse the codes from standard input so that we can turn this option
to Off. If you are still using the old php, turn it on!"
  :group 'auto-complete
  :type '(choice (const :tag "Off" nil)
                 (const :tag "On" t)))

(defcustom ac-php-lang-option-function nil
  "*function to return the lang type for option -x."
  :group 'auto-complete
  :type 'function)

;;; Extra compilation flags to pass to php.
(defcustom ac-php-flags nil
  "Extra flags to pass to the Clang executable.
This variable will typically contain include paths, e.g., ( \"-I~/MyProject\", \"-I.\" )."
  :group 'auto-complete
  :type '(repeat (string :tag "Argument" "")))

;;; The prefix header to use with Clang code completion. 
(defvar ac-php-prefix-header nil)


(defconst ac-php-completion-pattern
  "^COMPLETION: \\(%s[^\s\n:]*\\)\\(?: : \\)*\\(.*$\\)")

(defconst ac-php-error-buffer-name "*php error*")

(defun ac-php-parse-output (prefix)
  (goto-char (point-min))
  (let ((pattern (format ac-php-completion-pattern
                         (regexp-quote prefix)))
        lines match detailed_info
        (prev-match ""))
    (while (re-search-forward pattern nil t)
      (setq match (match-string-no-properties 1))
      (unless (string= "Pattern" match)
        (setq detailed_info (match-string-no-properties 2))
      
        (if (string= match prev-match)
            (progn
              (when detailed_info
                (setq match (propertize match
                                        'ac-php-help
                                        (concat
                                         (get-text-property 0 'ac-php-help (car lines))
                                         "\n"
                                         detailed_info)))
                (setf (car lines) match)
                ))
          (setq prev-match match)
          (when detailed_info
            (setq match (propertize match 'ac-php-help detailed_info)))
          (push match lines))))    
	;(message lines)

    ))




(defun ac-php-handle-error (res args)
  (goto-char (point-min))
  (let* ((buf (get-buffer-create ac-php-error-buffer-name))
         (cmd (concat ac-php-executable " " (mapconcat 'identity args " ")))
         (pattern (format ac-php-completion-pattern ""))
         (err (if (re-search-forward pattern nil t)
                  (buffer-substring-no-properties (point-min)
                                                  (1- (match-beginning 0)))
                ;; Warn the user more agressively if no match was found.
                (message "php failed with error %d:\n%s" res cmd)
                (buffer-string))))

    (with-current-buffer buf
      (let ((inhibit-read-only t))
        (erase-buffer)
        (insert (current-time-string)
                (format "\nphp failed with error %d:\n" res)
                cmd "\n\n")
        (insert err)
        (setq buffer-read-only t)
        (goto-char (point-min))))))

(defun ac-php-call-process (prefix &rest args)
  (let ((buf (get-buffer-create "*php-output*"))
        res)
    (with-current-buffer buf (erase-buffer))
    (setq res (if ac-php-auto-save
                  (apply 'call-process ac-php-executable nil buf nil args)
                (apply 'call-process-region (point-min) (point-max)
                       ac-php-executable nil buf nil args)))
    (with-current-buffer buf
      (unless (eq 0 res)
        (ac-php-handle-error res args))
      ;; Still try to get any useful input.
      (ac-php-parse-output prefix))))



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
  ;; (popup-item-property item 'ac-php-help)
  )


(defface ac-php-candidate-face
  '((t (:background "lightgray" :foreground "navy")))
  "Face for php candidate"
  :group 'auto-complete)

(defface ac-php-selection-face
  '((t (:background "navy" :foreground "white")))
  "Face for the php selected candidate."
  :group 'auto-complete)

(defsubst ac-in-string/comment ()
  "Return non-nil if point is in a literal (a comment or string)."
  (nth 8 (syntax-ppss)))

(defun ac-php-candidate ()
  

 '(#("terminate_handler" 0 17 (ac-php-help "terminate_handler(<#mysqli $db#>)
")) #("terminate" 0 9 (ac-php-help "[#void#]terminate(<#_Tp &__a#>)\n[#int#]terminate(<#_Tp &__a#>,<#_Tp &__b#>)"))))


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
        (when (or (eq ?\. c)
                  ;; ->
                  (and (eq ?> c)
                       (eq ?- (char-before (1- (point)))))
                  ;; ::
                  (and (eq ?: c)
                       (eq ?: (char-before (1- (point))))))
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

(defun ac-php-same-count-in-string (c1 c2 s)
  (let ((count 0) (cur 0) (end (length s)) c)
    (while (< cur end)
      (setq c (aref s cur))
      (cond ((eq c1 c)
             (setq count (1+ count)))
            ((eq c2 c)
             (setq count (1- count))))
      (setq cur (1+ cur)))
    (= count 0)))

(defun ac-php-split-args (s)
  (let ((sl (split-string s ", *")))
    (cond ((string-match "<\\|(" s)
           (let ((res (list)) (pre "") subs)
             (while sl
               (setq subs (pop sl))
               (unless (string= pre "")
                 (setq subs (concat pre ", " subs))
                 (setq pre ""))
               (cond ((and (ac-php-same-count-in-string ?\< ?\> subs)
                           (ac-php-same-count-in-string ?\( ?\) subs))
                      (push subs res))
                     (t
                      (setq pre subs))))
             (nreverse res)))
          (t
           sl))))


(defun ac-template-candidate ()
  ac-template-candidates)

(defun ac-template-action ()
  (interactive)
  (unless (null ac-template-start-point)
    (let ((pos (point)) sl (snp "")
          (s (get-text-property 0 'raw-args (cdr ac-last-completion))))
      (cond ((string= s "")
             ;; function ptr call
             (setq s (cdr ac-last-completion))
             (setq s (replace-regexp-in-string "^(\\|)$" "" s))
             (setq sl (ac-php-split-args s))
             (cond ((featurep 'yasnippet)
                    (dolist (arg sl)
                      (setq snp (concat snp ", ${" arg "}")))
                    (condition-case nil
                        (yas/expand-snippet (concat "("  (substring snp 2) ")")
                                            ac-template-start-point pos) ;; 0.6.1c
                      (error
                       ;; try this one:
                       (ignore-errors (yas/expand-snippet
                                       ac-template-start-point pos
                                       (concat "("  (substring snp 2) ")"))) ;; work in 0.5.7
                       )))
                   ((featurep 'snippet)
                    (delete-region ac-template-start-point pos)
                    (dolist (arg sl)
                      (setq snp (concat snp ", $${" arg "}")))
                    (snippet-insert (concat "("  (substring snp 2) ")")))
                   (t
                    (message "Dude! You are too out! Please install a yasnippet or a snippet script:)"))))
             (t
             (unless (string= s "()")
               (setq s (replace-regexp-in-string "{#" "" s))
               (setq s (replace-regexp-in-string "#}" "" s))
               (cond ((featurep 'yasnippet)
                      (setq s (replace-regexp-in-string "<#" "${" s))
                      (setq s (replace-regexp-in-string "#>" "}" s))
                      (setq s (replace-regexp-in-string ", \\.\\.\\." "}, ${..." s))
                      (condition-case nil
                          (yas/expand-snippet s ac-template-start-point pos) ;; 0.6.1c
                        (error
                         ;; try this one:
                         (ignore-errors (yas/expand-snippet ac-template-start-point pos s)) ;; work in 0.5.7
                         )))
                     ((featurep 'snippet)
                      (delete-region ac-template-start-point pos)
                      (setq s (replace-regexp-in-string "<#" "$${" s))
                      (setq s (replace-regexp-in-string "#>" "}" s))
                      (setq s (replace-regexp-in-string ", \\.\\.\\." "}, $${..." s))
                      (snippet-insert s))
                     (t
                      (message "Dude! You are too out! Please install a yasnippet or a snippet script:)")))))))))


(defun ac-template-prefix ()
  ac-template-start-point)


;; this source shall only be used internally.
(ac-define-source template
  '((candidates . ac-template-candidate)
    (prefix . ac-template-prefix)
    (requires . 0)
    (action . ac-template-action)
    (document . ac-php-document)
    (cache)
    (symbol . "t")))

;;; auto-complete-php.el ends here
