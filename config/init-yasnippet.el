;;; Require

(require 'yasnippet)

;;; Code:

(setq yas-snippet-dirs   (list   "~/site-lisp/config/my-yas" )  )
(yas-global-mode 1)

;; Disable yasnippet mode on some mode.
(dolist (hook (list
               'term-mode-hook
               ))
  (add-hook hook '(lambda () (yas-minor-mode -1))))

(defun get-git-user-name ()
  (interactive)
  (replace-regexp-in-string "\n$" "" (shell-command-to-string "git config --get user.name")))

(defun get-git-user-email ()
  (interactive)
  (replace-regexp-in-string "\n$" "" (shell-command-to-string "git config --get user.email")))

(provide 'init-yasnippet)

;;; init-yasnippet.el ends here
