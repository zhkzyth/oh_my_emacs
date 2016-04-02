;; -*- lexical-binding: t -*-

;;; menu
(tool-bar-mode -1);
(menu-bar-mode -1);

;;; files
(setq make-backup-files nil) ;do not backup files
(setq create-lockfiles nil) ;do not create the tmp file.not work before 24.2
(setq backup-inhibited t)  ;disable backup
(setq auto-save-default nil) ;disable auto save

;;; GUI
(set-face-foreground 'font-lock-comment-face "#ff7f24")  ;M-x set-face-foreground

;;; 在窗口的标题栏上显示文件名称
(setq frame-title-mode t)

;;; set the font-size
(set-face-attribute 'default nil :height 120)
;;;auto pair
(autopair-global-mode) ;; to enable in all buffers
;;; linu-num
(global-linum-mode 1)
:
;;; Always do syntax highlighting
(global-font-lock-mode 1)
;;; Also highlight parens
(setq show-paren-delay 0
      show-paren-style 'parenthesis)
(show-paren-mode 1)

;;;  ETAGS related
(setq path-to-etags "/usr/bin/etags") ;; <- your ctags path here

(defun create-tags-for-one-dir (dir-name)
  "Create tags file for whole pro or for one dir~"
  (interactive "DDirectory: ")
  (let ((tags-revert-without-query t))
    (shell-command
     (format "find %s -type f -regex '.*\.\\(c\\|h\\|el\\|scm\\|js\\)' | xargs etags -f %sTAGS" dir-name dir-name)
     )))

;;;  Jonas.Jarnestrom<at>ki.ericsson.se A smarter
;;;  find-tag that automagically reruns etags when it cant find a
;;;  requested item and then makes a new try to locate it.
;;;  Fri Mar 15 09:52:14 2002

                                        ;(defadvice find-tag (around refresh-etags activate)
                                        ;"Rerun etags and reload tags if tag not found and redo find-tag.
                                        ;If buffer is modified, ask about save before running etags."
                                        ;(let ((extension (file-name-extension (buffer-file-name))))
                                        ;(condition-case err
                                        ;ad-do-it
                                        ;(error (and (buffer-modified-p)
                                        ;(not (ding))
                                        ;(y-or-n-p "Buffer is modified, save it? ")
                                        ;(save-buffer))
                                        ;(er-refresh-etags extension)
                                        ;ad-do-it))))

                                        ;(defun er-refresh-etags (&optional extension)
                                        ;"Run etags on all peer files in current dir and reload them silently."
                                        ;(interactive)
                                        ;(shell-command
                                        ;(format "etags *.%s" (or extension "el")))
  ;;; (format "find %s -type f -regex '.*\.\\(c\\|h\\|el\\|scm\\)' | xargs etags -f %sTAGS" dir-name dir-name))
                                        ;(let ((tags-revert-without-query t))  ; don't query, revert silently
                                        ;(visit-tags-table default-directory nil)))

                                        ;(defadvice previous-line (before next-line-at-end
                                        ;(&optional arg try-vscroll))
                                        ;"Insert an empty line when moving up from the top line."
                                        ;(if (and next-line-add-newlines (= arg 1)
                                        ;(save-excursion (beginning-of-line) (bobp)))
                                        ;(progn
                                        ;(beginning-of-line)
                                        ;(newline))))

                                        ;(ad-activate 'previous-line)

;; ibus support for linux like ubuntu
(cond
 ((eq system-type 'cygwin) (
                            (add-hook 'after-init-hook 'ibus-mode-on)
                            (global-set-key (kbd "C-=") 'ibus-toggle) ;;这里既是绑定上面设置的C+=快捷键到ibus中
 ;;; Change cursor color depending on IBus status
                            (setq ibus-cursor-color '("red" "blue" "limegreen"))))
 nil
 )

;;Add the undo-tree support
;(global-undo-tree-mode)

;;Add for the Evil support
(evil-mode 1)
(setq evil-insert-state-cursor '("red" box))
(setq evil-normal-state-cursor '("blue" box))

;;Add support for evil-surround
;(global-surround-mode 1)

;;cmdT plugin config
(setq helm-ff-lynx-style-map nil
      helm-input-idle-delay 0.1
      helm-idle-delay 0.1
      )


;;; pymacs
(autoload 'pymacs-apply "pymacs")
(autoload 'pymacs-call "pymacs")
(autoload 'pymacs-eval "pymacs" nil t)
(autoload 'pymacs-exec "pymacs" nil t)
(autoload 'pymacs-load "pymacs" nil t)
(autoload 'pymacs-autoload "pymacs")

(pymacs-load "ropemacs" "rope-")
(setq ropemacs-enable-autoimport t)

;;;
(setq py-load-pymacs-p t)

(require 'pycomplete)
(setq auto-mode-alist (cons '("\\.py$" . python-mode) auto-mode-alist))
(autoload 'python-mode "python-mode" "Python editing mode." t)
(setq interpreter-mode-alist (cons '("python" . python-mode)
                                  interpreter-mode-alist))

;; If emacs is run in a terminal, the clipboard- functions have no
;; effect. Instead, we use of xsel, see
;; http://www.vergenet.net/~conrad/software/xsel/ -- "a command-line
;; program for getting and setting the contents of the X selection"
(unless window-system
  (when (getenv "DISPLAY")

    ;; Callback for when user cuts
    (defun xsel-cut-function (text &optional push)
    ;;; Insert text to temp-buffer, and "send" content to xsel stdin
      (with-temp-buffer
        (insert text)
        (cond
         ((eq system-type 'cygwin) (set 'cmd "getclip"))
         ((eq system-type 'darwin) (set 'cmd "pbcopy"))
         (t (set 'cmd "xsel -ob"))
         )
        (message "copy content to clipboard")
        (call-process-region (point-min) (point-max) cmd nil 0 nil "--clipboard" "--input")))

    ;;; Call back for when user pastes
    (defun xsel-paste-function()
    ;;; Find out what is current selection by xsel. If it is different
    ;;; from the top of the kill-ring (car kill-ring), then return
    ;;; it. Else, nil is returned, so whatever is in the top of the
    ;;; kill-ring will be used.
      (cond
       ((eq system-type 'cygwin) (set 'cmd "getclip"))
       ((eq system-type 'darwin) (set 'cmd "pbpaste"))
       (t (set 'cmd "xsel -ob"))
       )
      (message "paste content from clipboard")
      (let ((xsel-output (shell-command-to-string (concat cmd  " --clipboard --output"))))
        (unless (string= (car kill-ring) xsel-output)
          xsel-output )))
    ;; Idea from
    ;; http://shreevatsa.wordpress.com/2006/10/22/emacs-copypaste-and-x/
    ;; http://www.mail-archive.com/help-gnu-emacs@gnu.org/msg03577.html

    ;;interactive copy/paste
    (defun copy-to-x-clipboard ()
      (interactive)
      (if (region-active-p)
          (progn
                                        ; my clipboard manager only intercept CLIPBOARD
            (shell-command-on-region (region-beginning) (region-end)
                                     (cond
                                      ((eq system-type 'cygwin) "putclip")
                                      ((eq system-type 'darwin) "pbcopy")
                                      (t "xsel -ib")
                                      )
                                     )
            (message "Yanked region to clipboard!")
            (deactivate-mark))
        (message "No region active; can't yank to clipboard!")))

    (defun paste-from-x-clipboard()
      (interactive)
      (shell-command
       (cond
        ((eq system-type 'cygwin) "getclip")
        ((eq system-type 'darwin) "pbpaste")
        (t "xsel -ob")
        )
       1))

    ;; Attach callbacks to hooks
    (setq interprogram-cut-function 'xsel-cut-function)
    (setq interprogram-paste-function 'xsel-paste-function)
    ))

;; fuking cool irc
(setq erc-default-coding-system '(utf-8 utf-8))
(setq erc-encoding-coding-alist '(("#linuxfire" chiese-iso-8bit)))
(setq erc-nick "zhkzyth"
      erc-user-full-name "zhkzyth")
(erc-autojoin-mode 1)
(setq erc-autojoin-channels-alist
      '((
         "oftc.net"
         "#debian-zh"
         "#emacs-cn"
         )))
(erc-match-mode 1)
(setq erc-keywords '("emacs" "python"))
(setq erc-pals '("rms"))
(setq erc-ignore-list nil)
(setq erc-hide-list
      '("JOIN" "PART" "QUIT" "MODE"))

;;;evil-leader support
(evil-leader/set-leader ",")
(evil-leader/set-key "/" 'evilnc-comment-or-uncomment-lines)


;;;;;;;;;;;;;;;;;;;;;;;;; cmake-mode
(setq auto-mode-alist
      (append '(("CMakeLists\\.txt\\'" . cmake-mode)
                ("\\.cmake\\'" . cmake-mode))
              auto-mode-alist))


;;;;;;;;;;;;;;;;;;;;;;;;; ;;;;;;;;;;;;;;;;;;
;;; erc-mode
(setq erc-default-coding-system '(utf-8 . utf-8))
;;; auto login
(erc-autojoin-mode 1)
(setq erc-autojoin-channels-alist
      '(("oftc.net"                 ; debian.org 是它的别名
         "#debian-zh"
         "#emacs-cn")
        ("freenode.net"
         "#emacs"
         "#ubuntu-cn"
         "#archlinux")
        ))

(setq erc-ignore-list nil)
(setq erc-hide-list
      '("JOIN" "PART" "QUIT" "MODE"))


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;; FIXME: Not work as expected
;;; GLOBAL + Speedbar mode
;; (setq load-path (cons "/path/to/gtags.el" load-path))

;; (autoload 'gtags-mode "gtags" "" t)
;;; auto enable the gtags mode on c mode
;; (add-hook 'c-mode-hook
          ;; '(lambda ()
             ;; (gtags-mode t)))

;; (add-hook 'c++-mode-hook
          ;; '(lambda ()
             ;; (gtags-mode t)))

;;;; init for sr-speedbar
;;;  FIXME in shared server mode
;(add-hook 'after-init-hook '(lambda () (sr-speedbar-toggle)));;开启程序即启用




;;;;; auto erlang mode
(setq auto-mode-alist (cons '("\\.erl$" . erlang-mode) auto-mode-alist))


;;;;; handy tools
(defun kill-other-buffers ()
  "Kill all other buffers."
  (interactive)
  (mapc 'kill-buffer
        (delq (current-buffer)
              (remove-if-not 'buffer-file-name (buffer-list)))))

(setq ansi-color-names-vector
       ["black" "tomato" "PaleGreen2" "gold1"
              "DeepSkyBlue1" "MediumOrchid1" "cyan" "white"])
(setq ansi-color-map (ansi-color-make-color-map)) ;;;this helped


;;;;;;;;;;;;;;; hack for shell mode color
;;;;;;;;;;;;;;; FIXME not work!!!
;; ;; Use variable width font faces in current buffer
;; (defun my-buffer-face-mode-variable ()
;; ;;   "Set font to a variable width (proportional) fonts in current buffer"
;;   (interactive)
;;   (setq buffer-face-mode-face '(:family "Menlo For Powerline" :height 100))
;;   (text-scale-adjust 1)
;;    (buffer-face-mode))

;; (setq system-uses-terminfo nil)
;; (add-hook 'term-mode-hook
;;           '(lambda ()
;;              (linum-mode 0)
;;              (term-set-escape-char ?\C-z)
;;              (term-set-escape-char ?\C-x)
;;              (define-key term-raw-map "\C-c" 'term-interrupt-subjob)
;;              (define-key term-raw-map (kbd "M-x") 'execute-extended-command)
;;              (setq autopair-dont-activate t)
;;              (setq ac-auto-start nil)
;;              (visual-line-mode -1)
;;              ;; (my-buffer-face-mode-variable)
;;              ))

;; (defun my-term-paste (&optional string)
;;   (interactive)
;;   (process-send-string
;;    (get-buffer-process (current-buffer))
;;    (if string string (current-kill 0))))

;; (defun my-term-pasteboard-paste ()
;;   (interactive)
;;   (process-send-string
;;    (get-buffer-process (current-buffer))
;;    (ns-get-pasteboard)))

;; (add-hook 'term-exec-hook '(lambda ()
;;                              (set-buffer-process-coding-system 'utf-8-unix 'utf-8-unix)
;;                              (goto-address-mode)
;;                              (define-key term-raw-map (kbd "C-y") 'my-term-paste)
;;                              (define-key term-raw-map (kbd "s-v") 'my-term-pasteboard-paste)
;;                              (let ((base03 "#002b36")
;;                                    (base02 "#073642")
;;                                    (base01 "#586e75")
;;                                    (base00 "#657b83")
;;                                    (base0 "#839496")
;;                                    (base1 "#93a1a1")
;;                                    (base2 "#eee8d5")
;;                                    (base3 "#fdf6e3")
;;                                    (yellow "#b58900")
;;                                    (orange "#cb4b16")
;;                                    (red "#dc322f")
;;                                    (magenta "#d33682")
;;                                    (violet "#6c71c4")
;;                                    (blue "#268bd2")
;;                                    (cyan "#2aa198")
;;                                    (green "#859900"))
;;                                (setq ansi-term-color-vector
;;                                      (vconcat `(unspecified ,base02 ,red ,green ,yellow ,blue
;;                                                             ,magenta ,cyan ,base2))))))

;; Enable mouse support
(unless window-system
  (require 'mouse)
  (xterm-mouse-mode t)
  (global-set-key [mouse-4] '(lambda ()
                              (interactive)
                              (scroll-down 1)))
  (global-set-key [mouse-5] '(lambda ()
                              (interactive)
                              (scroll-up 1)))
  (defun track-mouse (e))
  (setq mouse-sel-mode t)
)

;; Prevent the annoying beep on errors and disable the errors
(setq visible-bell t)
(setq stack-trace-on-error nil)
(setq ring-bell-function 'ignore)
(setq debug-on-error nil)

;; enable cogre mode for drawing follow charts
;; (cogre-mode 1)

(setq py-shell-name "ipython")

;; TODO config for auto-complete


;; config for pyflymake
;;
