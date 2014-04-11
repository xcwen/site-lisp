;;; magit-autoloads.el --- automatically extracted autoloads
;;
;;; Code:


;;;### (autoloads (magit-run-gitk magit-run-git-gui-blame magit-run-git-gui
;;;;;;  magit-add-change-log-entry-other-window magit-add-change-log-entry
;;;;;;  magit-init magit-branch-manager magit-wazzup magit-diff-stash
;;;;;;  magit-diff-unstaged magit-diff-staged magit-diff-working-tree
;;;;;;  magit-diff magit-interactive-resolve magit-save-index magit-cherry
;;;;;;  magit-reflog-head magit-reflog magit-file-log magit-log-long-ranged
;;;;;;  magit-log-long magit-log-ranged magit-log magit-bisect-run
;;;;;;  magit-bisect-skip magit-bisect-bad magit-bisect-good magit-bisect-reset
;;;;;;  magit-bisect-start magit-submodule-sync magit-submodule-init
;;;;;;  magit-submodule-update-init magit-submodule-update magit-stash-snapshot
;;;;;;  magit-stash magit-delete-tag magit-tag magit-commit-squash
;;;;;;  magit-commit-fixup magit-commit-reword magit-commit-extend
;;;;;;  magit-commit-amend magit-commit magit-push magit-push-tags
;;;;;;  magit-pull magit-remote-update magit-fetch-current magit-fetch
;;;;;;  magit-reset-working-tree magit-reset-head-hard magit-reset-head
;;;;;;  magit-interactive-rebase magit-rename-remote magit-remove-remote
;;;;;;  magit-add-remote magit-rename-branch magit-delete-branch
;;;;;;  magit-create-branch magit-checkout magit-merge-abort magit-merge
;;;;;;  magit-show magit-dired-jump magit-unstage-all magit-stage-all
;;;;;;  magit-status magit-show-commit magit-git-command) "magit"
;;;;;;  "magit.el" (21318 22593))
;;; Generated autoloads from magit.el

