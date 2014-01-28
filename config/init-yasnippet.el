;;; Require

(require 'yasnippet)
(setq yas-snippet-dirs   (list   "~/site-lisp/config/my-yas" )  )
(yas-global-mode 1)

;; Disable yasnippet mode on some mode.
(dolist (hook (list
               'term-mode-hook
               ))
  (add-hook hook '(lambda () (yas-minor-mode -1))))


(provide 'init-yasnippet)

;;; init-yasnippet.el ends here
