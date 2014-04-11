;;; multi-term-autoloads.el --- automatically extracted autoloads
;;
;;; Code:


;;;### (autoloads (multi-term-dedicated-select multi-term-dedicated-toggle
;;;;;;  multi-term-dedicated-open multi-term-prev multi-term-next
;;;;;;  multi-term) "multi-term" "multi-term.el" (21295 51481))
;;; Generated autoloads from multi-term.el

(autoload 'multi-term "multi-term" "\
Create new term buffer.\nWill prompt you shell name when you type `C-u' before this command.\n\n(fn)" t nil)

(autoload 'multi-term-next "multi-term" "\
Go to the next term buffer.\nIf OFFSET is `non-nil', will goto next term buffer with OFFSET.\n\n(fn &optional OFFSET)" t nil)

(autoload 'multi-term-prev "multi-term" "\
Go to the previous term buffer.\nIf OFFSET is `non-nil', will goto previous term buffer with OFFSET.\n\n(fn &optional OFFSET)" t nil)

(autoload 'multi-term-dedicated-open "multi-term" "\
Open dedicated `multi-term' window.\nWill prompt you shell name when you type `C-u' before this command.\n\n(fn)" t nil)

(autoload 'multi-term-dedicated-toggle "multi-term" "\
Toggle dedicated `multi-term' window.\n\n(fn)" t nil)

(autoload 'multi-term-dedicated-select "multi-term" "\
Select the `multi-term' dedicated window.\n\n(fn)" t nil)

;;;***

;;;### (autoloads nil nil ("multi-term-pkg.el") (21295 51481 639488))

;;;***

(provide 'multi-term-autoloads)
;; Local Variables:
;; version-control: never
;; no-byte-compile: t
;; no-update-autoloads: t
;; coding: utf-8
;; End:
;;; multi-term-autoloads.el ends here
