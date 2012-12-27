(require 'package)

(add-to-list 'package-archives 
    '("marmalade" .
      "http://marmalade-repo.org/packages/"))

(when (not package-archive-contents)
  (package-refresh-contents))

(defvar my-packages '(
                      clojure-mode
                      scala-mode
                      coffee-mode
                      markdown-mode
                      gh
                      gist
                      magit
                      yaml-mode
                      tramp
                      undo-tree
                      starter-kit-bindings
		      starter-kit-js
		      starter-kit-lisp
		      starter-kit-ruby
                      starter-kit
                      ))

(dolist (p my-packages)
  (when (not (package-installed-p p))
    (package-install p)))


(ido-mode t)

(setq ido-enable-flex-matching t) ;; straight flexin

;; erlang steez

(setq erlang-root-dir "/usr/local/Cellar/erlang/R15B01/")

(setq load-path (cons (concat erlang-root-dir "lib/erlang/lib/tools-2.6.7/emacs")
                      load-path))

(require 'erlang-start)

;; mac os x steez 

(if (eq system-type 'darwin)     

  (global-set-key (kbd "s-f") 'ns-toggle-fullscreen)

)

;; random emacs swag

(setq indent-tabs-mode nil)

(customize-set-variable 'indent-tabs-mode nil) ;um sure

(scroll-bar-mode -1)

(tool-bar-mode -1)


;; theme swag 

(global-hl-line-mode 1)

(set-face-background 'hl-line "#0000ff")

(load-file "~/.emacs.d/site-lisp/cyberpunk.el")

(color-theme-cyberpunk)

;; who uses the mouse anyway

(setq mouse-wheel-scroll-amount '(1 ((shift) . 1)))
(setq scroll-step 1) 
(setq mouse-wheel-progressive-speed nil)

;; git steez

(require 'magit)

(autoload 'magit-status "magit" nil t)

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
      

(server-start)

;; gnu octave

;; TODO linux support 

(if (eq system-type 'darwin)    
 
    (setenv "PATH" (concat (getenv "PATH") ":/usr/local/bin"))

  (setq inferior-octave-program "/usr/local/bin/octave")

  (setq auto-mode-alist
        (cons '("\\.m$" . octave-mode) auto-mode-alist))

  (add-hook 'octave-mode-hook
            (lambda ()
              (abbrev-mode 1)
              (auto-fill-mode 1)
              (if (eq window-system 'ns)
                  (font-lock-mode 1))))
)

;; keybindingz

(global-set-key (kbd "C-c C-a") 'magit-status) 

(global-set-key (kbd "C-c b") 'git-blame) 

(global-set-key (kbd "C-c o") 'occur)
