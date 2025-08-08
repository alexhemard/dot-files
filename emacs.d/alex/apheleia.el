(require 'apheleia)

(setf (alist-get 'prettier apheleia-formatters)
      '(npx "prettier"
            "--trailing-comma"  "es5"
            "--bracket-spacing" "true"
            "--single-quote"    "true"
            "--semi"            "false"
            "--print-width"     "100"
            file))

(add-to-list 'apheleia-mode-alist '(rjsx-mode . prettier))
(apheleia-global-mode t)
