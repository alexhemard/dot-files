;; keybindingz

(global-set-key (kbd "C-c C-a") 'magit-status)
(global-set-key (kbd "C-c b") 'git-blame)
(global-set-key (kbd "C-c o") 'occur)
(global-set-key (kbd "C-x M-t") 'cleanup-region)
(global-set-key (kbd "C-c n") 'cleanup-buffer)
(global-set-key (kbd "C-<delete>") 'c-hungry-delete-forward)
(global-set-key (kbd "C-<backspace>") 'c-hungry-delete-backwards)
(global-set-key (kbd "C-<backspace>") 'c-hungry-delete-backwards)
(global-set-key (kbd "C-c i") 'rcirc-next-active-buffer)
(global-set-key (kbd "C-c I") 'irc)
(global-set-key (kbd "s-f") 'toggle-fullscreen)
(define-key global-map (kbd "C-c SPC") 'ace-jump-mode)

(setq mac-command-modifier 'super)
