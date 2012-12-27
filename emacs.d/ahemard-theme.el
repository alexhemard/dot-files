(deftheme ahemard
  "Created 2012-05-04.")

(custom-theme-set-faces
 'ahemard
 '(cursor ((t (:background "dark gray" :foreground "gray100"))))
 '(secondary-selection ((t (:background "DodgerBlue3"))))
 '(font-lock-constant-face ((t (:foreground "forest green"))))
 '(font-lock-doc-face ((t (:inherit font-lock-string-face))))
 '(font-lock-function-name-face ((t (:foreground "OrangeRed2"))))
 '(font-lock-keyword-face ((t (:foreground "red3"))))
 '(font-lock-preprocessor-face ((t (:foreground "SeaGreen1"))))
 '(font-lock-regexp-grouping-backslash ((t (:foreground "gold1"))))
 '(font-lock-string-face ((t (:foreground "alternateSelectedControlColor"))))
 '(font-lock-type-face ((t (:foreground "gold1"))))
 '(font-lock-variable-name-face ((t (:foreground "DeepSkyBlue2"))))
 '(font-lock-warning-face ((t (:background "yellow1" :foreground "firebrick2"))))
 '(font-lock-comment-face ((t (:foreground "gray41"))))
 '(highlight ((t (:background "blue2"))))
 '(minibuffer-prompt ((t (:foreground "DeepSkyBlue1"))))
 '(link ((t (:foreground "DeepSkyBlue1" :underline t))))
 '(ido-subdir ((t (:foreground "DeepPink2"))))
 '(ido-only-match ((t (:foreground "goldenrod1"))))
 '(magit-diff-add ((t (:foreground "green1"))))
 '(isearch ((t (:background "magenta" :foreground "yellow"))))
 '(default ((t (:inherit nil :stipple nil :background "gray10" :foreground "white" :inverse-video nil :box nil :strike-through nil :overline nil :underline nil :slant normal :weight normal :height 130 :width normal :foundry "apple" :family "PragmataPro")))))

(provide-theme 'ahemard)
