

;;(setq debug-on-error t )  ;;开启调试 error
(setq inhibit-startup-screen t)              ;关闭起动时闪屏
(setq inhibit-splash-screen t)               ;关闭起动时闪屏
(setq initial-scratch-message nil)           ;禁止在草稿缓存里面显示处始化信息
(fset 'yes-or-no-p 'y-or-n-p)                ;以 y/n代表 yes/no
(blink-cursor-mode -1)                       ;指针不闪动
(global-font-lock-mode t)                    ;语法高亮
(transient-mark-mode 1)                      ;标记高亮
(show-paren-mode t)                          ;显示括号匹配
(setq-default comment-style 'indent)         ;设定自动缩进的注释风格
(setq ring-bell-function 'ignore)            ;关闭烦人的出错时的提示声
(setq show-paren-style 'parentheses)         ;括号匹配显示但不是烦人的跳到另一个括号。
(setq blink-matching-paren nil)              ;当插入右括号时不显示匹配的左括号
(setq default-major-mode 'text-mode)         ;设置默认地主模式为TEXT模式
(setq mouse-yank-at-point t)                 ;粘贴于光标处,而不是鼠标指针处
(setq x-select-enable-clipboard t)           ;支持emacs和外部程序的粘贴
(setq x-stretch-cursor t)                    ;光标在 TAB 字符上会显示为一个大方块
(setq auto-revert-mode 1)                    ;自动更新buffer
(setq max-lisp-eval-depth 40000)             ;lisp最大执行深度
(setq max-specpdl-size 10000)                ;最大容量
(setq kill-ring-max 1024)                    ;用一个很大的 kill ring. 这样防止我不小心删掉重要的东西
(setq undo-outer-limit 5000000)              ;撤销限制
(setq mark-ring-max 1024)                    ;设置的mark ring容量
(setq message-log-max t)                     ;设置message记录全部消息, 而不用截去
(setq read-quoted-char-radix 16)             ;设置 引用字符 的基数
(setq void-text-area-pointer nil)            ;禁止显示鼠标指针
(setq enable-recursive-minibuffers t)        ;minibuffer 递归调用命令
(setq eval-expression-print-length nil)      ;设置执行表达式的长度没有限制
(setq eval-expression-print-level nil)       ;设置执行表达式的深度没有限制
(setq global-mark-ring-max 1024)             ;设置最大的全局标记容量
(setq history-delete-duplicates t)           ;删除minibuffer的重复历史
(put 'narrow-to-region 'disabled nil)        ;开启变窄区域
(setq print-escape-newlines t)               ;显示字符窗中的换行符为 \n
(setq minibuffer-message-timeout 1)          ;显示消息超时的时间
(setq require-final-newline nil)             ;不自动添加换行符到末尾, 有些情况会出现错误
(auto-compression-mode 1)                    ;打开压缩文件时自动解压缩
(setq ediff-window-setup-function (quote ediff-setup-windows-plain)) ;比较窗口设置在同一个frame里
(setq split-width-threshold nil)                                     ;分屏的时候使用上下分屏
(setq one-key-popup-window nil)                                      ;禁止自动弹出窗口
(setq scroll-step 1                     ;流畅滚屏
      scroll-conservatively 10000
      auto-window-vscroll nil)

(setq isearch-allow-scroll t) ;isearch搜索时是可以滚动屏幕的
(mouse-avoidance-mode 'jump)  ;光标靠近鼠标时让鼠标自动走开
(scroll-bar-mode 0)           ;去掉滚动条  

(my-maximized)

(require 'ido)
(ido-mode t)
(setq ido-enable-flex-matching t)


(custom-set-variables
 '(case-fold-search nil)
 ;;'(custom-enabled-themes (quote (ubuntu)))
 '(custom-enabled-themes (quote (tsdh-dark)))
 '(show-paren-mode t)
 '(menu-bar-mode nil)
 '(tool-bar-mode nil))

(custom-theme-set-faces
 'tsdh-dark
 '(region ((t (:background "gray30"))))
 '(hl-line ((t (:background "gray25"))))
 )


;;使用ubuntu 字体
(custom-set-faces
 '(default ((t (:family "XHei Mono.Ubuntu" :foundry "unknown" :slant normal :weight normal :height 183 :width normal)))))
 


(server-force-delete)
(server-start)


;;-----------------------------------------------------

;; 与其他程序之间复制粘贴
(setq x-select-request-type '(UTF8_STRING COMPOUND_TEXT TEXT STRING))
(setq x-select-enable-clipboard t)
(setq interprogram-paste-function 'x-cut-buffer-or-selection-value) 
;;---------------------------------------------------------------------------
;;最近文件列表
(require 'recentf)
(recentf-mode t)

;;hd
(setq header-user-name "jim")
(setq header-user-email "jim@taomee.com")

(setq frame-title-format  '("file: %f "  ))


;;关闭js2-mode 语法检测,速度不行 ,  需要时:",m"
(custom-set-variables
 '(js2-idle-timer-delay 1000000))


;;交换.cpp .hpp 文件
(require 'switch-file)
(require 'xcscope)
(setq cscope-do-not-update-database t)




(provide 'init-startup)
