;;; git-rebase-mode-autoloads.el --- automatically extracted autoloads
;;
;;; Code:


;;;### (autoloads (git-rebase-mode) "git-rebase-mode" "git-rebase-mode.el"
;;;;;;  (21282 36874))
;;; Generated autoloads from git-rebase-mode.el

(autoload 'git-rebase-mode "git-rebase-mode" "\
Major mode for editing of a Git rebase file.\n\nRebase files are generated when you run 'git rebase -i' or run\n`magit-interactive-rebase'.  They describe how Git should perform\nthe rebase.  See the documentation for git-rebase (e.g., by\nrunning 'man git-rebase' at the command line) for details.\n\n(fn)" t nil)

(add-to-list 'auto-mode-alist '("/git-rebase-todo\\'" . git-rebase-mode))

;;;***

;;;### (autoloads nil nil ("git-rebase-mode-pkg.el") (21282 36874
;;;;;;  137590))

;;;***

(provide 'git-rebase-mode-autoloads)
;; Local Variables:
;; version-control: never
;; no-byte-compile: t
;; no-update-autoloads: t
;; coding: utf-8
;; End:
;;; git-rebase-mode-autoloads.el ends here
