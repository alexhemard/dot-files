(require 'package)

(setq package-archives '(("gnu" . "http://elpa.gnu.org/packages/")
                         ("marmalade" . "http://marmalade-repo.org/packages/")
                         ("melpa" . "http://melpa.milkbox.net/packages/")))

(package-initialize)

(when (not package-archive-contents)
  (package-refresh-contents))

(defvar my-packages '(
                      ace-jump-mode
                      auto-complete
                      cider
                      cl
                      clojure-mode
                      clojure-test-mode
                      coffee-mode
                      color-theme
                      gh
                      gist
                      jade-mode
                      less-css-mode
                      logito
                      magit
                      markdown-mode
                      melpa
                      paredit
                      pcache
                      rainbow-mode
                      rainbow-delimiters
                      scala-mode
                      scss-mode
                      sws-mode
                      tramp
                      undo-tree
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

(server-start)

