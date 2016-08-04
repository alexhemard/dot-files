(require 'package)

(setq package-archives '(("gnu" . "http://elpa.gnu.org/packages/")
                         ("marmalade" . "http://marmalade-repo.org/packages/")
                         ("melpa-stable" . "http://stable.melpa.org/packages/")))

(package-initialize)

(when (not package-archive-contents)
  (package-refresh-contents))

(defvar my-packages '(
                      ace-jump-mode
                      auto-complete
                      cider
                      cl
                      clojure-mode
                      coffee-mode
                      color-theme
                      cyberpunk-theme
                      gh
                      gist
                      jade-mode
                      less-css-mode
                      logito
                      magit
                      markdown-mode
                      paredit
                      pcache
                      popup
                      rainbow-mode
                      rainbow-delimiters
                      scala-mode
                      scss-mode
                      sws-mode
                      tramp
                      undo-tree
                      web-mode
                      vimgolf
                      yaml-mode
                      ))

(dolist (p my-packages)
  (when (not (package-installed-p p))
    (package-install p)))

(add-to-list 'load-path "~/.emacs.d/lisp/")

(add-to-list 'custom-theme-load-path "~/.emacs.d/themes")

(if (eq system-type 'darwin)
    (progn
      (setenv "PATH" (concat (getenv "PATH") ":/usr/local/bin"))
      (setq exec-path (append exec-path '("/usr/local/bin")))))

(mapc 'load
      (directory-files
       (concat user-emacs-directory user-login-name)
       t "^[^#].*el$"))

(load "server")
(unless (server-running-p) (server-start))

(setq custom-file  (concat user-emacs-directory user-login-name "/custom.el"))
(load custom-file)
