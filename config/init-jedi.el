;;; init-jedi.el --- Init for python

;; Filename: init-jedi.el
;; Description: Init for python
;; Author: Andy Stewart <andy@freedom>
;; Maintainer: Andy Stewart <andy@freedom>
;; Copyright (C) 2013, Andy Stewart, all rights reserved.
;; Created: 2013-12-30 21:50:27
;; Version: 0.1
;; Last-Updated: 2013-12-30 21:50:27
;;           By: Andy Stewart
;; URL: http://www.emacswiki.org/emacs/download/init-jedi.el
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
;; Init for python
;;

;;; Installation:
;;
;; Put init-jedi.el to your load-path.
;; The load-path is usually ~/elisp/.
;; It's set in your ~/.emacs like this:
;; (add-to-list 'load-path (expand-file-name "~/elisp"))
;;
;; And the following to your ~/.emacs startup file.
;;
;; (require 'init-jedi)
;;
;; No need more.

;;; Customize:
;;
;;
;;
;; All of the above can customize by:
;;      M-x customize-group RET init-jedi RET
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

;; need install 
;;sudo apt-get install python-jedi python-epc
;;pip install  epc

;;; Require

(autoload 'jedi:setup "jedi" nil t)
(autoload 'jedi:ac-setup "jedi" nil t)

(defvar jedi:goto-stack '())
(defun jedi:jump-to-definition ()
  (interactive)
  (add-to-list 'jedi:goto-stack
               (list (buffer-name) (point)))
  (jedi:goto-definition))
(defun jedi:jump-back ()
  (interactive)
  (let ((p (pop jedi:goto-stack)))
    (if p (progn
            (switch-to-buffer (nth 0 p))
            (goto-char (nth 1 p))))))
;;; Code:

(add-hook 'python-mode-hook 'jedi:setup)
(add-hook 'python-mode-hook 'jedi:ac-setup)

(defun find-python-define (&optional prefix)
  (interactive "P")
  (if (null prefix)
      (jedi:goto-definition)
    (progn
      (switch-to-buffer-other-window (buffer-name))
      (jedi:goto-definition))))

(provide 'init-jedi)

;;; init-jedi.el ends here
