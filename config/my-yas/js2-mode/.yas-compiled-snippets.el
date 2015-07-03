;;; Compiled snippets and support files for `js2-mode'
;;; Snippet definitions:
;;;
(yas-define-snippets 'js2-mode
                     '(("data" "$(\"$1\").data(\"${2}\"${3:,\"\"})$0\n" "data" nil nil nil nil nil nil)
                       ("dlg" "\n\nvar html_node=dlg_need_html_by_id(\"\");\nhtml_node.find(\"\").html();\nBootstrapDialog.show({\n	title: \"\",\n	message : html_node ,\n	buttons: [{\n		label: '返回',\n		action: function(dialog) {\n			dialog.close();\n		}\n	}, {\n		label: '确认',\n		cssClass: 'btn-warning',\n		action: function(dialog) {\n\n			//get data from dlg\n			var val=html_node.find(\"\").val();\n        \n			dialog.close();\n		}\n	}]\n});\n" "dlg" nil nil nil nil nil nil)
                       ("for" "for (${1:i = 0}; ${2:i < N}; ${3:++i}){\n    $0\n}\n" "for (...; ...; ...) { ... }" nil nil nil nil nil nil)
                       ("on" "\n$(\"$1\").on(\"${2:click}\",function(){\n	//\n	$0\n});\n" "on" nil nil nil nil nil nil)
                       ("reload" "window.location.reload();\n" "reload" nil nil nil nil nil nil)
                       ("val" "$(\"$1\").val(${2:\"\"})$0\n" "val" nil nil nil nil nil nil)))


;;; Do not edit! File generated at Thu Jun 25 09:55:25 2015
