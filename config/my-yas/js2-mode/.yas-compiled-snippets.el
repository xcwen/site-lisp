;;; Compiled snippets and support files for `js2-mode'
;;; Snippet definitions:
;;;
(yas-define-snippets 'js2-mode
					 '(("class" "class ${1:ClassName}(${2:object}):\n	\"\"\"$3\n	\"\"\"\n\n	def __init__(self, $4):\n		\"\"\"$5\n		${4:$\n		(let* ((indent\n				(concat \"\\n\" (make-string (current-column) 32)))\n			   (args\n				(mapconcat\n				 '(lambda (x)\n					(if (not (string= (nth 0 x) \"\"))\n						(concat \"- \" (char-to-string 96) (nth 0 x)\n								(char-to-string 96) \":\")))\n				 (mapcar\n				  '(lambda (x)\n					 (mapcar\n					  (lambda (x)\n						(replace-regexp-in-string \"[[:blank:]]*$\" \"\"\n						 (replace-regexp-in-string \"^[[:blank:]]*\" \"\" x))) x))\n				  (mapcar '(lambda (x) (split-string x \"=\"))\n						  (split-string yas-text \",\")))\n				 indent)))\n		  (if (string= args \"\")\n			  (make-string 3 34)\n			(mapconcat\n			 'identity\n			 (list \"\" \"Arguments:\" args (make-string 3 34))\n			 indent)))\n		}\n		${4:$\n		(mapconcat\n		 '(lambda (x)\n			(if (not (string= (nth 0 x) \"\"))\n				(concat \"self._\" (nth 0 x) \" = \" (nth 0 x))))\n		 (mapcar\n		  '(lambda (x)\n			 (mapcar\n			  '(lambda (x)\n				 (replace-regexp-in-string \"[[:blank:]]*$\" \"\"\n				  (replace-regexp-in-string \"^[[:blank:]]*\" \"\" x)))\n			  x))\n		  (mapcar '(lambda (x) (split-string x \"=\"))\n				  (split-string yas-text \",\")))\n		 (concat \"\\n\" (make-string (current-column) 32)))\n		}\n		$0\n" "class" nil nil nil nil nil nil)
					   ("data" "$(\"$1\").data(\"${2}\"${3:,\"\"})$0\n" "data" nil nil nil nil nil nil)
					   ("for" "for (${1:i = 0}; ${2:i < N}; ${3:++i}){\n    $0\n}\n" "for (...; ...; ...) { ... }" nil nil nil nil nil nil)
					   ("on" "\n$(\"$1\").on(\"${2:click}\",function(){\n	//\n	$0\n});\n" "on" nil nil nil nil nil nil)
					   ("reload" "window.location.reload();\n" "reload" nil nil nil nil nil nil)
					   ("val" "$(\"$1\").val(${2:\"\"})$0\n" "val" nil nil nil nil nil nil)))


;;; Do not edit! File generated at Wed Dec  3 09:41:50 2014
