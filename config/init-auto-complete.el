;;; init-auto-complete.el --- Init for auto complete

;; Filename: init-auto-complete.el
;; Description: Init for auto complete
;; Author: Andy Stewart <andy@freedom>
;; Maintainer: Andy Stewart <andy@freedom>
;; Copyright (C) 2013, Andy Stewart, all rights reserved.
;; Created: 2013-12-30 01:31:46
;; Version: 0.1
;; Last-Updated: 2013-12-30 01:31:46
;;           By: Andy Stewart
;; URL: http://www.emacswiki.org/emacs/download/init-auto-complete.el
;; Keywords:
;; Compatibility: GNU Emacs 24.3.50.1
;;
;; Features that might be required by this library:
;;
;;
;;

;;; This file is NOT part of GNU Emacs

;;; License
;;
;; This program is free software; you can redistribute it and/or modify
;; it under the terms of the GNU General Public License as published by
;; the Free Software Foundation; either version 3, or (at your option)
;; any later version.

;; This program is distributed in the hope that it will be useful,
;; but WITHOUT ANY WARRANTY; without even the implied warranty of
;; MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
;; GNU General Public License for more details.

;; You should have received a copy of the GNU General Public License
;; along with this program; see the file COPYING.  If not, write to
;; the Free Software Foundation, Inc., 51 Franklin Street, Fifth
;; Floor, Boston, MA 02110-1301, USA.

;;; Commentary:
;;
;; Init for auto complete
;;

;;; Installation:
;;
;; Put init-auto-complete.el to your load-path.
;; The load-path is usually ~/elisp/.
;; It's set in your ~/.emacs like this:
;; (add-to-list 'load-path (expand-file-name "~/elisp"))
;;
;; And the following to your ~/.emacs startup file.
;;
;; (require 'init-auto-complete)
;;
;; No need more.

;;; Customize:
;;
;;
;;
;; All of the above can customize by:
;;      M-x customize-group RET init-auto-complete RET
;;

;;; Change log:
;;
;; 2013/12/30
;;      * First released.
;;

;;; Acknowledgements:
;;
;;
;;

;;; TODO
;;
;;
;;

;;; Require



;;; Code:

(require 'auto-complete-config)
(add-to-list 'ac-dictionary-directories "/usr/share/deepin-emacs/site-lisp/extensions/auto-complete/dict")
(ac-config-default)
(setq ac-use-quick-help nil)

(setq-default
 ac-sources
 '(
   ac-source-imenu
   ac-source-abbrev
   ac-source-words-in-same-mode-buffers
   ac-source-files-in-current-dir
   ac-source-filename
   ))


;;(require 'auto-complete-etags)
;;--clang
(require 'auto-complete-clang)
(setq ac-clang-auto-save t)  
(setq ac-auto-start nil)
(setq ac-quick-help-delay 0.5)
(define-key ac-completing-map "\t" 'ac-complete)


(setq ac-clang-flags  
	  (mapcar (lambda (item)(concat "-I" item))  
			 (split-string (shell-command-to-string "g++ -E -x c++ - -v < /dev/null 2>&1  | grep \"^ [^ ]*$\"  "))))


(setq-default ac-sources '(ac-source-abbrev ac-source-dictionary ac-source-words-in-same-mode-buffers))  
(add-hook 'emacs-lisp-mode-hook 'ac-emacs-lisp-mode-setup)  
(add-hook 'ruby-mode-hook 'ac-ruby-mode-setup)  
(add-hook 'css-mode-hook 'ac-css-mode-setup)  
(add-hook 'auto-complete-mode-hook 'ac-common-setup)  

;;设置c,c++默认的补全方式 clang
(add-hook 'c-mode-hook '(lambda() (setq ac-sources  '(ac-source-clang ) ) ))
(add-hook 'c++-mode-hook '(lambda() (setq ac-sources  '(ac-source-clang ) ) ))

(global-auto-complete-mode t)  

;(setq ac-clang-prefix-header "~/.emacs.d/stdafx.pch")




(provide 'init-auto-complete)

;;; init-auto-complete.el ends here
