;;; Fonts

;; ;; From: http://community.schemewiki.org/cgi-bin/scheme.cgi?Emacs
;; ;; since i am ubuntu user~=.=
;; (create-fontset-from-fontset-spec
;;  (concat
;;   "-apple-monaco-medium-r-normal--12-*-*-*-*-*-fontset-monaco,"
;;   "ascii:-apple-monaco-medium-r-normal--12-100-*-*-m-100-mac-roman"))

;; ;; From: http://community.schemewiki.org/cgi-bin/scheme.cgi?Emacs
;; ;; since i am ubuntu user~=.=
;; (and window-system
;;      (create-fontset-from-fontset-spec
;;       (concat
;;        "-apple-monaco-medium-r-normal--12-*-*-*-*-*-fontset-monaco,"
;;        "ascii:-apple-monaco-medium-r-normal--12-100-*-*-m-100-mac-roman"))
;;      )

;; To change a font size globally:
;; (set-face-attribute 'default nil :height 360)
;; (set-face-attribute 'default nil :height 240)
;; (set-face-attribute 'default nil :height 160)
;; (set-face-attribute 'default nil :height 120)

;; To change the font size interactively per buffer:
;; Up:    C-x C-+, C-x C-=
;; Down:  C-x C--
;; Reset: C-x C-0

;; (set-face-attribute 'default t :font  "PragmataPro Regular-14")
;; (set-default-font "PragmataPro Regular-14")

;; (when (eq system-type 'darwin)

;;   ;; default Latin font (e.g. Consolas)
;;   ;; (set-face-attribute 'default nil :family "Consolas")

;;   ;; (set-face-attribute 'default t :font  "PragmataPro")

;;   ;; default font size (point * 10)
;;   ;;
;;   ;; WARNING!  Depending on the default font,
;;   ;; if the size is not supported very well, the frame will be clipped
;;   ;; so that the beginning of the buffer may not be visible correctly.
;;   (set-face-attribute 'default nil :height 165)

;;   ;; use specific font for Korean charset.
;;   ;; if you want to use different font size for specific charset,
;;   ;; add :size POINT-SIZE in the font-spec.
;;   (set-fontset-font t 'hangul (font-spec :name "NanumGothicCoding"))

;;   ;; you may want to add different for other charset in this way.
;; )
