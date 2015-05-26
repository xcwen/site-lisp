(require 'eclim)
(custom-set-variables
 '(eclim-eclipse-dirs '("~/eclipse"))
 '(eclim-executable "~/eclipse/eclim"))
(global-eclim-mode)

(require 'ac-emacs-eclim-source)
(ac-define-source emacs-eclim
  '((candidates . eclim--completion-candidates)
    (action . eclim--completion-action)
    (prefix . eclim-completion-start)
    (document . eclim--completion-documentation)
    (requires . 0)
    (cache)
    (selection-face . ac-emacs-eclim-selection-face)
    (candidate-face . ac-emacs-eclim-candidate-face)
    (symbol . "f")))


(add-hook 'java-mode-hook '(lambda() (interactive)
                             (setq ac-sources '(ac-source-emacs-eclim) )
                             ))

(add-hook 'groovy-mode-hook '(lambda() (interactive)
                               (add-to-list 'ac-sources 'ac-source-emacs-eclim)))
(add-hook 'xml-mode-hook 'ac-emacs-eclim-xml-setup)
(add-hook 'nxml-mode-hook 'ac-emacs-eclim-xml-setup)


(provide 'init-eclim)
