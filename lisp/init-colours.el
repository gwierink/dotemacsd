;;; Initialize font colours
;; ----------------------------------------------------------------------------

(set-face-foreground 'font-lock-comment-face "purple2")
(set-face-foreground 'font-lock-string-face "green4")
(set-face-foreground 'font-lock-function-name-face "red2")
(set-face-foreground 'font-lock-keyword-face "blue3")
(set-face-foreground 'font-lock-preprocessor-face "green4")
(set-face-foreground 'font-lock-type-face "blue")
(set-face-foreground 'font-lock-variable-name-face "DarkGreen")
(set-face-foreground 'region "black")
(set-face-background 'region "grey90")
(set-face-background 'secondary-selection "LightBlue")

(turn-on-font-lock)
(add-hook 'postscript-mode-hook 'turn-off-font-lock)

;; ----------------------------------------------------------------------------
;;; end
