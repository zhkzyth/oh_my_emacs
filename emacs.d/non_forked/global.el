;;; Generic emacs settings I cannot live without

;; Use command as the meta key
(setq ns-command-modifier (quote meta)) ;;??

;; Don't show the startup screen
(setq inhibit-startup-message t)

;; "y or n" instead of "yes or no"
(fset 'yes-or-no-p 'y-or-n-p)

;; Highlight regions and add special behaviors to regions.
;; "C-h d transient" for more info
(setq transient-mark-mode t)

;; Display line and column numbers
(setq line-number-mode    t)
(setq column-number-mode  t)

;; Emacs gurus don't need no stinking scroll bars
(when (fboundp 'toggle-scroll-bar)
  (toggle-scroll-bar -1))

;; Explicitly show the end of a buffer
(set-default 'indicate-empty-lines t)

;; Line-wrapping
(set-default 'fill-column 80)

;; Make sure all backup files only live in one place
(setq backup-directory-alist '(("." . "~/.emacs.d/backups")))

;; Gotta see matching parens
(show-paren-mode t)

;; Don't truncate lines
(setq truncate-lines t)
(setq truncate-partial-width-windows nil)

;; For emacsclient
(server-start)  ;;???

;; Trailing whitespace is unnecessary
(add-hook 'before-save-hook (lambda () (delete-trailing-whitespace)))

;; Trash can support
(setq delete-by-moving-to-trash t)

;; `brew install aspell --lang=en` (instead of ispell)
;; don't know what does it means???
(setq-default ispell-program-name "aspell")
(setq ispell-list-command "list")
(setq ispell-extra-args '("--sug-mode=ultra"))

;; TODO 11.13 查看这里的配置
;; ;; add support for off screen paren matching highlight
;; (defadvice show-paren-function
;;   (after show-matching-paren-offscreen activate)
;;   "If the matching paren is offscreen, show the matching line in the
;;         echo area. Has no effect if the character before point is not of
;;         the syntax class ')'."
;;   (interactive)
;;   (let* ((cb (char-before (point)))
;;          (matching-text (and cb
;;                              (char-equal (char-syntax cb) ?\) )
;;                              (blink-matching-open))))
;;     (when matching-text (message matching-text))))

;; zap-up-to-char, forward-to-word, backward-to-word, etc
(require 'misc)
