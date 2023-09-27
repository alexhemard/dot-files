(require 'package)

(setq package-archives '(("gnu" . "http://elpa.gnu.org/packages/")
                         ("melpa" . "http://melpa.org/packages/")))

(package-initialize)

(when (not package-archive-contents)
  (package-refresh-contents))

(defvar my-packages '(
                      ace-jump-mode
                      auto-complete
                      cider
                      clojure-mode
                      coffee-mode
                      color-theme
                      cyberpunk-theme
                      gh
                      gist
                      go-mode
                      haskell-mode
                      less-css-mode
                      logito
                      magit
                      markdown-mode
                      mustache-mode
                      paredit
                      pcache
                      popup
                      powerline
                      protobuf-mode
                      rainbow-mode
                      scala-mode
                      scss-mode
                      sws-mode
                      terraform-mode
                      tramp
		                  undo-tree
                      vimgolf
                      web-mode
                      yaml-mode
                      ))

(dolist (p my-packages)
  (when (not (package-installed-p p))
    (package-install p)))

(add-to-list 'load-path "~/.emacs.d/lisp/")

;  (add-to-list 'custom-theme-load-path "~/.emacs.d/themes")

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
