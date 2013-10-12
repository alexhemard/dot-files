(defun git-blame ()
  "bootleg git blame at point helper"
  (interactive)
  (let* ((line-num
	  (car (cdr (split-string (what-line)))))
	 (blame-msg
	  (shell-command-to-string
	   (format
	    "git blame -L%s,%s %s" line-num line-num buffer-file-name)))
	 (formatted
	  (progn (string-match "(\\([a-zA-z[:blank:]]+ [0-9-]+ \\).*)" blame-msg)
		 (match-string 1 blame-msg))))
	(momentary-string-display (concat formatted "\n")  (line-beginning-position))))
