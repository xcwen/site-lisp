;;; Compiled snippets and support files for `php-mode'
;;; Snippet definitions:
;;;
(yas-define-snippets 'php-mode
                     '(("vdoc" "/**\n * @var  $0\n */\n" "doc of var/member" nil nil nil "/home/jim/site-lisp/config/my-yas/php-mode/vdoc" nil nil)
                       ("u" "Utils::" "u" nil nil nil "/home/jim/site-lisp/config/my-yas/php-mode/u" nil nil)
                       ("log" "Logger::write($1);\n$0\n" "log" nil nil nil "/home/jim/site-lisp/config/my-yas/php-mode/log" nil nil)
                       ("for" "for (${1:iss = 0}; ${2:i < N}; ${3:++i})\n{\n    $0\n}\n" "for (...; ...; ...) { ... }" nil nil nil "/home/jim/site-lisp/config/my-yas/php-mode/for" nil nil)
                       ("fdoc" "/**\n *\n * @return  $0\n */\n" "fdoc  doc of function" nil nil nil "/home/jim/site-lisp/config/my-yas/php-mode/fdoc" nil nil)
                       ("d" "Utils::debug_to_html( $0 );\n" "d" nil nil nil "/home/jim/site-lisp/config/my-yas/php-mode/d" nil nil)))


;;; Do not edit! File generated at Thu Jan  7 12:58:07 2016
