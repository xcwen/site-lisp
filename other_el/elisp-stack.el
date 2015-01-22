;; elisp  stack jump back
(defvar el-stack-location-stack-index 0)
(defvar el-stack-location-stack nil)

(defvar el-stack-max-bookmark-count 500 )
(defun el-stack-location-stack-push ()
  (let ((bm (el-stack-current-location)))
    (while (> el-stack-location-stack-index 0)
      (decf el-stack-location-stack-index)
      (pop el-stack-location-stack))
    (unless (string= bm (nth 0 el-stack-location-stack))
      (push bm el-stack-location-stack)
      (if (> (length el-stack-location-stack) el-stack-max-bookmark-count)
          (nbutlast el-stack-location-stack (- (length el-stack-location-stack) el-stack-max-bookmark-count))))))


(defun el-stack-goto-line-col (line column)
  (goto-char (point-min))
  (forward-line (1- line))
  (beginning-of-line)
  (forward-char (1- column)))

(defun el-stack-current-location (&optional offset)
  (format "%s:%d:%d" (or (buffer-file-name) (buffer-name))
          (line-number-at-pos offset) (1+ (- (or offset (point)) (point-at-bol)))))

(defun el-stack-find-file-or-buffer (file-or-buffer &optional other-window)
  (if (file-exists-p file-or-buffer)
      (if other-window
          (find-file-other-window file-or-buffer)
        (find-file file-or-buffer))
    (let ((buf (get-buffer file-or-buffer)))
      (cond ((not buf) (message "No buffer named %s" file-or-buffer))
            (other-window (switch-to-buffer-other-window file-or-buffer))
            (t (switch-to-buffer file-or-buffer))))))


(defun el-stack-goto-location (location &optional other-window )
  "Go to a location passed in. It can be either: file,12 or file:13:14 or plain file"
  ;; (message (format "el-stack-goto-location \"%s\"" location))
  (when (> (length location) 0)
    (cond ((string-match "\\(.*\\):\\([0-9]+\\):\\([0-9]+\\)" location)
           (let ((line (string-to-number (match-string-no-properties 2 location)))
                 (column (string-to-number (match-string-no-properties 3 location))))
             (el-stack-find-file-or-buffer (match-string-no-properties 1 location) other-window)
             ;;(run-hooks el-stack-after-find-file-hook)
             (el-stack-goto-line-col line column)
             t))
          ((string-match "\\(.*\\):\\([0-9]+\\)" location)
           (let ((line (string-to-number (match-string-no-properties 2 location))))
             (el-stack-find-file-or-buffer (match-string-no-properties 1 location) other-window)
             ;;(run-hooks el-stack-after-find-file-hook)
             (goto-char (point-min))
             (forward-line (1- line))
             t))
          ((string-match "\\(.*\\),\\([0-9]+\\)" location)
           (let ((offset (string-to-number (match-string-no-properties 2 location))))
             (el-stack-find-file-or-buffer (match-string-no-properties 1 location) other-window)
             ;;(run-hooks el-stack-after-find-file-hook)
			 (goto-char (1+ pos))
             t))
          (t
           (if (string-match "^ +\\(.*\\)$" location)
               (setq location (match-string-no-properties 1 location)))
           (el-stack-find-file-or-buffer location other-window)))
	(el-stack-location-stack-push)
   ))



(defun el-stack-location-stack-forward ()
  (interactive)
  (el-stack-location-stack-jump -1))

(defun el-stack-location-stack-back ()
  (interactive)
  (el-stack-location-stack-jump 1))



(defun el-stack-location-stack-jump (by)
  (interactive)
  (let ((instack (nth el-stack-location-stack-index el-stack-location-stack))
        (cur (el-stack-current-location)))
    (if (not (string= instack cur))
        (el-stack-goto-location instack )
      (let ((target (+ el-stack-location-stack-index by)))
        (when (and (>= target 0) (< target (length el-stack-location-stack)))
          (setq el-stack-location-stack-index target)
          (el-stack-goto-location (nth el-stack-location-stack-index el-stack-location-stack) ))))))


(defadvice find-function (before jim-find-funtion  activate compile)
  (interactive (find-function-read))
  (el-stack-location-stack-push)
  )


(provide 'elisp-stack)
