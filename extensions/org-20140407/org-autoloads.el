;;; org-autoloads.el --- automatically extracted autoloads
;;
;;; Code:


;;;### (autoloads (org-customize org-reload org-submit-bug-report
;;;;;;  org-cycle-agenda-files org-switchb org-open-link-from-string
;;;;;;  org-open-at-point-global org-insert-link-global org-store-link
;;;;;;  org-run-like-in-org-mode turn-on-orgstruct++ turn-on-orgstruct
;;;;;;  orgstruct-mode org-global-cycle org-cycle org-mode org-clock-persistence-insinuate
;;;;;;  turn-on-orgtbl org-version org-babel-load-file org-babel-do-load-languages)
;;;;;;  "org" "org.el" (21318 22550))
;;; Generated autoloads from org.el

(autoload 'org-babel-do-load-languages "org" "\
Load the languages defined in `org-babel-load-languages'.\n\n(fn SYM VALUE)" nil nil)

(autoload 'org-babel-load-file "org" "\
Load Emacs Lisp source code blocks in the Org-mode FILE.\nThis function exports the source code using `org-babel-tangle'\nand then loads the resulting file using `load-file'.  With prefix\narg (noninteractively: 2nd arg) COMPILE the tangled Emacs Lisp\nfile to byte-code before it is loaded.\n\n(fn FILE &optional COMPILE)" t nil)

(autoload 'org-version "org" "\
Show the org-mode version in the echo area.\nWith prefix argument HERE, insert it at point.\nWhen FULL is non-nil, use a verbose version string.\nWhen MESSAGE is non-nil, display a message with the version.\n\n(fn &optional HERE FULL MESSAGE)" t nil)

(autoload 'turn-on-orgtbl "org" "\
Unconditionally turn on `orgtbl-mode'.\n\n(fn)" nil nil)

(autoload 'org-clock-persistence-insinuate "org" "\
Set up hooks for clock persistence.\n\n(fn)" nil nil)

(autoload 'org-mode "org" "\
Outline-based notes management and organizer, alias\n\"Carsten's outline-mode for keeping track of everything.\"\n\nOrg-mode develops organizational tasks around a NOTES file which\ncontains information about projects as plain text.  Org-mode is\nimplemented on top of outline-mode, which is ideal to keep the content\nof large files well structured.  It supports ToDo items, deadlines and\ntime stamps, which magically appear in the diary listing of the Emacs\ncalendar.  Tables are easily created with a built-in table editor.\nPlain text URL-like links connect to websites, emails (VM), Usenet\nmessages (Gnus), BBDB entries, and any files related to the project.\nFor printing and sharing of notes, an Org-mode file (or a part of it)\ncan be exported as a structured ASCII or HTML file.\n\nThe following commands are available:\n\n\\{org-mode-map}\n\n(fn)" t nil)

(autoload 'org-cycle "org" "\
TAB-action and visibility cycling for Org-mode.\n\nThis is the command invoked in Org-mode by the TAB key.  Its main purpose\nis outline visibility cycling, but it also invokes other actions\nin special contexts.\n\n- When this function is called with a prefix argument, rotate the entire\n  buffer through 3 states (global cycling)\n  1. OVERVIEW: Show only top-level headlines.\n  2. CONTENTS: Show all headlines of all levels, but no body text.\n  3. SHOW ALL: Show everything.\n  When called with two `C-u C-u' prefixes, switch to the startup visibility,\n  determined by the variable `org-startup-folded', and by any VISIBILITY\n  properties in the buffer.\n  When called with three `C-u C-u C-u' prefixed, show the entire buffer,\n  including any drawers.\n\n- When inside a table, re-align the table and move to the next field.\n\n- When point is at the beginning of a headline, rotate the subtree started\n  by this line through 3 different states (local cycling)\n  1. FOLDED:   Only the main headline is shown.\n  2. CHILDREN: The main headline and the direct children are shown.\n               From this state, you can move to one of the children\n               and zoom in further.\n  3. SUBTREE:  Show the entire subtree, including body text.\n  If there is no subtree, switch directly from CHILDREN to FOLDED.\n\n- When point is at the beginning of an empty headline and the variable\n  `org-cycle-level-after-item/entry-creation' is set, cycle the level\n  of the headline by demoting and promoting it to likely levels.  This\n  speeds up creation document structure by pressing TAB once or several\n  times right after creating a new headline.\n\n- When there is a numeric prefix, go up to a heading with level ARG, do\n  a `show-subtree' and return to the previous cursor position.  If ARG\n  is negative, go up that many levels.\n\n- When point is not at the beginning of a headline, execute the global\n  binding for TAB, which is re-indenting the line.  See the option\n  `org-cycle-emulate-tab' for details.\n\n- Special case: if point is at the beginning of the buffer and there is\n  no headline in line 1, this function will act as if called with prefix arg\n  (C-u TAB, same as S-TAB) also when called without prefix arg.\n  But only if also the variable `org-cycle-global-at-bob' is t.\n\n(fn &optional ARG)" t nil)

(autoload 'org-global-cycle "org" "\
Cycle the global visibility.  For details see `org-cycle'.\nWith \\[universal-argument] prefix arg, switch to startup visibility.\nWith a numeric prefix, show all headlines up to that level.\n\n(fn &optional ARG)" t nil)
(put 'orgstruct-heading-prefix-regexp 'safe-local-variable 'stringp)

(autoload 'orgstruct-mode "org" "\
Toggle the minor mode `orgstruct-mode'.\nThis mode is for using Org-mode structure commands in other\nmodes.  The following keys behave as if Org-mode were active, if\nthe cursor is on a headline, or on a plain list item (both as\ndefined by Org-mode).\n\n(fn &optional ARG)" t nil)

(autoload 'turn-on-orgstruct "org" "\
Unconditionally turn on `orgstruct-mode'.\n\n(fn)" nil nil)

(autoload 'turn-on-orgstruct++ "org" "\
Unconditionally turn on `orgstruct++-mode'.\n\n(fn)" nil nil)

(autoload 'org-run-like-in-org-mode "org" "\
Run a command, pretending that the current buffer is in Org-mode.\nThis will temporarily bind local variables that are typically bound in\nOrg-mode to the values they have in Org-mode, and then interactively\ncall CMD.\n\n(fn CMD)" nil nil)

(autoload 'org-store-link "org" "\
\\<org-mode-map>Store an org-link to the current location.\nThis link is added to `org-stored-links' and can later be inserted\ninto an org-buffer with \\[org-insert-link].\n\nFor some link types, a prefix arg is interpreted.\nFor links to Usenet articles, arg negates `org-gnus-prefer-web-links'.\nFor file links, arg negates `org-context-in-file-links'.\n\nA double prefix arg force skipping storing functions that are not\npart of Org's core.\n\nA triple prefix arg force storing a link for each line in the\nactive region.\n\n(fn ARG)" t nil)

(autoload 'org-insert-link-global "org" "\
Insert a link like Org-mode does.\nThis command can be called in any mode to insert a link in Org-mode syntax.\n\n(fn)" t nil)

(autoload 'org-open-at-point-global "org" "\
Follow a link like Org-mode does.\nThis command can be called in any mode to follow a link that has\nOrg-mode syntax.\n\n(fn)" t nil)

(autoload 'org-open-link-from-string "org" "\
Open a link in the string S, as if it was in Org-mode.\n\n(fn S &optional ARG REFERENCE-BUFFER)" t nil)

(autoload 'org-switchb "org" "\
Switch between Org buffers.\nWith one prefix argument, restrict available buffers to files.\nWith two prefix arguments, restrict available buffers to agenda files.\n\nDefaults to `iswitchb' for buffer name completion.\nSet `org-completion-use-ido' to make it use ido instead.\n\n(fn &optional ARG)" t nil)

(defalias 'org-ido-switchb 'org-switchb)

(defalias 'org-iswitchb 'org-switchb)

(autoload 'org-cycle-agenda-files "org" "\
Cycle through the files in `org-agenda-files'.\nIf the current buffer visits an agenda file, find the next one in the list.\nIf the current buffer does not, find the first agenda file.\n\n(fn)" t nil)

(autoload 'org-submit-bug-report "org" "\
Submit a bug report on Org-mode via mail.\n\nDon't hesitate to report any problems or inaccurate documentation.\n\nIf you don't have setup sending mail from (X)Emacs, please copy the\noutput buffer into your mail program, as it gives us important\ninformation about your Org-mode version and configuration.\n\n(fn)" t nil)

(autoload 'org-reload "org" "\
Reload all org lisp files.\nWith prefix arg UNCOMPILED, load the uncompiled versions.\n\n(fn &optional UNCOMPILED)" t nil)

(autoload 'org-customize "org" "\
Call the customize function with org as argument.\n\n(fn)" t nil)

;;;***

;;;### (autoloads (org-agenda-to-appt org-calendar-goto-agenda org-agenda-set-restriction-lock
;;;;;;  org-agenda-check-for-timestamp-as-reason-to-ignore-todo-item
;;;;;;  org-diary org-agenda-list-stuck-projects org-tags-view org-todo-list
;;;;;;  org-search-view org-agenda-list org-batch-store-agenda-views
;;;;;;  org-store-agenda-views org-batch-agenda-csv org-batch-agenda
;;;;;;  org-agenda org-toggle-sticky-agenda) "org-agenda" "org-agenda.el"
;;;;;;  (21318 22548))
;;; Generated autoloads from org-agenda.el

(autoload 'org-toggle-sticky-agenda "org-agenda" "\
Toggle `org-agenda-sticky'.\n\n(fn &optional ARG)" t nil)

(autoload 'org-agenda "org-agenda" "\
Dispatch agenda commands to collect entries to the agenda buffer.\nPrompts for a command to execute.  Any prefix arg will be passed\non to the selected command.  The default selections are:\n\na     Call `org-agenda-list' to display the agenda for current day or week.\nt     Call `org-todo-list' to display the global todo list.\nT     Call `org-todo-list' to display the global todo list, select only\n      entries with a specific TODO keyword (the user gets a prompt).\nm     Call `org-tags-view' to display headlines with tags matching\n      a condition  (the user is prompted for the condition).\nM     Like `m', but select only TODO entries, no ordinary headlines.\nL     Create a timeline for the current buffer.\ne     Export views to associated files.\ns     Search entries for keywords.\nS     Search entries for keywords, only with TODO keywords.\n/     Multi occur across all agenda files and also files listed\n      in `org-agenda-text-search-extra-files'.\n<     Restrict agenda commands to buffer, subtree, or region.\n      Press several times to get the desired effect.\n>     Remove a previous restriction.\n#     List \"stuck\" projects.\n!     Configure what \"stuck\" means.\nC     Configure custom agenda commands.\n\nMore commands can be added by configuring the variable\n`org-agenda-custom-commands'.  In particular, specific tags and TODO keyword\nsearches can be pre-defined in this way.\n\nIf the current buffer is in Org-mode and visiting a file, you can also\nfirst press `<' once to indicate that the agenda should be temporarily\n(until the next use of \\[org-agenda]) restricted to the current file.\nPressing `<' twice means to restrict to the current subtree or region\n(if active).\n\n(fn &optional ARG ORG-KEYS RESTRICTION)" t nil)

(autoload 'org-batch-agenda "org-agenda" "\
Run an agenda command in batch mode and send the result to STDOUT.\nIf CMD-KEY is a string of length 1, it is used as a key in\n`org-agenda-custom-commands' and triggers this command.  If it is a\nlonger string it is used as a tags/todo match string.\nParameters are alternating variable names and values that will be bound\nbefore running the agenda command.\n\n(fn CMD-KEY &rest PARAMETERS)" nil (quote macro))

(autoload 'org-batch-agenda-csv "org-agenda" "\
Run an agenda command in batch mode and send the result to STDOUT.\nIf CMD-KEY is a string of length 1, it is used as a key in\n`org-agenda-custom-commands' and triggers this command.  If it is a\nlonger string it is used as a tags/todo match string.\nParameters are alternating variable names and values that will be bound\nbefore running the agenda command.\n\nThe output gives a line for each selected agenda item.  Each\nitem is a list of comma-separated values, like this:\n\ncategory,head,type,todo,tags,date,time,extra,priority-l,priority-n\n\ncategory     The category of the item\nhead         The headline, without TODO kwd, TAGS and PRIORITY\ntype         The type of the agenda entry, can be\n                todo               selected in TODO match\n                tagsmatch          selected in tags match\n                diary              imported from diary\n                deadline           a deadline on given date\n                scheduled          scheduled on given date\n                timestamp          entry has timestamp on given date\n                closed             entry was closed on given date\n                upcoming-deadline  warning about deadline\n                past-scheduled     forwarded scheduled item\n                block              entry has date block including g. date\ntodo         The todo keyword, if any\ntags         All tags including inherited ones, separated by colons\ndate         The relevant date, like 2007-2-14\ntime         The time, like 15:00-16:50\nextra        Sting with extra planning info\npriority-l   The priority letter if any was given\npriority-n   The computed numerical priority\nagenda-day   The day in the agenda where this is listed\n\n(fn CMD-KEY &rest PARAMETERS)" nil (quote macro))

(autoload 'org-store-agenda-views "org-agenda" "\
Store agenda views.\n\n(fn &rest PARAMETERS)" t nil)

(autoload 'org-batch-store-agenda-views "org-agenda" "\
Run all custom agenda commands that have a file argument.\n\n(fn &rest PARAMETERS)" nil (quote macro))

(autoload 'org-agenda-list "org-agenda" "\
Produce a daily/weekly view from all files in variable `org-agenda-files'.\nThe view will be for the current day or week, but from the overview buffer\nyou will be able to go to other days/weeks.\n\nWith a numeric prefix argument in an interactive call, the agenda will\nspan ARG days.  Lisp programs should instead specify SPAN to change\nthe number of days.  SPAN defaults to `org-agenda-span'.\n\nSTART-DAY defaults to TODAY, or to the most recent match for the weekday\ngiven in `org-agenda-start-on-weekday'.\n\nWhen WITH-HOUR is non-nil, only include scheduled and deadline\nitems if they have an hour specification like [h]h:mm.\n\n(fn &optional ARG START-DAY SPAN WITH-HOUR)" t nil)

(autoload 'org-search-view "org-agenda" "\
Show all entries that contain a phrase or words or regular expressions.\n\nWith optional prefix argument TODO-ONLY, only consider entries that are\nTODO entries.  The argument STRING can be used to pass a default search\nstring into this function.  If EDIT-AT is non-nil, it means that the\nuser should get a chance to edit this string, with cursor at position\nEDIT-AT.\n\nThe search string can be viewed either as a phrase that should be found as\nis, or it can be broken into a number of snippets, each of which must match\nin a Boolean way to select an entry.  The default depends on the variable\n`org-agenda-search-view-always-boolean'.\nEven if this is turned off (the default) you can always switch to\nBoolean search dynamically by preceding the first word with  \"+\" or \"-\".\n\nThe default is a direct search of the whole phrase, where each space in\nthe search string can expand to an arbitrary amount of whitespace,\nincluding newlines.\n\nIf using a Boolean search, the search string is split on whitespace and\neach snippet is searched separately, with logical AND to select an entry.\nWords prefixed with a minus must *not* occur in the entry.  Words without\na prefix or prefixed with a plus must occur in the entry.  Matching is\ncase-insensitive.  Words are enclosed by word delimiters (i.e. they must\nmatch whole words, not parts of a word) if\n`org-agenda-search-view-force-full-words' is set (default is nil).\n\nBoolean search snippets enclosed by curly braces are interpreted as\nregular expressions that must or (when preceded with \"-\") must not\nmatch in the entry.  Snippets enclosed into double quotes will be taken\nas a whole, to include whitespace.\n\n- If the search string starts with an asterisk, search only in headlines.\n- If (possibly after the leading star) the search string starts with an\n  exclamation mark, this also means to look at TODO entries only, an effect\n  that can also be achieved with a prefix argument.\n- If (possibly after star and exclamation mark) the search string starts\n  with a colon, this will mean that the (non-regexp) snippets of the\n  Boolean search must match as full words.\n\nThis command searches the agenda files, and in addition the files listed\nin `org-agenda-text-search-extra-files'.\n\n(fn &optional TODO-ONLY STRING EDIT-AT)" t nil)

(autoload 'org-todo-list "org-agenda" "\
Show all (not done) TODO entries from all agenda file in a single list.\nThe prefix arg can be used to select a specific TODO keyword and limit\nthe list to these.  When using \\[universal-argument], you will be prompted\nfor a keyword.  A numeric prefix directly selects the Nth keyword in\n`org-todo-keywords-1'.\n\n(fn &optional ARG)" t nil)

(autoload 'org-tags-view "org-agenda" "\
Show all headlines for all `org-agenda-files' matching a TAGS criterion.\nThe prefix arg TODO-ONLY limits the search to TODO entries.\n\n(fn &optional TODO-ONLY MATCH)" t nil)

(autoload 'org-agenda-list-stuck-projects "org-agenda" "\
Create agenda view for projects that are stuck.\nStuck projects are project that have no next actions.  For the definitions\nof what a project is and how to check if it stuck, customize the variable\n`org-stuck-projects'.\n\n(fn &rest IGNORE)" t nil)

(autoload 'org-diary "org-agenda" "\
Return diary information from org files.\nThis function can be used in a \"sexp\" diary entry in the Emacs calendar.\nIt accesses org files and extracts information from those files to be\nlisted in the diary.  The function accepts arguments specifying what\nitems should be listed.  For a list of arguments allowed here, see the\nvariable `org-agenda-entry-types'.\n\nThe call in the diary file should look like this:\n\n   &%%(org-diary) ~/path/to/some/orgfile.org\n\nUse a separate line for each org file to check.  Or, if you omit the file name,\nall files listed in `org-agenda-files' will be checked automatically:\n\n   &%%(org-diary)\n\nIf you don't give any arguments (as in the example above), the default value\nof `org-agenda-entry-types' is used: (:deadline :scheduled :timestamp :sexp).\nSo the example above may also be written as\n\n   &%%(org-diary :deadline :timestamp :sexp :scheduled)\n\nThe function expects the lisp variables `entry' and `date' to be provided\nby the caller, because this is how the calendar works.  Don't use this\nfunction from a program - use `org-agenda-get-day-entries' instead.\n\n(fn &rest ARGS)" nil nil)

(autoload 'org-agenda-check-for-timestamp-as-reason-to-ignore-todo-item "org-agenda" "\
Do we have a reason to ignore this TODO entry because it has a time stamp?\n\n(fn &optional END)" nil nil)

(autoload 'org-agenda-set-restriction-lock "org-agenda" "\
Set restriction lock for agenda, to current subtree or file.\nRestriction will be the file if TYPE is `file', or if type is the\nuniversal prefix '(4), or if the cursor is before the first headline\nin the file.  Otherwise, restriction will be to the current subtree.\n\n(fn &optional TYPE)" t nil)

(autoload 'org-calendar-goto-agenda "org-agenda" "\
Compute the Org-mode agenda for the calendar date displayed at the cursor.\nThis is a command that has to be installed in `calendar-mode-map'.\n\n(fn)" t nil)

(autoload 'org-agenda-to-appt "org-agenda" "\
Activate appointments found in `org-agenda-files'.\nWith a \\[universal-argument] prefix, refresh the list of\nappointments.\n\nIf FILTER is t, interactively prompt the user for a regular\nexpression, and filter out entries that don't match it.\n\nIf FILTER is a string, use this string as a regular expression\nfor filtering entries out.\n\nIf FILTER is a function, filter out entries against which\ncalling the function returns nil.  This function takes one\nargument: an entry from `org-agenda-get-day-entries'.\n\nFILTER can also be an alist with the car of each cell being\neither 'headline or 'category.  For example:\n\n  '((headline \"IMPORTANT\")\n    (category \"Work\"))\n\nwill only add headlines containing IMPORTANT or headlines\nbelonging to the \"Work\" category.\n\nARGS are symbols indicating what kind of entries to consider.\nBy default `org-agenda-to-appt' will use :deadline*, :scheduled*\n(i.e., deadlines and scheduled items with a hh:mm specification)\nand :timestamp entries.  See the docstring of `org-diary' for\ndetails and examples.\n\nIf an entry has a APPT_WARNTIME property, its value will be used\nto override `appt-message-warning-time'.\n\n(fn &optional REFRESH FILTER &rest ARGS)" t nil)

;;;***

;;;### (autoloads (org-capture-import-remember-templates org-capture
;;;;;;  org-capture-string) "org-capture" "org-capture.el" (21318
;;;;;;  22549))
;;; Generated autoloads from org-capture.el

(autoload 'org-capture-string "org-capture" "\
Capture STRING with the template selected by KEYS.\n\n(fn STRING &optional KEYS)" t nil)

(autoload 'org-capture "org-capture" "\
Capture something.\n\\<org-capture-mode-map>\nThis will let you select a template from `org-capture-templates', and then\nfile the newly captured information.  The text is immediately inserted\nat the target location, and an indirect buffer is shown where you can\nedit it.  Pressing \\[org-capture-finalize] brings you back to the previous state\nof Emacs, so that you can continue your work.\n\nWhen called interactively with a \\[universal-argument] prefix argument GOTO, don't capture\nanything, just go to the file/headline where the selected template\nstores its notes.  With a double prefix argument \\[universal-argument] \\[universal-argument], go to the last note\nstored.\n\nWhen called with a `C-0' (zero) prefix, insert a template at point.\n\nELisp programs can set KEYS to a string associated with a template\nin `org-capture-templates'.  In this case, interactive selection\nwill be bypassed.\n\nIf `org-capture-use-agenda-date' is non-nil, capturing from the\nagenda will use the date at point as the default date.  Then, a\n`C-1' prefix will tell the capture process to use the HH:MM time\nof the day at point (if any) or the current HH:MM time.\n\n(fn &optional GOTO KEYS)" t nil)

(autoload 'org-capture-import-remember-templates "org-capture" "\
Set `org-capture-templates' to be similar to `org-remember-templates'.\n\n(fn)" t nil)

;;;***

;;;### (autoloads (org-agenda-columns org-insert-columns-dblock org-dblock-write:columnview
;;;;;;  org-columns-number-to-string org-columns-compute org-columns
;;;;;;  org-columns-get-format-and-top-level org-columns-remove-overlays)
;;;;;;  "org-colview" "org-colview.el" (21318 22548))
;;; Generated autoloads from org-colview.el

(autoload 'org-columns-remove-overlays "org-colview" "\
Remove all currently active column overlays.\n\n(fn)" t nil)

(autoload 'org-columns-get-format-and-top-level "org-colview" "\
\n\n(fn)" nil nil)

(autoload 'org-columns "org-colview" "\
Turn on column view on an org-mode file.\nWhen COLUMNS-FMT-STRING is non-nil, use it as the column format.\n\n(fn &optional COLUMNS-FMT-STRING)" t nil)

(autoload 'org-columns-compute "org-colview" "\
Sum the values of property PROPERTY hierarchically, for the entire buffer.\n\n(fn PROPERTY)" t nil)

(autoload 'org-columns-number-to-string "org-colview" "\
Convert a computed column number to a string value, according to FMT.\n\n(fn N FMT &optional PRINTF)" nil nil)

(autoload 'org-dblock-write:columnview "org-colview" "\
Write the column view table.\nPARAMS is a property list of parameters:\n\n:width    enforce same column widths with <N> specifiers.\n:id       the :ID: property of the entry where the columns view\n	  should be built.  When the symbol `local', call locally.\n	  When `global' call column view with the cursor at the beginning\n	  of the buffer (usually this means that the whole buffer switches\n	  to column view).  When \"file:path/to/file.org\", invoke column\n	  view at the start of that file.  Otherwise, the ID is located\n	  using `org-id-find'.\n:hlines   When t, insert a hline before each item.  When a number, insert\n	  a hline before each level <= that number.\n:vlines   When t, make each column a colgroup to enforce vertical lines.\n:maxlevel When set to a number, don't capture headlines below this level.\n:skip-empty-rows\n	  When t, skip rows where all specifiers other than ITEM are empty.\n:format   When non-nil, specify the column view format to use.\n\n(fn PARAMS)" nil nil)

(autoload 'org-insert-columns-dblock "org-colview" "\
Create a dynamic block capturing a column view table.\n\n(fn)" t nil)

(autoload 'org-agenda-columns "org-colview" "\
Turn on or update column view in the agenda.\n\n(fn)" t nil)

;;;***

;;;### (autoloads (org-check-version) "org-compat" "org-compat.el"
;;;;;;  (21318 22547))
;;; Generated autoloads from org-compat.el

(autoload 'org-check-version "org-compat" "\
Try very hard to provide sensible version strings.\n\n(fn)" nil (quote macro))

;;;***

;;;### (autoloads (org-load-noerror-mustsuffix) "org-macs" "org-macs.el"
;;;;;;  (21318 22549))
;;; Generated autoloads from org-macs.el

(autoload 'org-load-noerror-mustsuffix "org-macs" "\
Load FILE with optional arguments NOERROR and MUSTSUFFIX.  Drop the MUSTSUFFIX argument for XEmacs, which doesn't recognize it.\n\n(fn FILE)" nil (quote macro))

;;;***

;;;### (autoloads (org-git-version org-release) "org-version" "org-version.el"
;;;;;;  (21318 22550))
;;; Generated autoloads from org-version.el

(autoload 'org-release "org-version" "\
The release version of org-mode.\n  Inserted by installing org-mode or when a release is made.\n\n(fn)" nil nil)

(autoload 'org-git-version "org-version" "\
The Git version of org-mode.\n  Inserted by installing org-mode or when a release is made.\n\n(fn)" nil nil)

(defvar org-odt-data-dir "/usr/share/emacs/etc/org" "\
The location of ODT styles.")

;;;***

;;;### (autoloads nil nil ("ob-C.el" "ob-R.el" "ob-asymptote.el"
;;;;;;  "ob-awk.el" "ob-calc.el" "ob-clojure.el" "ob-comint.el" "ob-core.el"
;;;;;;  "ob-css.el" "ob-ditaa.el" "ob-dot.el" "ob-emacs-lisp.el"
;;;;;;  "ob-eval.el" "ob-exp.el" "ob-fortran.el" "ob-gnuplot.el"
;;;;;;  "ob-haskell.el" "ob-io.el" "ob-java.el" "ob-js.el" "ob-keys.el"
;;;;;;  "ob-latex.el" "ob-ledger.el" "ob-lilypond.el" "ob-lisp.el"
;;;;;;  "ob-lob.el" "ob-makefile.el" "ob-matlab.el" "ob-maxima.el"
;;;;;;  "ob-mscgen.el" "ob-ocaml.el" "ob-octave.el" "ob-org.el" "ob-perl.el"
;;;;;;  "ob-picolisp.el" "ob-plantuml.el" "ob-python.el" "ob-ref.el"
;;;;;;  "ob-ruby.el" "ob-sass.el" "ob-scala.el" "ob-scheme.el" "ob-screen.el"
;;;;;;  "ob-sh.el" "ob-shen.el" "ob-sql.el" "ob-sqlite.el" "ob-table.el"
;;;;;;  "ob-tangle.el" "ob.el" "org-archive.el" "org-attach.el" "org-bbdb.el"
;;;;;;  "org-bibtex.el" "org-clock.el" "org-crypt.el" "org-ctags.el"
;;;;;;  "org-datetree.el" "org-docview.el" "org-element.el" "org-entities.el"
;;;;;;  "org-eshell.el" "org-faces.el" "org-feed.el" "org-footnote.el"
;;;;;;  "org-gnus.el" "org-habit.el" "org-id.el" "org-indent.el"
;;;;;;  "org-info.el" "org-inlinetask.el" "org-install.el" "org-irc.el"
;;;;;;  "org-list.el" "org-loaddefs.el" "org-macro.el" "org-mhe.el"
;;;;;;  "org-mobile.el" "org-mouse.el" "org-pcomplete.el" "org-pkg.el"
;;;;;;  "org-plot.el" "org-protocol.el" "org-rmail.el" "org-src.el"
;;;;;;  "org-table.el" "org-timer.el" "org-w3m.el" "ox-ascii.el"
;;;;;;  "ox-beamer.el" "ox-html.el" "ox-icalendar.el" "ox-latex.el"
;;;;;;  "ox-man.el" "ox-md.el" "ox-odt.el" "ox-org.el" "ox-publish.el"
;;;;;;  "ox-texinfo.el" "ox.el") (21318 22551 639120))

;;;***

(provide 'org-autoloads)
;; Local Variables:
;; version-control: never
;; no-byte-compile: t
;; no-update-autoloads: t
;; coding: utf-8
;; End:
;;; org-autoloads.el ends here
