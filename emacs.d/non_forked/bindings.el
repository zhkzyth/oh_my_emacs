;;; Global key bindigns

;;
(global-set-key (kbd "<f1>") 'shell)
(global-set-key (kbd "<f2>") 'imenu)

;; Find stuff
;; not binding for the f2 has been used
(global-set-key [(f3)]              'ack-default-directory)
(global-set-key [(control f3)]      'ack-same)
(global-set-key [(control shift f3)] 'ack)
(global-set-key [(meta f3)]         'find-name-dired)
(global-set-key [(shift f3)]        'occur)

;; Version control and change related
(global-set-key [(control f9)] (lambda () (interactive) (magit-status default-directory)))
(global-set-key [(f9)]         (lambda () (interactive) (magit-status default-directory)))

;; Map the window manipulation keys to meta 0, 1, 2, o
(global-set-key (kbd "M-3") 'split-window-horizontally) ; was digit-argument
(global-set-key (kbd "M-2") 'split-window-vertically) ; was digit-argument
(global-set-key (kbd "M-1") 'delete-other-windows) ; was digit-argument
(global-set-key (kbd "M-0") 'delete-window) ; was digit-argument
(global-set-key (kbd "M-o") 'other-window) ; was facemenu-keymap

;; Replace dired's M-o
(add-hook 'dired-mode-hook (lambda () (define-key dired-mode-map (kbd "M-o") 'other-window))) ; was dired-omit-mode
;; Replace ibuffer's M-o
(add-hook 'ibuffer-mode-hook (lambda () (define-key ibuffer-mode-map (kbd "M-o") 'other-window))) ; was ibuffer-visit-buffer-1-window
;; To help Unlearn C-x 0, 1, 2, o
(global-unset-key (kbd "C-x 3")) ; was split-window-horizontally
(global-unset-key (kbd "C-x 2")) ; was split-window-vertically
(global-unset-key (kbd "C-x 1")) ; was delete-other-windows
(global-unset-key (kbd "C-x 0")) ; was delete-window
(global-unset-key (kbd "C-x o")) ; was other-window

;; Window navigation
(windmove-default-keybindings 'meta)

;; Window switch
;; window movement
(global-set-key [M-left] 'windmove-left)          ; move to left windnow
(global-set-key [M-right] 'windmove-right)        ; move to right window
(global-set-key [M-up] 'windmove-up)              ; move to upper window
(global-set-key [M-down] 'windmove-down)          ; move to downer window

;; Noted:default value is <C-*arrow>,so no need to add more
(define-prefix-command 'ctl-w-map)
(global-set-key (kbd "C-w") 'ctl-w-map)

(global-set-key (kbd "C-w <up>")     'buf-move-up)
(global-set-key (kbd "C-w <down>")   'buf-move-down)
(global-set-key (kbd "C-w <left>")   'buf-move-left)
(global-set-key (kbd "C-w <right>")  'buf-move-right)

;;; window movement
;;; tmp hack for the iterm2
(global-set-key (kbd "ESC <up>") 'windmove-up)
(global-set-key (kbd "ESC <down>") 'windmove-down)
(global-set-key (kbd "ESC <right>") 'windmove-right)
(global-set-key (kbd "ESC <left>") 'windmove-left)

;;;TODO move the funcs definition to somewhere
;;; window size manager
(defun halve-other-window-height ()
  "Expand current window to use half of the other window's lines."
  (interactive)
  (enlarge-window (/ (window-height (next-window)) 2)))

(defun halve-other-window-negative-height ()
  "Expand current window to use half of the other window's lines."
  (interactive)
  (enlarge-window (/ (window-height (next-window)) -2)))

(global-set-key (kbd "C-c <down>") 'halve-other-window-height)
(global-set-key (kbd "C-c <up>") 'halve-other-window-negative-height)

;; Mac OS X conventions
(global-set-key (kbd "M-a") 'mark-whole-buffer) ; was backward-sentence.

;; Find matching parens
;(global-set-key (kbd "C-'") 'match-paren)

;; ibuffer > list-buffers
(global-set-key (kbd "C-x C-x") 'ibuffer)

;; Easier buffer killing
(global-unset-key (kbd "M-k"))
(global-set-key (kbd "M-k") 'kill-this-buffer)

;; auto start the speed Bar
(global-set-key (kbd "M-b") 'imenu)

;; funcking awesome helm-cmd-t
(global-set-key (kbd "M-t") 'helm-cmd-t)

;; backspace delete 
(global-set-key (kbd "DEL") 'backward-delete-char)

;; for irc or erc 

(defun irc ()
   "Connect to the freenode"
   (interactive)
   (erc :server "irc.freenode.net"
        :port 6667
        :nick "zhkzyth"
        :password "qwe123qwe123"))
 
 (global-set-key "\C-ci"  'irc)
