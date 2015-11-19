(defun add-subdirs-to-load-path (dir)
  "Recursive add directories to `load-path'."
  (let ((default-directory (file-name-as-directory dir)) (old-path load-path ))
	(setq load-path nil)
	(add-to-list 'load-path dir)
	(normal-top-level-add-subdirs-to-load-path)
	(setq load-path (append  load-path old-path ) )
	))
(add-subdirs-to-load-path "~/site-lisp/")
(add-subdirs-to-load-path "~/tern/emacs/")

(require 'init)

