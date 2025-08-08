(require 'package)

(setq package-archives '(("gnu" . "http://elpa.gnu.org/packages/")
                         ("melpa" . "http://melpa.org/packages/")))

(package-initialize)

(when (not package-archive-contents)
  (package-refresh-contents))

(defvar my-packages '(
                      ace-jump-mode
                      auto-complete
                      apheleia
                      avy
                      cider
                      clojure-mode
                      color-theme
                      company
                      consult
                      cyberpunk-theme
                      dap-mode
                      eglot
                      flycheck
                      gist
                      go-mode
                      haskell-mode
                      hydra
                      inf-clojure
                      json-mode
                      less-css-mode
                      magit
                      marginalia
                      markdown-mode
                      mise
                      orderless
                      paredit
                      pcache
                      powerline
                      projectile
                      protobuf-mode
                      sws-mode
                      terraform-mode
                      tramp
                      undo-tree                      
                      vertico
                      web-mode
                      which-key
                      yaml-mode
                      yasnippet
                      zenburn-theme))

(dolist (p my-packages)
  (when (not (package-installed-p p))
    (package-install p)))

(add-to-list 'load-path "~/.emacs.d/lisp")

(defun set-exec-path-from-shell-PATH ()
  "Set up Emacs' `exec-path' and PATH environment variable to match that used by the user's shell.

This is particularly useful under Mac OSX, where GUI apps are not started from a shell."
  (interactive)
  (let ((path-from-shell (replace-regexp-in-string "[ \t\n]*$" "" (shell-command-to-string "$SHELL --login -i -c 'echo $PATH'"))))
    (setenv "PATH" path-from-shell)
    (setq exec-path (split-string path-from-shell path-separator))))

(if (eq system-type 'darwin)
    (progn
      (set-exec-path-from-shell-PATH)
      (setq exec-path (append exec-path '("/usr/local/bin")))))

(mapc 'load
      (directory-files
       (concat user-emacs-directory user-login-name)
       t "^[^#].*el$"))

(load "server")
(unless (server-running-p) (server-start))

(setq custom-file  (concat user-emacs-directory user-login-name "/custom.el"))
(load custom-file)
