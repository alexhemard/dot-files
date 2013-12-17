;; epa

(require 'epa-file)
(epa-file-enable)
(setq epa-file-name-regexp "\\.\\(gpg\\|asc\\|pgp\\)$")
(epa-file-name-regexp-update)
