(add-hook 'markdown-mode-hook
          (lambda ()
            (remove-hook 'before-save-hook 'delete-trailing-whitespace t)))
