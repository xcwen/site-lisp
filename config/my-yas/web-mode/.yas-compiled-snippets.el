;;; Compiled snippets and support files for `web-mode'
;;; Snippet definitions:
;;;
(yas-define-snippets 'web-mode
                     '(("xdtd" "<include: file=\"../al_common/td_xs_opt.html\" />" "xdtd" nil
                        ("twitter-bootstrap")
                        nil "/home/jim/site-lisp/config/my-yas/web-mode/xdtd.yasnippet" nil nil)
                       ("tdopt" "<td class=\"remove-for-not-xs\" ></td>\n\n<td class=\"remove-for-xs\" >操作</td>\n\n<include: file=\"../al_common/td_xs_opt.html\" />\n\n<td class=\"remove-for-xs\" >\n    <div   data-userid=\"[$var.userid]\" data-stu_nick=\"[$var.nick]\">\n        <a href=\"javascript:;\" class=\"btn  fa fa-info td-info\"></a>\n        <a href=\"javascript:;\" class=\"btn fa fa-user opt-user \"></a>\n    </div>\n</td>\n" "tdopt" nil nil nil "/home/jim/site-lisp/config/my-yas/web-mode/tdopt.yasnippet" nil nil)
                       ("table" "<table   class=\"table table-bordered table-striped\"   >" "table" nil
                        ("twitter-bootstrap")
                        nil "/home/jim/site-lisp/config/my-yas/web-mode/table.yasnippet" nil nil)
                       ("row" "<div class=\"row\">\n    <div class=\"col-xs-6 col-md-2\">\n        <div class=\"input-group \">\n            <span >$1</span>\n            <input type=\"text\" value=\"\"   id=\"$2\"  placeholder=\"$3\" />$0\n        </div>\n    </div>\n</div>\n" "row" nil
                        ("twitter-bootstrap")
                        nil "/home/jim/site-lisp/config/my-yas/web-mode/row.yasnippet" nil nil)
                       ("panel" "<div class=\"panel $1\">\n  <div class=\"panel-heading\">$2</div>\n  <div class=\"panel-body\">\n    $0\n  </div>\n</div>" "panel" nil
                        ("twitter-bootstrap")
                        nil "/home/jim/site-lisp/config/my-yas/web-mode/panel.yasnippet" nil nil)
                       ("on" "$(\"$1\").on (\"${2:click}\",function( ){\n$0\n}); \n" "on" nil nil nil "/home/jim/site-lisp/config/my-yas/web-mode/on.yasnippet" nil nil)
                       ("modal" "<div class=\"modal fade\" \n     id=\"$1\" \n     tabindex=\"-1\" \n     role=\"dialog\" \n     aria-labelledby=\"$2\" \n     aria-hidden=\"true\">\n  <div class=\"modal-dialog\">\n    <div class=\"modal-content\">\n      <div class=\"modal-header\">\n        <button type=\"button\" \n		class=\"close\" \n		data-dismiss=\"modal\" \n		aria-hidden=\"true\">&times;</button>\n        <h4 class=\"modal-title\" id=\"$2\">$3</h4>\n      </div>\n      <div class=\"modal-body\">\n        $0\n      </div>\n      <div class=\"modal-footer\">\n        <button type=\"button\" \n                class=\"btn btn-default\" \n                data-dismiss=\"modal\">${5:Close}</button>\n        <button type=\"button\" \n		class=\"btn btn-primary\">${6:Save}</button>\n      </div>\n    </div>\n  </div>\n</div>" "modal" nil
                        ("twitter-bootstrap")
                        nil "/home/jim/site-lisp/config/my-yas/web-mode/modal.yasnippet" "direct-keybinding" nil)
                       ("icon" "<span class=\"glyphicon glyphicon-$1\"></span>$0" "icon" nil
                        ("twitter-bootstrap")
                        nil "/home/jim/site-lisp/config/my-yas/web-mode/icon.yasnippet" nil nil)
                       ("div" "<div class=\"$1\"${2: id=\"$3\"}>\n  $0 asdfa\n</div>" "div" nil
                        ("twitter-bootstrap")
                        nil "/home/jim/site-lisp/config/my-yas/web-mode/div.yasnippet" nil nil)
                       ("dis" "style=\"display:none;\"" "dis" nil
                        ("twitter-bootstrap")
                        nil "/home/jim/site-lisp/config/my-yas/web-mode/dis.yasnippet" nil nil)
                       ("container" "<div class=\"container\">\n  $0\n</div>" "container" nil
                        ("twitter-bootstrap")
                        nil "/home/jim/site-lisp/config/my-yas/web-mode/container.yasnippet" nil nil)
                       ("button" "<button type=\"button\" class=\"btn btn-${1:$$(yas-choose-value '(\"default\" \"primary\" \"success\" \"info\" \"warning\" \"danger\" \"link\"))}\" $2>$3</button>$0" "button" nil
                        ("twitter-bootstrap")
                        nil "/home/jim/site-lisp/config/my-yas/web-mode/button.yasnippet" "direct-keybinding" nil)
                       ("a" "<a href=\"$1\" class=\"$2\" $3>$4</a>$0" "<a href=\"\" class=\"\"..</a>" nil
                        ("twitter-bootstrap")
                        nil "/home/jim/site-lisp/config/my-yas/web-mode/alink.yasnippet" "direct-keybinding" nil)
                       ("alert" "<div class=\"alert alert-${1:$$(yas-choose-value '(\"success\" \"info\" \"warning\" \"danger\"))}\">${2:\n<button type=\"button\" class=\"close\" data-dismiss=\"alert\" aria-hidden=\"true\">&times;</button>}\n  $0\n</div>" "alert" nil
                        ("twitter-bootstrap")
                        nil "/home/jim/site-lisp/config/my-yas/web-mode/alert.yasnippet" nil nil)
                       ("a" "<a class=\"btn btn-${1:$$(yas-choose-value '(\"default\" \"primary\" \"success\" \"info\" \"warning\" \"danger\" \"link\"))}\" role=\"button\" $2>$3</a>$0" "<a class=\"btn\" ..</a>" nil
                        ("twitter-bootstrap")
                        nil "/home/jim/site-lisp/config/my-yas/web-mode/abutton.yasnippet" "direct-keybinding" nil)))


;;; Do not edit! File generated at Wed Mar 16 17:53:06 2016
