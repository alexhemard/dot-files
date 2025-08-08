(setq clojure-indent-style :always-indent)

;; Configure nrepl.el
;(add-hook 'cider-mode-hook 'cider-turn-on-eldoc-mode)
;(setq cider-repl-tab-command 'indent-for-tab-command)

;(setq nrepl-hide-special-buffers nil)
;(setq cider-repl-popup-stacktraces nil)
;(setq cider-repl-history-file "~/.emacs.d/nrepl-history")

;; Repl mode hook
;(add-hook 'cider-mode-hook 'subword-mode)

;(setq cider-lein-command "~/.bin/lein")

(add-hook 'clojure-mode-hook #'inf-clojure-minor-mode)
