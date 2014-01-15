;;; Require

(require 'yasnippet)

(defun load-yas ()
  (setq yas-snippet-dirs   (list   "~/site-lisp/config/my-yas" )  )

  (require 'yasnippet)
  (yas-global-mode 1)


  (add-hook 'c++-mode-common-hook '(lambda()
  (setq ac-sources '(ac-source-clang ) )
								   ))
  
  )


(add-hook 'after-init-hook 'load-yas)

;; Disable yasnippet mode on some mode.
(dolist (hook (list
               'term-mode-hook
               ))
  (add-hook hook '(lambda () (yas-minor-mode -1))))


(provide 'init-yasnippet)

;;; init-yasnippet.el ends here
