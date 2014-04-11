;;; yasnippet-autoloads.el --- automatically extracted autoloads
;;
;;; Code:


;;;### (autoloads (yas-global-mode yas-minor-mode) "yasnippet" "yasnippet.el"
;;;;;;  (21286 22888))
;;; Generated autoloads from yasnippet.el

(autoload 'yas-minor-mode "yasnippet" "\
Toggle YASnippet mode.\n\nWhen YASnippet mode is enabled, `yas-expand', normally bound to\nthe TAB key, expands snippets of code depending on the major\nmode.\n\nWith no argument, this command toggles the mode.\npositive prefix argument turns on the mode.\nNegative prefix argument turns off the mode.\n\nKey bindings:\n\\{yas-minor-mode-map}\n\n(fn &optional ARG)" t nil)

(defvar yas-global-mode nil "\
Non-nil if Yas-Global mode is enabled.\nSee the command `yas-global-mode' for a description of this minor mode.\nSetting this variable directly does not take effect;\neither customize it (see the info node `Easy Customization')\nor call the function `yas-global-mode'.")

(custom-autoload 'yas-global-mode "yasnippet" nil)

(autoload 'yas-global-mode "yasnippet" "\
Toggle Yas minor mode in all buffers.\nWith prefix ARG, enable Yas-Global mode if ARG is positive;\notherwise, disable it.  If called from Lisp, enable the mode if\nARG is omitted or nil.\n\nYas minor mode is enabled in all buffers where\n`yas-minor-mode-on' would do it.\nSee `yas-minor-mode' for more information on Yas minor mode.\n\n(fn &optional ARG)" t nil)

;;;***

;;;### (autoloads nil nil ("yasnippet-pkg.el") (21286 22888 452726))

;;;***

(provide 'yasnippet-autoloads)
;; Local Variables:
;; version-control: never
;; no-byte-compile: t
;; no-update-autoloads: t
;; coding: utf-8
;; End:
;;; yasnippet-autoloads.el ends here
