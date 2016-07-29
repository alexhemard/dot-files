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
