(require 'consult)

(global-set-key (kbd "M-g e") 'consult-compile-error)
(global-set-key (kbd "M-g f") 'consult-flymake)

(global-set-key (kbd "M-s d") 'consult-find)
(global-set-key (kbd "M-s c") 'consult-locate)
(global-set-key (kbd "M-s g") 'consult-grep)
(global-set-key (kbd "M-s G") 'consult-git-grep)
(global-set-key (kbd "M-s r") 'consult-ripgrep)

(add-hook 'completion-list-mode-hook 'consult-preview-at-point-mode)
