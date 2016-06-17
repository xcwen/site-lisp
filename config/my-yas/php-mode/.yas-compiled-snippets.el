;;; Compiled snippets and support files for `php-mode'
;;; Snippet definitions:
;;;
(yas-define-snippets 'php-mode
                     '(("vdoc" "/**\n * @var  $0\n */\n" "doc of var/member" nil nil nil "/home/jim/site-lisp/config/my-yas/php-mode/vdoc" nil nil)
                       ("u" "\\App\\Helper\\Utils::" "u" nil nil nil "/home/jim/site-lisp/config/my-yas/php-mode/u" nil nil)
                       ("log" "Utils::debug_to_html( $0 );\n" "log" nil nil nil "/home/jim/site-lisp/config/my-yas/php-mode/log" nil nil)
                       ("for" "for (${1:iss = 0}; ${2:i < N}; ${3:++i})\n{\n    $0\n}\n" "for (...; ...; ...) { ... }" nil nil nil "/home/jim/site-lisp/config/my-yas/php-mode/for" nil nil)
                       ("fdoc" "/**\n *\n * @return  $0\n */\n" "fdoc  doc of function" nil nil nil "/home/jim/site-lisp/config/my-yas/php-mode/fdoc" nil nil)
                       ("face" "use Illuminate\\Support\\Facades\\\\$0 ;\n" "face" nil nil nil "/home/jim/site-lisp/config/my-yas/php-mode/face" nil nil)
                       ("d" "\\App\\Helper\\Utils::debug_to_html( $0 );\n" "d" nil nil nil "/home/jim/site-lisp/config/my-yas/php-mode/d" nil nil)))


;;; Do not edit! File generated at Wed Mar 16 17:53:06 2016
