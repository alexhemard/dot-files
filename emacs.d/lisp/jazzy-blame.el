(defgroup jazzy-blame nil
  "Git-blame at line."
  :group 'git-extensions)

(defun jazzy-blame-decode-time (unixtime &optional tz)
  "Decode UNIXTIME into (HIGH LOW) format.

The second argument TZ can be used to add the timezone in (-)HHMM
format to UNIXTIME.  UNIXTIME should be either a number
containing seconds since epoch or Emacs's (HIGH LOW . IGNORED)
format."
  (when (numberp tz)
    (unless (numberp unixtime)
      (setq unixtime (float-time unixtime)))
    (let* ((ptz (abs tz))
           (min (+ (* (/ ptz 100) 60)
                   (mod ptz 100))))
      (setq unixtime (+ (* (if (< tz 0) (- min) min) 60) unixtime))))

  (when (numberp unixtime)
    (setq unixtime (seconds-to-time unixtime)))
  unixtime)

(defun jazzy-blame-format-time-string (format &optional unixtime tz)
 (unless unixtime
    (setq unixtime (current-time)))
  (when (numberp tz) ;; TODO add support for %Z
    (setq format (replace-regexp-in-string "%z" (format "%+05d" tz) format)))
  (format-time-string format (magit-blame-decode-time unixtime tz) tz))

(defun git-blame-for-line (line-num)
  (shell-command-to-string
   (format
    "git blame -L%s,%s %s  --line-porcelain" line-num line-num buffer-file-name)))

(defun jazzy-blame-parse-message (blame-msg)
 (with-temp-buffer
   (insert blame-msg)
   (goto-char (point-min))
   (re-search-forward "^\\([0-9a-f]\\{40\\}\\) \\([0-9]+\\) \\([0-9]+\\) \\([0-9]+\\)$" nil t)
   (setq commit (substring (match-string-no-properties 1) 0 6))
   (re-search-forward "^author \\(.+\\)$")
   (setq author (match-string-no-properties 1))
   (re-search-forward "^author-mail <\\(.+\\)>$")
   (setq author-mail (match-string-no-properties 1))
   (re-search-forward "^author-time \\(.+\\)$")
   (setq author-time (string-to-number
                      (match-string-no-properties 1)))
   (re-search-forward "^author-tz \\(.+\\)$")
   (setq author-timezone (string-to-number
                          (match-string-no-properties 1)))
   (re-search-forward "^summary \\(.+\\)$")
   (setq subject (match-string-no-properties 1))
   (list :sha1 commit 
         :author author
         :author-mail author-mail
         :author-time author-time
         :author-timezone author-timezone
         :subject subject)))

(defun jazzy-blame-format-message (commit-info)
  (setq commit (plist-get commit-info :sha1)
        author (plist-get commit-info :author)
        author-mail (plist-get commit-info :author-mail)
        author-time (plist-get commit-info :author-time)
        author-timezone (plist-get commit-info :author-timezone)
        subject (plist-get commit-info :subject))
  (format "%s %s <%s>" commit author author-mail))

(defun jazzy-blame ()
  "bootleg git blame at point helper"
  (interactive)
  (let ((blame-msg (git-blame-for-line
                    (cadr (split-string (what-line))))))
    (momentary-string-display
     (concat (jazzy-blame-format-message
              (jazzy-blame-parse-message blame-msg)) "\n")
             (line-beginning-position))))

(provide 'jazzy-blame)
