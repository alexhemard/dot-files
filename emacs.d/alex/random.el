(scroll-bar-mode -1)
(tool-bar-mode -1)
(setq mouse-wheel-scroll-amount '(1 ((shift) . 1)))
(setq scroll-step 1)
(setq mouse-wheel-progressive-speed nil)
(setq ring-bell-function 'ignore)

(require 'jazzy-blame)
(require 'fullscreen)

(add-hook 'before-save-hook 'delete-trailing-whitespace)
(setq before-save-hook nil)

(require 'savehist)
(savehist-mode)

(context-menu-mode t)

;; Support opening new minibuffers from inside existing minibuffers.
(setq enable-recursive-minibuffers t)

;; Hide commands in M-x which do not work in the current mode.  Vertico
;; commands are hidden in normal buffers. This setting is useful beyond
;; Vertico.
(setq read-extended-command-predicate #'command-completion-default-include-p)

(setq minibuffer-prompt-properties
      '(read-only t cursor-intangible t face minibuffer-prompt))
(add-hook 'minibuffer-setup-hook #'cursor-intangible-mode)

(add-hook 'text-mode-hook 'context-menu-mode)
(add-hook 'shell-mode-hook 'context-menu-mode)
(add-hook 'dired-mode-hook 'context-menu-mode)

