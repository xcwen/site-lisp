;;; Compiled snippets and support files for `php-mode'
;;; Snippet definitions:
;;;
(yas-define-snippets 'php-mode
                     '(("fdoc" "/**\n *\n * @return  $0\n */\n" "fdoc  doc of function" nil nil nil nil nil nil)
                       ("for" "for (${1:iss = 0}; ${2:i < N}; ${3:++i})\n{\n    $0\n}\n" "for (...; ...; ...) { ... }" nil nil nil nil nil nil)
                       ("vdoc" "/**\n * @var  $0\n */\n" "doc of var/member " nil nil nil nil nil nil)))


;;; Do not edit! File generated at Thu Jun 25 09:55:25 2015
