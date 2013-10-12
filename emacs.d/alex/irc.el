;; rcirc

(setq rcirc-server-alist `(("irc.freenode.net"
                            :channels ("#iz")
                            :nick      "cyberpunk_dogz"
                            :user-name "dogz"))
      rcirc-fill-column  75
      rcirc-buffer-maximum-lines 2000
      rcirc-default-nick "cyberpunk_dogz")

(add-hook 'rcirc-mode-hook 'turn-on-flyspell)

(setq rcirc-authinfo
      '(( "freenode" nickserv "cyberpunk_dogz" "pizza123")))

(add-hook 'rcirc-mode-hook 'turn-on-flyspell)
