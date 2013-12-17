;; ruby jazz

(setenv "PATH" (concat (getenv "HOME") "/.rbenv/shims:" (getenv "HOME") "/.rbenv/bin:" (getenv "PATH")))

(setq exec-path (cons (concat (getenv "HOME") "/.rbenv/shims") (cons (concat (getenv "HOME") "/.rbenv/bin") exec-path)))


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

;; clojure

(require 'clojure-mode)

(define-clojure-indent
  (defroutes 'defun)
  (GET 2)
  (POST 2)
  (PUT 2)
  (DELETE 2)
  (HEAD 2)
  (ANY 2)
  (context 2))

(defun turn-on-paredit () (paredit-mode 1))
(add-hook 'clojure-mode-hook 'turn-on-paredit)

(require 'cider)

;; Configure nrepl.el
(add-hook 'cider-mode-hook 'cider-turn-on-eldoc-mode)
(setq cider-repl-tab-command 'indent-for-tab-command)

(setq nrepl-hide-special-buffers nil)
(setq cider-repl-popup-stacktraces nil)
(setq cider-repl-history-file "~/.emacs.d/nrepl-history")

;; Repl mode hook
(add-hook 'cider-mode-hook 'subword-mode)

;; Auto completion for NREPL
;; (require 'ac-nrepl)
;;(eval-after-load "auto-complete"
;;  '(add-to-list 'ac-modes 'nrepl-mode))
;;(add-hook 'nrepl-mode-hook 'ac-nrepl-setup)

;;(define-key nrepl-interaction-mode-map (kbd "C-c C-d") 'ac-nrepl-popup-doc)

;;(defun set-auto-complete-as-completion-at-point-function ()
;;  (setq completion-at-point-functions '(auto-complete)))
;;(add-hook 'auto-complete-mode-hook 'set-auto-complete-as-completion-at-point-function)

;;(add-hook 'nrepl-mode-hook 'set-auto-complete-as-completion-at-point-function)
;;(add-hook 'nrepl-interaction-mode-hook 'set-auto-complete-as-completion-at-point-function)

;; git

(require 'magit)

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
(require 'jade-mode)

(load "cc-mode")

;; taste the rainbow

(require 'rainbow-delimiters)
(add-hook 'prog-mode-hook 'rainbow-delimiters-mode)