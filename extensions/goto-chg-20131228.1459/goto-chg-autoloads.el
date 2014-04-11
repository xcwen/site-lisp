;;; goto-chg-autoloads.el --- automatically extracted autoloads
;;
;;; Code:


;;;### (autoloads (goto-last-change-reverse goto-last-change) "goto-chg"
;;;;;;  "goto-chg.el" (21244 39214))
;;; Generated autoloads from goto-chg.el

(autoload 'goto-last-change "goto-chg" "\
Go to the point where the last edit was made in the current buffer.\nRepeat the command to go to the second last edit, etc.\n\nTo go back to more recent edit, the reverse of this command, use \\[goto-last-change-reverse]\nor precede this command with \\[universal-argument] - (minus).\n\nIt does not go to the same point twice even if there has been many edits\nthere. I call the minimal distance between distinguishable edits \"span\".\nSet variable `glc-default-span' to control how close is \"the same point\".\nDefault span is 8.\nThe span can be changed temporarily with \\[universal-argument] right before \\[goto-last-change]:\n\\[universal-argument] <NUMBER> set current span to that number,\n\\[universal-argument] (no number) multiplies span by 4, starting with default.\nThe so set span remains until it is changed again with \\[universal-argument], or the consecutive\nrepetition of this command is ended by any other command.\n\nWhen span is zero (i.e. \\[universal-argument] 0) subsequent \\[goto-last-change] visits each and\nevery point of edit and a message shows what change was made there.\nIn this case it may go to the same point twice.\n\nThis command uses undo information. If undo is disabled, so is this command.\nAt times, when undo information becomes too large, the oldest information is\ndiscarded. See variable `undo-limit'.\n\n(fn ARG)" t nil)

(autoload 'goto-last-change-reverse "goto-chg" "\
Go back to more recent changes after \\[goto-last-change] have been used.\nSee `goto-last-change' for use of prefix argument.\n\n(fn ARG)" t nil)

;;;***

;;;### (autoloads nil nil ("goto-chg-pkg.el") (21244 39214 354207))

;;;***

(provide 'goto-chg-autoloads)
;; Local Variables:
;; version-control: never
;; no-byte-compile: t
;; no-update-autoloads: t
;; coding: utf-8
;; End:
;;; goto-chg-autoloads.el ends here