(autoload 'magit-git-command "magit" "\
Execute a Git subcommand asynchronously, displaying the output.\nWith a prefix argument run Git in the root of the current\nrepository.  Non-interactively run Git in DIRECTORY with ARGS.\n\n(fn ARGS DIRECTORY)" t nil)

(autoload 'magit-show-commit "magit" "\
Show information about COMMIT.\n\n(fn COMMIT &optional NOSELECT)" t nil)

(autoload 'magit-status "magit" "\
Open a Magit status buffer for the Git repository containing DIR.\nIf DIR is not within a Git repository, offer to create a Git\nrepository in DIR.\n\nInteractively, a prefix argument means to ask the user which Git\nrepository to use even if `default-directory' is under Git\ncontrol.  Two prefix arguments means to ignore `magit-repo-dirs'\nwhen asking for user input.\n\nDepending on option `magit-status-buffer-switch-function' the\nstatus buffer is shown in another window (the default) or the\ncurrent window.  Non-interactively optional SWITCH-FUNCTION\ncan be used to override this.\n\n(fn DIR &optional SWITCH-FUNCTION)" t nil)

(autoload 'magit-stage-all "magit" "\
Add all remaining changes in tracked files to staging area.\nWith a prefix argument, add remaining untracked files as well.\n('git add [-u] .').\n\n(fn &optional INCLUDING-UNTRACKED)" t nil)

(autoload 'magit-unstage-all "magit" "\
Remove all changes from staging area.\n('git reset --mixed HEAD').\n\n(fn)" t nil)

(autoload 'magit-dired-jump "magit" "\
Visit current item in dired.\nWith a prefix argument, visit in other window.\n\n(fn &optional OTHER-WINDOW)" t nil)

(autoload 'magit-show "magit" "\
Display and select a buffer containing FILE as stored in REV.\n\nInsert the contents of FILE as stored in the revision REV into a\nbuffer.  Then select the buffer using `pop-to-buffer' or with a\nprefix argument using `switch-to-buffer'.  Non-interactivity use\nSWITCH-FUNCTION to switch to the buffer, if that is nil simply\nreturn the buffer, without displaying it.\n\n(fn REV FILE &optional SWITCH-FUNCTION)" t nil)

(autoload 'magit-merge "magit" "\
Merge REVISION into the current 'HEAD', leaving changes uncommitted.\nWith a prefix argument, skip editing the log message and commit.\n('git merge [--no-commit] REVISION').\n\n(fn REVISION &optional DO-COMMIT)" t nil)

(autoload 'magit-merge-abort "magit" "\
Abort the current merge operation.\n\n(fn)" t nil)

(autoload 'magit-checkout "magit" "\
Switch 'HEAD' to REVISION and update working tree.\nFails if working tree or staging area contain uncommitted changes.\nIf REVISION is a remote branch, offer to create a local tracking branch.\n('git checkout [-b] REVISION').\n\n(fn REVISION)" t nil)

(autoload 'magit-create-branch "magit" "\
Switch 'HEAD' to new BRANCH at revision PARENT and update working tree.\nFails if working tree or staging area contain uncommitted changes.\n('git checkout -b BRANCH REVISION').\n\n(fn BRANCH PARENT)" t nil)

(autoload 'magit-delete-branch "magit" "\
Delete the BRANCH.\nIf the branch is the current one, offers to switch to `master' first.\nWith prefix, forces the removal even if it hasn't been merged.\nWorks with local or remote branches.\n('git branch [-d|-D] BRANCH' or 'git push <remote-part-of-BRANCH> :refs/heads/BRANCH').\n\n(fn BRANCH &optional FORCE)" t nil)

(autoload 'magit-rename-branch "magit" "\
Rename branch OLD to NEW.\nWith prefix, forces the rename even if NEW already exists.\n('git branch [-m|-M] OLD NEW').\n\n(fn OLD NEW &optional FORCE)" t nil)

(autoload 'magit-add-remote "magit" "\
Add the REMOTE and fetch it.\n('git remote add REMOTE URL').\n\n(fn REMOTE URL)" t nil)

(autoload 'magit-remove-remote "magit" "\
Delete the REMOTE.\n('git remote rm REMOTE').\n\n(fn REMOTE)" t nil)

(autoload 'magit-rename-remote "magit" "\
Rename remote OLD to NEW.\n('git remote rename OLD NEW').\n\n(fn OLD NEW)" t nil)

(autoload 'magit-interactive-rebase "magit" "\
Start a git rebase -i session, old school-style.\n\n(fn COMMIT)" t nil)

(autoload 'magit-reset-head "magit" "\
Switch 'HEAD' to REVISION, keeping prior working tree and staging area.\nAny differences from REVISION become new changes to be committed.\nWith prefix argument, all uncommitted changes in working tree\nand staging area are lost.\n('git reset [--soft|--hard] REVISION').\n\n(fn REVISION &optional HARD)" t nil)

(autoload 'magit-reset-head-hard "magit" "\
Switch 'HEAD' to REVISION, losing all changes.\nUncomitted changes in both working tree and staging area are lost.\n('git reset --hard REVISION').\n\n(fn REVISION)" t nil)

(autoload 'magit-reset-working-tree "magit" "\
Revert working tree and clear changes from staging area.\n('git reset --hard HEAD').\n\nWith a prefix arg, also remove untracked files.\nWith two prefix args, remove ignored files as well.\n\n(fn &optional ARG)" t nil)

(autoload 'magit-fetch "magit" "\
Fetch from REMOTE.\n\n(fn REMOTE)" t nil)

(autoload 'magit-fetch-current "magit" "\
Run fetch for default remote.\n\nIf there is no default remote, ask for one.\n\n(fn)" t nil)

(autoload 'magit-remote-update "magit" "\
Update all remotes.\n\n(fn)" t nil)

(autoload 'magit-pull "magit" "\
Run git pull.\n\nIf there is no default remote, the user is prompted for one and\nits values is saved with git config.  If there is no default\nmerge branch, the user is prompted for one and its values is\nsaved with git config.  With a prefix argument, the default\nremote is not used and the user is prompted for a remote.  With\ntwo prefix arguments, the default merge branch is not used and\nthe user is prompted for a merge branch.  Values entered by the\nuser because of prefix arguments are not saved with git config.\n\n(fn)" t nil)

(autoload 'magit-push-tags "magit" "\
Push tags to a remote repository.\n\nPush tags to the current branch's remote.  If that isn't set push\nto \"origin\" or if that remote doesn't exit but only a single\nremote is defined use that.  Otherwise or with a prefix argument\nask the user what remote to use.\n\n(fn)" t nil)

(autoload 'magit-push "magit" "\
Push the current branch to a remote repository.\n\nThis command runs the `magit-push-remote' hook.  By default that\nmeans running `magit-push-dwim'.  So unless you have customized\nthe hook this command behaves like this:\n\nWith a single prefix argument ask the user what branch to push\nto.  With two or more prefix arguments also ask the user what\nremote to push to.  Otherwise use the remote and branch as\nconfigured using the Git variables `branch.<name>.remote' and\n`branch.<name>.merge'.  If the former is undefined ask the user.\nIf the latter is undefined push without specifing the remote\nbranch explicitly.\n\nAlso see option `magit-set-upstream-on-push'.\n\n(fn)" t nil)

(autoload 'magit-commit "magit" "\
Create a new commit on HEAD.\nWith a prefix argument amend to the commit at HEAD instead.\n('git commit [--amend]').\n\n(fn &optional AMENDP)" t nil)

(autoload 'magit-commit-amend "magit" "\
Amend the last commit.\n('git commit --amend').\n\n(fn)" t nil)

(autoload 'magit-commit-extend "magit" "\
Amend the last commit, without editing the message.\nWith a prefix argument do change the committer date, otherwise\ndon't.  The option `magit-commit-extend-override-date' can be\nused to inverse the meaning of the prefix argument.\n('git commit --no-edit --amend [--keep-date]').\n\n(fn &optional OVERRIDE-DATE)" t nil)

(autoload 'magit-commit-reword "magit" "\
Reword the last commit, ignoring staged changes.\n\nWith a prefix argument do change the committer date, otherwise\ndon't.  The option `magit-commit-rewrite-override-date' can be\nused to inverse the meaning of the prefix argument.\n\nNon-interactively respect the optional OVERRIDE-DATE argument\nand ignore the option.\n\n('git commit --only --amend').\n\n(fn &optional OVERRIDE-DATE)" t nil)

(autoload 'magit-commit-fixup "magit" "\
Create a fixup commit.\nWith a prefix argument the user is always queried for the commit\nto be fixed.  Otherwise the current or marked commit may be used\ndepending on the value of option `magit-commit-squash-commit'.\n('git commit [--no-edit] --fixup=COMMIT').\n\n(fn &optional COMMIT)" t nil)

(autoload 'magit-commit-squash "magit" "\
Create a squash commit.\nWith a prefix argument the user is always queried for the commit\nto be fixed.  Otherwise the current or marked commit may be used\ndepending on the value of option `magit-commit-squash-commit'.\n('git commit [--no-edit] --fixup=COMMIT').\n\n(fn &optional COMMIT FIXUP)" t nil)

(autoload 'magit-tag "magit" "\
Create a new tag with the given NAME at REV.\nWith a prefix argument annotate the tag.\n('git tag [--annotate] NAME REV').\n\n(fn NAME REV &optional ANNOTATE)" t nil)

(autoload 'magit-delete-tag "magit" "\
Delete the tag with the given NAME.\n('git tag -d NAME').\n\n(fn NAME)" t nil)

(autoload 'magit-stash "magit" "\
Create new stash of working tree and staging area named DESCRIPTION.\nWorking tree and staging area revert to the current 'HEAD'.\nWith prefix argument, changes in staging area are kept.\n('git stash save [--keep-index] DESCRIPTION')\n\n(fn DESCRIPTION)" t nil)

(autoload 'magit-stash-snapshot "magit" "\
Create new stash of working tree and staging area; keep changes in place.\n('git stash save \"Snapshot...\"; git stash apply stash@{0}')\n\n(fn)" t nil)

(autoload 'magit-submodule-update "magit" "\
Update the submodule of the current git repository.\nWith a prefix arg, do a submodule update --init.\n\n(fn &optional INIT)" t nil)

(autoload 'magit-submodule-update-init "magit" "\
Update and init the submodule of the current git repository.\n\n(fn)" t nil)

(autoload 'magit-submodule-init "magit" "\
Initialize the submodules.\n\n(fn)" t nil)

(autoload 'magit-submodule-sync "magit" "\
Synchronizes submodule's remote URL configuration.\n\n(fn)" t nil)

(autoload 'magit-bisect-start "magit" "\
Start a bisect session.\n\nBisecting a bug means to find the commit that introduced it.\nThis command starts such a bisect session by asking for a know\ngood and a bad commit.  To move the session forward use the\nother actions from the bisect popup (\\<magit-status-mode-map>\\[magit-key-mode-popup-bisecting]).\n\n(fn BAD GOOD)" t nil)

(autoload 'magit-bisect-reset "magit" "\
After bisecting cleanup bisection state and return to original HEAD.\n\n(fn)" t nil)

(autoload 'magit-bisect-good "magit" "\
While bisecting, mark the current commit as good.\nUse this after you have asserted that the commit does not contain\nthe bug in question.\n\n(fn)" t nil)

(autoload 'magit-bisect-bad "magit" "\
While bisecting, mark the current commit as bad.\nUse this after you have asserted that the commit does contain the\nbug in question.\n\n(fn)" t nil)

(autoload 'magit-bisect-skip "magit" "\
While bisecting, skip the current commit.\nUse this if for some reason the current commit is not a good one\nto test.  This command lets Git choose a different one.\n\n(fn)" t nil)

(autoload 'magit-bisect-run "magit" "\
Bisect automatically by running commands after each step.\n\n(fn CMDLINE)" t nil)

(autoload 'magit-log "magit" "\
\n\n(fn &optional RANGE)" t nil)

(autoload 'magit-log-ranged "magit" "\
\n\n(fn RANGE)" t nil)

(autoload 'magit-log-long "magit" "\
\n\n(fn &optional RANGE)" t nil)

(autoload 'magit-log-long-ranged "magit" "\
\n\n(fn RANGE)" t nil)

(autoload 'magit-file-log "magit" "\
Display the log for the currently visited file or another one.\nWith a prefix argument show the log graph.\n\n(fn FILE &optional USE-GRAPH)" t nil)

(autoload 'magit-reflog "magit" "\
Display the reflog of the current branch.\nWith a prefix argument another branch can be chosen.\n\n(fn REF)" t nil)

(autoload 'magit-reflog-head "magit" "\
Display the HEAD reflog.\n\n(fn)" t nil)

(autoload 'magit-cherry "magit" "\
Show commits in a branch that are not merged in the upstream branch.\n\n(fn HEAD UPSTREAM)" t nil)

(autoload 'magit-save-index "magit" "\
Add the content of current file as if it was the index.\n\n(fn)" t nil)

(autoload 'magit-interactive-resolve "magit" "\
Resolve a merge conflict using Ediff.\n\n(fn FILE)" t nil)

(autoload 'magit-diff "magit" "\
Show differences between in a range.\nYou can also show the changes in a single commit by omitting the\nrange end, but for that `magit-show-commit' is a better option.\n\n(fn RANGE &optional WORKING ARGS)" t nil)

(autoload 'magit-diff-working-tree "magit" "\
Show differences between a commit and the current working tree.\n\n(fn REV)" t nil)

(autoload 'magit-diff-staged "magit" "\
Show differences between the index and the HEAD commit.\n\n(fn)" t nil)

(autoload 'magit-diff-unstaged "magit" "\
Show differences between the current working tree and index.\n\n(fn)" t nil)

(autoload 'magit-diff-stash "magit" "\
Show changes in a stash.\nA Stash consist of more than just one commit.  This command uses\na special diff range so that the stashed changes actually were a\nsingle commit.\n\n(fn STASH &optional NOSELECT)" t nil)

(autoload 'magit-wazzup "magit" "\
Show a list of branches in a dedicated buffer.\nUnlike in the buffer created by `magit-branch-manager' each\nbranch can be expanded to show a list of commits not merged\ninto the selected branch.\n\n(fn BRANCH)" t nil)

(autoload 'magit-branch-manager "magit" "\
Show a list of branches in a dedicated buffer.\n\n(fn)" t nil)

(autoload 'magit-init "magit" "\
Create or reinitialize a Git repository.\nRead directory name and initialize it as new Git repository.\n\nIf the directory is below an existing repository, then the user\nhas to confirm that a new one should be created inside; or when\nthe directory is the root of the existing repository, whether\nit should be reinitialized.\n\nNon-interactively DIRECTORY is always (re-)initialized.\n\n(fn DIRECTORY)" t nil)

(autoload 'magit-add-change-log-entry "magit" "\
Find change log file and add date entry and item for current change.\nThis differs from `add-change-log-entry' (which see) in that\nit acts on the current hunk in a Magit buffer instead of on\na position in a file-visiting buffer.\n\n(fn &optional WHOAMI FILE-NAME OTHER-WINDOW)" t nil)

(autoload 'magit-add-change-log-entry-other-window "magit" "\
Find change log file in other window and add entry and item.\nThis differs from `add-change-log-entry-other-window' (which see)\nin that it acts on the current hunk in a Magit buffer instead of\non a position in a file-visiting buffer.\n\n(fn &optional WHOAMI FILE-NAME)" t nil)

(autoload 'magit-run-git-gui "magit" "\
Run `git gui' for the current git repository.\n\n(fn)" t nil)

(autoload 'magit-run-git-gui-blame "magit" "\
Run `git gui blame' on the given FILENAME and COMMIT.\nInteractively run it for the current file and the HEAD, with a\nprefix or when the current file cannot be determined let the user\nchoose.  When the current buffer is visiting FILENAME instruct\nblame to center around the line point is on.\n\n(fn COMMIT FILENAME &optional LINENUM)" t nil)

(autoload 'magit-run-gitk "magit" "\
Run Gitk for the current git repository.\nWithout a prefix argument run `gitk --all', with\na prefix argument run gitk without any arguments.\n\n(fn ARG)" t nil)

;;;***

;;;### (autoloads (magit-blame-mode) "magit-blame" "magit-blame.el"
;;;;;;  (21318 22593))
;;; Generated autoloads from magit-blame.el

(autoload 'magit-blame-mode "magit-blame" "\
Display blame information inline.\n\n(fn &optional ARG)" t nil)

;;;***

;;;### (autoloads nil "magit-key-mode" "magit-key-mode.el" (21318
;;;;;;  22593))
;;; Generated autoloads from magit-key-mode.el

(defvar magit-key-mode-groups '((dispatch (actions ("b" "Branching" magit-key-mode-popup-branching) ("B" "Bisecting" magit-key-mode-popup-bisecting) ("c" "Committing" magit-key-mode-popup-committing) ("d" "Diff worktree" magit-diff-working-tree) ("D" "Diff" magit-diff) ("f" "Fetching" magit-key-mode-popup-fetching) ("F" "Pulling" magit-key-mode-popup-pulling) ("g" "Refresh Buffers" magit-refresh-all) ("l" "Logging" magit-key-mode-popup-logging) ("m" "Merging" magit-key-mode-popup-merging) ("M" "Remoting" magit-key-mode-popup-remoting) ("P" "Pushing" magit-key-mode-popup-pushing) ("o" "Submoduling" magit-key-mode-popup-submodule) ("r" "Rewriting" magit-key-mode-popup-rewriting) ("R" "Rebasing" magit-rebase-step) ("s" "Show Status" magit-status) ("S" "Stage all" magit-stage-all) ("t" "Tagging" magit-key-mode-popup-tagging) ("U" "Unstage all" magit-unstage-all) ("v" "Show Commit" magit-show-commit) ("V" "Show File" magit-show) ("w" "Wazzup" magit-wazzup) ("X" "Reset worktree" magit-reset-working-tree) ("y" "Cherry" magit-cherry) ("z" "Stashing" magit-key-mode-popup-stashing) ("!" "Running" magit-key-mode-popup-running) ("$" "Show Process" magit-display-process))) (logging (man-page "git-log") (actions ("l" "Short" magit-log) ("L" "Long" magit-log-long) ("h" "Head Reflog" magit-reflog-head) ("f" "File log" magit-file-log) ("rl" "Ranged short" magit-log-ranged) ("rL" "Ranged long" magit-log-long-ranged) ("rh" "Reflog" magit-reflog)) (switches ("-m" "Only merge commits" "--merges") ("-do" "Date Order" "--date-order") ("-f" "First parent" "--first-parent") ("-i" "Case insensitive patterns" "-i") ("-pr" "Pickaxe regex" "--pickaxe-regex") ("-g" "Show Graph" "--graph") ("-n" "Name only" "--name-only") ("-am" "All match" "--all-match") ("-al" "All" "--all")) (arguments ("=r" "Relative" "--relative=" read-directory-name) ("=c" "Committer" "--committer=" read-from-minibuffer) ("=>" "Since" "--since=" read-from-minibuffer) ("=<" "Before" "--before=" read-from-minibuffer) ("=a" "Author" "--author=" read-from-minibuffer) ("=g" "Grep messages" "--grep=" read-from-minibuffer) ("=G" "Grep patches" "-G" read-from-minibuffer) ("=L" "Trace evolution of line range [long log only]" "-L" magit-read-file-trace) ("=s" "Pickaxe search" "-S" read-from-minibuffer) ("=b" "Branches" "--branches=" read-from-minibuffer) ("=R" "Remotes" "--remotes=" read-from-minibuffer))) (running (actions ("!" "Git Subcommand (from root)" magit-git-command-topdir) (":" "Git Subcommand (from pwd)" magit-git-command) ("g" "Git Gui" magit-run-git-gui) ("k" "Gitk" magit-run-gitk))) (fetching (man-page "git-fetch") (actions ("f" "Current" magit-fetch-current) ("a" "All" magit-remote-update) ("o" "Other" magit-fetch)) (switches ("-p" "Prune" "--prune"))) (pushing (man-page "git-push") (actions ("P" "Push" magit-push) ("t" "Push tags" magit-push-tags)) (switches ("-f" "Force" "--force") ("-d" "Dry run" "-n") ("-u" "Set upstream" "-u"))) (pulling (man-page "git-pull") (actions ("F" "Pull" magit-pull)) (switches ("-f" "Force" "--force") ("-r" "Rebase" "--rebase"))) (branching (man-page "git-branch") (actions ("v" "Branch manager" magit-branch-manager) ("b" "Checkout" magit-checkout) ("c" "Create" magit-create-branch) ("r" "Rename" magit-rename-branch) ("k" "Delete" magit-delete-branch)) (switches ("-t" "Set upstream configuration" "--track") ("-m" "Merged to HEAD" "--merged") ("-M" "Merged to master" "--merged=master") ("-n" "Not merged to HEAD" "--no-merged") ("-N" "Not merged to master" "--no-merged=master")) (arguments ("=c" "Contains" "--contains=" magit-read-rev-with-default) ("=m" "Merged" "--merged=" magit-read-rev-with-default) ("=n" "Not merged" "--no-merged=" magit-read-rev-with-default))) (remoting (man-page "git-remote") (actions ("v" "Remote manager" magit-branch-manager) ("a" "Add" magit-add-remote) ("r" "Rename" magit-rename-remote) ("k" "Remove" magit-remove-remote))) (tagging (man-page "git-tag") (actions ("t" "Create" magit-tag) ("k" "Delete" magit-delete-tag)) (switches ("-a" "Annotate" "--annotate") ("-f" "Force" "--force") ("-s" "Sign" "--sign"))) (stashing (man-page "git-stash") (actions ("v" "View" magit-diff-stash) ("z" "Save" magit-stash) ("s" "Snapshot" magit-stash-snapshot) ("a" "Apply" magit-stash-apply) ("p" "Pop" magit-stash-pop) ("k" "Drop" magit-stash-drop)) (switches ("-k" "Keep index" "--keep-index") ("-u" "Include untracked files" "--include-untracked") ("-a" "Include all files" "--all"))) (committing (man-page "git-commit") (actions ("c" "Commit" magit-commit) ("a" "Amend" magit-commit-amend) ("e" "Extend" magit-commit-extend) ("r" "Reword" magit-commit-reword) ("f" "Fixup" magit-commit-fixup) ("s" "Squash" magit-commit-squash)) (switches ("-a" "Stage all modified and deleted files" "--all") ("-e" "Allow empty commit" "--allow-empty") ("-v" "Show diff of changes to be committed" "--verbose") ("-n" "Bypass git hooks" "--no-verify") ("-s" "Add Signed-off-by line" "--signoff") ("-R" "Claim authorship and reset author date" "--reset-author")) (arguments ("=A" "Override the author" "--author=" read-from-minibuffer) ("=S" "Sign using gpg" "--gpg-sign=" magit-read-gpg-secret-key))) (merging (man-page "git-merge") (actions ("m" "Merge" magit-merge) ("A" "Abort" magit-merge-abort)) (switches ("-ff" "Fast-forward only" "--ff-only") ("-nf" "No fast-forward" "--no-ff") ("-sq" "Squash" "--squash")) (arguments ("-st" "Strategy" "--strategy=" read-from-minibuffer))) (rewriting (actions ("b" "Begin" magit-rewrite-start) ("s" "Stop" magit-rewrite-stop) ("a" "Abort" magit-rewrite-abort) ("f" "Finish" magit-rewrite-finish) ("d" "Diff pending" magit-rewrite-diff-pending) ("*" "Set unused" magit-rewrite-set-unused) ("." "Set used" magit-rewrite-set-used))) (apply-mailbox (man-page "git-am") (actions ("J" "Apply Mailbox" magit-apply-mailbox)) (switches ("-s" "add a Signed-off-by line to the commit message" "--signoff") ("-3" "allow fall back on 3way merging if needed" "--3way") ("-k" "pass -k flag to git-mailinfo" "--keep") ("-c" "strip everything before a scissors line" "--scissors") ("-p" "pass it through git-apply" "-p") ("-r" "override error message when patch failure occurs" "--resolvemsg") ("-d" "lie about committer date" "--committer-date-is-author-date") ("-D" "use current timestamp for author date" "--ignore-date") ("-b" "pass -b flag to git-mailinfo" "--keep-non-patch")) (arguments ("=p" "format the patch(es) are in" "--patch-format=" read-from-minibuffer))) (submodule (man-page "git-submodule") (actions ("u" "Update" magit-submodule-update) ("b" "Both update and init" magit-submodule-update-init) ("i" "Init" magit-submodule-init) ("s" "Sync" magit-submodule-sync))) (bisecting (man-page "git-bisect") (actions ("b" "Bad" magit-bisect-bad) ("g" "Good" magit-bisect-good) ("k" "Skip" magit-bisect-skip) ("r" "Reset" magit-bisect-reset) ("s" "Start" magit-bisect-start) ("u" "Run" magit-bisect-run))) (diff-options (actions ("s" "Set" magit-set-diff-options) ("d" "Set default" magit-set-default-diff-options) ("c" "Save default" magit-save-default-diff-options) ("r" "Reset to default" magit-reset-diff-options) ("h" "Toggle Hunk Refinement" magit-diff-toggle-refine-hunk)) (switches ("-m" "Show smallest possible diff" "--minimal") ("-p" "Use patience diff algorithm" "--patience") ("-h" "Use histogram diff algorithm" "--histogram") ("-b" "Ignore whitespace changes" "--ignore-space-change") ("-w" "Ignore all whitespace" "--ignore-all-space") ("-W" "Show surrounding functions" "--function-context")))) "\
Holds the key, help, function mapping for the log-mode.\nIf you modify this make sure you reset `magit-key-mode-keymaps'\nto nil.")
 (mapc (lambda (g) (eval `(autoload ',(intern (concat "magit-key-mode-popup-" (symbol-name (car g)))) "magit-key-mode" ,(concat "Key menu for " (symbol-name (car g))) t))) magit-key-mode-groups)

;;;***

;;;### (autoloads (global-magit-wip-save-mode magit-wip-save-mode)
;;;;;;  "magit-wip" "magit-wip.el" (21318 22593))
;;; Generated autoloads from magit-wip.el

(autoload 'magit-wip-save-mode "magit-wip" "\
Magit support for committing to a work-in-progress ref.\n\nWhen this minor mode is turned on and a file is saved inside a\nwritable git repository then it is also committed to a special\nwork-in-progress ref.\n\n(fn &optional ARG)" t nil)

(defvar global-magit-wip-save-mode nil "\
Non-nil if Global-Magit-Wip-Save mode is enabled.\nSee the command `global-magit-wip-save-mode' for a description of this minor mode.\nSetting this variable directly does not take effect;\neither customize it (see the info node `Easy Customization')\nor call the function `global-magit-wip-save-mode'.")

(custom-autoload 'global-magit-wip-save-mode "magit-wip" nil)

(autoload 'global-magit-wip-save-mode "magit-wip" "\
Toggle Magit-Wip-Save mode in all buffers.\nWith prefix ARG, enable Global-Magit-Wip-Save mode if ARG is positive;\notherwise, disable it.  If called from Lisp, enable the mode if\nARG is omitted or nil.\n\nMagit-Wip-Save mode is enabled in all buffers where\n`turn-on-magit-wip-save' would do it.\nSee `magit-wip-save-mode' for more information on Magit-Wip-Save mode.\n\n(fn &optional ARG)" t nil)

;;;***

;;;### (autoloads nil nil ("magit-pkg.el") (21318 22593 552712))

;;;***

(provide 'magit-autoloads)
;; Local Variables:
;; version-control: never
;; no-byte-compile: t
;; no-update-autoloads: t
;; coding: utf-8
;; End:
;;; magit-autoloads.el ends here
