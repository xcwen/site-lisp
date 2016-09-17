(setq g-test-ac-php  nil)
(when g-test-ac-php  
  (setq package-archives
        '(("melpa" . "http://melpa.milkbox.net/packages/")) )

  (package-initialize)
  (unless (package-installed-p 'ac-php )
    (package-refresh-contents)
    (package-install 'ac-php )
    )
  (require 'cl)
  (require 'php-mode)
  (add-hook 'php-mode-hook
            '(lambda ()
               (auto-complete-mode t)
               (require 'ac-php)
               (setq ac-sources  '(ac-source-php ) )
               (yas-global-mode 1)

               (define-key php-mode-map  (kbd "C-]") 'ac-php-find-symbol-at-point)   ;goto define
               (define-key php-mode-map  (kbd "C-t") 'ac-php-location-stack-back   ) ;go back
               ))
  )

(unless  g-test-ac-php 

  (require 'init-package)
  ;;function for  string and file
  (require 's)
  (require 'f)

  (require 'xcwen-misc)
  (require 'init-term)

  (require 'init-hl-line)
  (require 'init-mode)
  (require 'init-comment)
  (require 'init-indent)

  ;;(require 'init-jedi)
  (require 'init-auto-complete)
  (require 'init-yasnippet)

  ;;(require 'init-eclim)

  (require 'init-startup)
  (require 'init-org)
  (require 'init-session)
  (require 'init-evil)
  ;;
  (require 'init-key)
  (require 'init-xwidget)
  )

(provide 'init)
