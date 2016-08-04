(setq tramp-default-method "ssh")
(setq tramp-ssh-controlmaster-options
      (concat
       "-o ControlPath=/tmp/%%r@%%h:%%p "
       "-o ControlMaster=auto -o ControlPersist=yes"))

