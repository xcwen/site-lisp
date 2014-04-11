;;; auto-complete-autoloads.el --- automatically extracted autoloads
;;
;;; Code:


;;;### (autoloads (global-auto-complete-mode auto-complete-mode auto-complete)
;;;;;;  "auto-complete" "auto-complete.el" (21295 51507))
;;; Generated autoloads from auto-complete.el

(autoload 'auto-complete "auto-complete" "\
Start auto-completion at current point.\n\n(fn &optional SOURCES)" t nil)

(autoload 'auto-complete-mode "auto-complete" "\
AutoComplete mode\n\n(fn &optional ARG)" t nil)

(defvar global-auto-complete-mode nil "\
Non-nil if Global-Auto-Complete mode is enabled.\nSee the command `global-auto-complete-mode' for a description of this minor mode.\nSetting this variable directly does not take effect;\neither customize it (see the info node `Easy Customization')\nor call the function `global-auto-complete-mode'.")

(custom-autoload 'global-auto-complete-mode "auto-complete" nil)

(autoload 'global-auto-complete-mode "auto-complete" "\
Toggle Auto-Complete mode in all buffers.\nWith prefix ARG, enable Global-Auto-Complete mode if ARG is positive;\notherwise, disable it.  If called from Lisp, enable the mode if\nARG is omitted or nil.\n\nAuto-Complete mode is enabled in all buffers where\n`auto-complete-mode-maybe' would do it.\nSee `auto-complete-mode' for more information on Auto-Complete mode.\n\n(fn &optional ARG)" t nil)

;;;***

;;;### (autoloads nil nil ("auto-complete-config.el" "auto-complete-pkg.el")
;;;;;;  (21295 51507 283105))

;;;***

(provide 'auto-complete-autoloads)
;; Local Variables:
;; version-control: never
;; no-byte-compile: t
;; no-update-autoloads: t
;; coding: utf-8
;; End:
;;; auto-complete-autoloads.el ends here
