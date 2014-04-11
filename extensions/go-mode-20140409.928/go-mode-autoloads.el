;;; go-mode-autoloads.el --- automatically extracted autoloads
;;
;;; Code:


;;;### (autoloads (go-download-play godoc gofmt-before-save go-mode)
;;;;;;  "go-mode" "go-mode.el" (21318 22609))
;;; Generated autoloads from go-mode.el

(autoload 'go-mode "go-mode" "\
Major mode for editing Go source text.\n\nThis mode provides (not just) basic editing capabilities for\nworking with Go code. It offers almost complete syntax\nhighlighting, indentation that is almost identical to gofmt and\nproper parsing of the buffer content to allow features such as\nnavigation by function, manipulation of comments or detection of\nstrings.\n\nIn addition to these core features, it offers various features to\nhelp with writing Go code. You can directly run buffer content\nthrough gofmt, read godoc documentation from within Emacs, modify\nand clean up the list of package imports or interact with the\nPlayground (uploading and downloading pastes).\n\nThe following extra functions are defined:\n\n- `gofmt'\n- `godoc'\n- `go-import-add'\n- `go-remove-unused-imports'\n- `go-goto-imports'\n- `go-play-buffer' and `go-play-region'\n- `go-download-play'\n- `godef-describe' and `godef-jump'\n- `go-coverage'\n\nIf you want to automatically run `gofmt' before saving a file,\nadd the following hook to your emacs configuration:\n\n(add-hook 'before-save-hook #'gofmt-before-save)\n\nIf you want to use `godef-jump' instead of etags (or similar),\nconsider binding godef-jump to `M-.', which is the default key\nfor `find-tag':\n\n(add-hook 'go-mode-hook (lambda ()\n                          (local-set-key (kbd \"M-.\") #'godef-jump)))\n\nPlease note that godef is an external dependency. You can install\nit with\n\ngo get code.google.com/p/rog-go/exp/cmd/godef\n\n\nIf you're looking for even more integration with Go, namely\non-the-fly syntax checking, auto-completion and snippets, it is\nrecommended that you look at goflymake\n(https://github.com/dougm/goflymake), gocode\n(https://github.com/nsf/gocode), go-eldoc\n(github.com/syohex/emacs-go-eldoc) and yasnippet-go\n(https://github.com/dominikh/yasnippet-go)\n\n(fn)" t nil)

(add-to-list 'auto-mode-alist (cons "\\.go\\'" 'go-mode))

(autoload 'gofmt-before-save "go-mode" "\
Add this to .emacs to run gofmt on the current buffer when saving:\n (add-hook 'before-save-hook 'gofmt-before-save).\n\nNote that this will cause go-mode to get loaded the first time\nyou save any file, kind of defeating the point of autoloading.\n\n(fn)" t nil)

(autoload 'godoc "go-mode" "\
Show go documentation for a query, much like M-x man.\n\n(fn QUERY)" t nil)

(autoload 'go-download-play "go-mode" "\
Downloads a paste from the playground and inserts it in a Go\nbuffer. Tries to look for a URL at point.\n\n(fn URL)" t nil)

;;;***

;;;### (autoloads nil nil ("go-mode-load.el" "go-mode-pkg.el") (21318
;;;;;;  22609 335447))

;;;***

(provide 'go-mode-autoloads)
;; Local Variables:
;; version-control: never
;; no-byte-compile: t
;; no-update-autoloads: t
;; coding: utf-8
;; End:
;;; go-mode-autoloads.el ends here
