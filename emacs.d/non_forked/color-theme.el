;;; Pretty colors

;;no need any more~
;;(require 'color-theme)
;(color-theme-initialize)
;(vendor 'color-theme-charcoal-black)
;(color-theme-charcoal-black)

;;; temp hack for color theme
(add-to-list 'load-path "/home/zhkzyth/.dotfiles/emacs.d/vendor/color-theme-6.6.0/")
(require 'color-theme)
(eval-after-load "color-theme"
  '(progn
     (color-theme-initialize)
     (color-theme-charcoal-black)))

;; (vendor 'color-theme-arjen)
;; (color-theme-arjen)

;; (color-theme-reset-faces)

;; Color-schemes that I thought were pleasing to the eye.  Most others are
;; pretty ugly.

;; Dark Backgrounds
;; (color-theme-dark-laptop)
;; (color-theme-clarity)
;; (color-theme-goldenrod)
;; (color-theme-billw)

;; Light Backgrounds
;; (color-theme-sitaramv-nt)
;; (color-theme-pierson)
;; (color-theme-rotor)
;; (color-theme-emacs-21)
;; (color-theme-gtk-ide)

(set-face-foreground 'region "white")
(set-face-background 'region "slategray")

(blink-cursor-mode)
(set-cursor-color "orange")
