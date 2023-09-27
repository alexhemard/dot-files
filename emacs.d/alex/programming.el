(add-hook 'before-save-hook 'delete-trailing-whitespace)

;; rbenv

;; (let* ((rbenv (file-name-as-directory (getenv "HOME")))
;;        (shims (concat rbenv "shims"))
;;        (bin   (concat rbenv "bin")))
;;   (setq exec-path (append '(shims bin) exec-path))
;;   (setenv "PATH" (concat shims ":" bin ":" (getenv "PATH"))))

;; buffer cleanup

(defun untabify-buffer ()
  (interactive)
  (untabify (point-min) (point-max)))

(defun indent-buffer ()
  (interactive)
  (indent-region (point-min) (point-max)))

(defun cleanup-buffer ()
  "Perform a bunch of operations on the whitespace content of a buffer."
  (interactive)
  (indent-buffer)
  (untabify-buffer)
  (delete-trailing-whitespace))

(defun cleanup-region (beg end)
  "Remove tmux artifacts from region."
  (interactive "r")
  (dolist (re '("\\\\|\.*\n" "\W*|\.*"))
    (replace-regexp re "" nil beg end)))

(add-hook 'ruby-mode-hook (lambda ()
                            (add-to-list 'write-file-functions 'delete-trailing-whitespace)
                            (local-set-key "\r" 'newline-and-indent)))

(autoload 'magit-status "magit" nil t)

(if (eq system-type 'darwin)
    (set-variable 'magit-emacsclient-executable "/usr/local/bin/emacsclient"))

;; coffee mode

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(coffee-tab-width 2)
 '(css-indent-offset 2)
 '(js-indent-level 2))

;; jade

(require 'sws-mode)

(load "cc-mode")

;; taste the rainbow

; (require 'rainbow-delimiters)
; (add-hook 'prog-mode-hook 'rainbow-delimiters-mode)

;; scss

(setq scss-compile-at-save nil)
