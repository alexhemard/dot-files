;; erlang

(setq erlang-root-dir
      (pcase system-type
        (`darwin "/usr/local/lib/erlang")
        (system "/usr/lib64/erlang")))

(setq load-path
      (let* ((lib-dir (file-name-as-directory (concat (file-name-as-directory erlang-root-dir) "lib")))
	     (erlang-path (concat lib-dir (file-name-as-directory (file-name-completion "tools-" lib-dir)) "emacs")))
      (cons erlang-path load-path)))

(require 'erlang-start)

(setq erlang-indent-level 2)
