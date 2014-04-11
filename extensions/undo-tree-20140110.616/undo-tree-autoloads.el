;;; undo-tree-autoloads.el --- automatically extracted autoloads
;;
;;; Code:


;;;### (autoloads (global-undo-tree-mode undo-tree-mode) "undo-tree"
;;;;;;  "undo-tree.el" (21244 39236))
;;; Generated autoloads from undo-tree.el

(autoload 'undo-tree-mode "undo-tree" "\
Toggle undo-tree mode.\nWith no argument, this command toggles the mode.\nA positive prefix argument turns the mode on.\nA negative prefix argument turns it off.\n\nUndo-tree-mode replaces Emacs' standard undo feature with a more\npowerful yet easier to use version, that treats the undo history\nas what it is: a tree.\n\nThe following keys are available in `undo-tree-mode':\n\n  \\{undo-tree-map}\n\nWithin the undo-tree visualizer, the following keys are available:\n\n  \\{undo-tree-visualizer-mode-map}\n\n(fn &optional ARG)" t nil)

(defvar global-undo-tree-mode nil "\
Non-nil if Global-Undo-Tree mode is enabled.\nSee the command `global-undo-tree-mode' for a description of this minor mode.\nSetting this variable directly does not take effect;\neither customize it (see the info node `Easy Customization')\nor call the function `global-undo-tree-mode'.")

(custom-autoload 'global-undo-tree-mode "undo-tree" nil)

(autoload 'global-undo-tree-mode "undo-tree" "\
Toggle Undo-Tree mode in all buffers.\nWith prefix ARG, enable Global-Undo-Tree mode if ARG is positive;\notherwise, disable it.  If called from Lisp, enable the mode if\nARG is omitted or nil.\n\nUndo-Tree mode is enabled in all buffers where\n`turn-on-undo-tree-mode' would do it.\nSee `undo-tree-mode' for more information on Undo-Tree mode.\n\n(fn &optional ARG)" t nil)

;;;***

;;;### (autoloads nil nil ("undo-tree-pkg.el") (21244 39236 538179))

;;;***

(provide 'undo-tree-autoloads)
;; Local Variables:
;; version-control: never
;; no-byte-compile: t
;; no-update-autoloads: t
;; coding: utf-8
;; End:
;;; undo-tree-autoloads.el ends here
