(defun add-subdirs-to-load-path (dir)
  "Recursive add directories to `load-path'."
  (let ((default-directory (file-name-as-directory dir)) (old-path load-path ))
	(setq load-path nil)
	(add-to-list 'load-path dir)
	(normal-top-level-add-subdirs-to-load-path)
	(setq load-path (append  load-path old-path ) )
	))
(add-subdirs-to-load-path "~/site-lisp/")
(require 'init)

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(blink-cursor-mode nil)
 '(case-fold-search nil)
 '(custom-enabled-themes (quote (tsdh-dark)))
 '(evil-symbol-word-search t)
 '(js2-idle-timer-delay 1000000)
 '(quote (ansi-color-names-vector ["#2e3436" "#a40000" "#4e9a06" "#c4a000" "#204a87" "#5c3566" "#729fcf" "#eeeeec"]))
 '(session-use-package t nil (session))
 '(show-paren-mode t)
 '(tool-bar-mode nil))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(term-color-blue ((t (:background "blue" :foreground "steel blue"))) t)
 '(term-color-green ((t (:background "green3" :foreground "lime green"))) t)
 '(term-color-red ((t (:background "red3" :foreground "brown"))) t))
