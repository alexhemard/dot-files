(require 'package)

(setq package-archives '(("gnu" . "http://elpa.gnu.org/packages/")
                         ("marmalade" . "http://marmalade-repo.org/packages/")
                         ("melpa" . "http://melpa.milkbox.net/packages/")))

(package-initialize)

(when (not package-archive-contents)
  (package-refresh-contents))

(defvar my-packages '(
                      ace-jump-mode
                      ac-nrepl
                      auto-complete
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
                      nrepl
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

;; ido mode

(ido-mode t)

(setq ido-enable-flex-matching t) ;; straight flexin

;; ace jump

(require 'ace-jump-mode)

;; random emacs swag

(setq-default fill-column 80)

(setq-default indent-tabs-mode nil)

(customize-set-variable 'indent-tabs-mode nil) ;um sure

;; whatever

(scroll-bar-mode -1)
(tool-bar-mode -1)
(setq mouse-wheel-scroll-amount '(1 ((shift) . 1)))
(setq scroll-step 1)
(setq mouse-wheel-progressive-speed nil)

;; server yo

(server-start)

;; epa

(require 'epa-file)
(epa-file-enable)
(setq epa-file-name-regexp "\\.\\(gpg\\|asc\\|pgp\\)$")
(epa-file-name-regexp-update)
