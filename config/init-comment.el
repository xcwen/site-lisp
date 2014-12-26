

(global-set-key (kbd  "C-/"  ) nil)
(require 'undo-tree)
(define-key undo-tree-map (kbd "C-/")  nil)
(global-set-key  (kbd  "C-/"  )   'comment-or-uncomment-region-or-whole-line )


(add-hook
 'web-mode-hook
 '(lambda()
    ;;web-mode 特别处理
    (defadvice web-mode-comment-or-uncomment (before jim-web-mode-comment-or-uncomment  activate compile)
      "多行注释处理"
      (interactive)
      (if (and mark-active
               (string-match "\n"
                             (buffer-substring-no-properties (region-beginning)(region-end))))
          (mark-region-ex)))

    (define-key   web-mode-map (kbd  "C-/"  )   'web-mode-comment-or-uncomment )
    ))

(provide 'init-comment)

;;; init-comment.el ends here
