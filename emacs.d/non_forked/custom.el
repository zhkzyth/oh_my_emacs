;; -*- lexical-binding: t -*-

;;; menu
(tool-bar-mode -1);
(menu-bar-mode -1);

;;; files
(setq make-backup-files nil) ;do not backup files

;;; GUI
(set-face-foreground 'font-lock-comment-face "#ff7f24")  ;M-x set-face-foreground

;;; common-lisp setting
;;; nima~~~kengdie a~~zhege shi clisp de jiexiqi a qin!!!
;; (setq infreior-lisp-program "/usr/bin/sbcl");
;; (add-to-list 'load-path "/usr/share/common-lisp/source/slime")
;(require 'slime);
;(slime-setup '(slime-fancy));
;(slime)			    ;M-x slime


;;; Always do syntax highlighting
(global-font-lock-mode 1)
;;; Also highlight parens
(setq show-paren-delay 0
 show-paren-style 'parenthesis)
(show-paren-mode 1)
;;; This is the binary name of my scheme implementation
(setq scheme-program-name "mit-scheme")


;auto complete
(defun lisp-indent-or-complete (&optional arg)
  (interactive "p")
  (if (or (looking-back "^\\s-*") (blop))
    (call-interactively 'lisp-indent-line)
    (call-interactively 'slime-indent-and-complete-symbol)))
(eval-after-load "lisp-mode"
                 '(progn
                   (define-key lisp-mode-map (kbd "TAB") 'lisp-indent-or-complete)))
;end of defun lisp-indent....

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

;;; window manager
;;; TODO mody it to to combine the one extra funcs
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

(global-set-key (kbd "C-c {") (kbd "C-u 1 6 C-c {"))
(global-set-key (kbd "C-c }") (kbd "C-u 1 6 C-c }"))


;; ibus support
(add-hook 'after-init-hook 'ibus-mode-on)
(global-set-key (kbd "C-=") 'ibus-toggle) ;;这里既是绑定上面设置的C+=快捷键到ibus中
;;; Change cursor color depending on IBus status
(setq ibus-cursor-color '("red" "blue" "limegreen"))


;;在窗口的标题栏上显示文件名称
(setq frame-title-mode t)


;;我写的一个函数,如果有选中区域,则kill选区,否则删除当前行
;;注意当前行并不代表整行,它只删除光标到行尾的内容,也就是默认情况下
;;C-k 所具有的功能
;;###autoload
(defun joseph-kill-region-or-line(&optional arg)
  "this function is a wrapper of (kill-line).
   When called interactively with no active region, this function
  will call (kill-line) ,else kill the region."
  (interactive "P")
  (if mark-active
      (if (= (region-beginning) (region-end) ) (kill-line arg)
        (kill-region (region-beginning) (region-end) )
        )
    (kill-line arg)
    )
  )

;;Add the undo-tree support
(global-undo-tree-mode)

;;Add for the Evil support
(evil-mode 1)
(setq evil-insert-state-cursor '("red" box))
(setq evil-normal-state-cursor '("blue" box))

;; Note: lexical-binding must be t in order for this to work correctly.
;; (defun make-conditional-key-translation (key-from key-to translate-keys-p)
;;   "Make a Key Translation such that if the translate-keys-p function returns true,
;;    key-from translates to key-to, else key-from translates to itself . translate-keys-p
;;    takes key-from as an argument                                     . "
;;   (define-key key-translation-map key-from
;;     (lambda (prompt)
;;       (if (funcall translate-keys-p key-from) key-to key-from))))
;; (defun my-translate-keys-p (key-from)
;;   "Returns whether conditional key translations should be active.  See make-conditional-key-translation function. "
;;   (and
;;    ;; Only allow a non identity translation if we're beginning a Key Sequence.
;;    (equal key-from (this-command-keys))
;;    (or (evil-motion-state-p) (evil-normal-state-p) (evil-visual-state-p))))
;; (define-key evil-normal-state-map "c" nil)
;; (define-key evil-motion-state-map "cu" 'universal-argument)
;; (make-conditional-key-translation (kbd "ch") (kbd "C-h") 'my-translate-keys-p)
;;;(make-conditional-key-translation (kbd "g") (kbd "C-x") 'my-translate-keys-p)

;;Add support for evil-surround
;(global-surround-mode 1)


;;TODO fix the search /
(evilnc-default-hotkeys)
;(setq evil-leader/leader "," evil-leader/in-all-states t)
;(evil-leader/set-key
  ;"ci" 'evilnc-comment-or-uncomment-lines
  ;"cc" 'evilnc-comment-or-uncomment-to-the-line
;)

;;cmdT plugin config
;(push "~/.emacs.d/vendor/helm-cmd-t" load-path)
;(require 'helm-config)
;(require 'helm-cmd-t)
(global-set-key (kbd "M-t") 'helm-cmd-t)
(setq helm-ff-lynx-style-map nil
      helm-input-idle-delay 0.1
      helm-idle-delay 0.1
)

;; pymacs
(autoload 'pymacs-apply "pymacs")
(autoload 'pymacs-call "pymacs")
(autoload 'pymacs-eval "pymacs" nil t)
(autoload 'pymacs-exec "pymacs" nil t)
(autoload 'pymacs-load "pymacs" nil t)
(autoload 'pymacs-autoload "pymacs")
;;(eval-after-load "pymacs"
;;  '(add-to-list 'pymacs-load-path YOUR-PYMACS-DIRECTORY"))

(pymacs-load "ropemacs" "rope-")
(setq ropemacs-enable-autoimport t)


;(require 'pycomplete)
(setq auto-mode-alist (cons '("\\.py$" . python-mode) auto-mode-alist))
(autoload 'python-mode "python-mode" "Python editing mode." t)
(setq interpreter-mode-alist(cons '("python" . python-mode)
                                  interpreter-mode-alist))
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(ansi-color-names-vector ["#212526" "#ff4b4b" "#b4fa70" "#fce94f" "#729fcf" "#ad7fa8" "#8cc4ff" "#eeeeec"])
 '(custom-enabled-themes nil))
 ;'(custom-enabled-themes (quote (tango-dark)))
 ;'(safe-local-variable-values (quote ((encoding . utf-8) (ruby-compilation-executable . "ruby") (ruby-compilation-executable . "ruby1.8") (ruby-compilation-executable . "ruby1.9") (ruby-compilation-executable . "rbx") (ruby-compilation-executable . "jruby")))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )

;; auto start the speed Bar
(global-set-key (kbd "M-b") 'imenu)

;; set the font-size
(set-face-attribute 'default nil :height 120)

;; If emacs is run in a terminal, the clipboard- functions have no
;; effect. Instead, we use of xsel, see
;; http://www.vergenet.net/~conrad/software/xsel/ -- "a command-line
;; program for getting and setting the contents of the X selection"
(unless window-system
 (when (getenv "DISPLAY")
  ;; Callback for when user cuts
  (defun xsel-cut-function (text &optional push)
    ;; Insert text to temp-buffer, and "send" content to xsel stdin
    (with-temp-buffer
      (insert text)
      ;; I prefer using the "clipboard" selection (the one the
      ;; typically is used by c-c/c-v) before the primary selection
      ;; (that uses mouse-select/middle-button-click)
      (call-process-region (point-min) (point-max) "xsel" nil 0 nil "--clipboard" "--input")))
  ;; Call back for when user pastes
  (defun xsel-paste-function()
    ;; Find out what is current selection by xsel. If it is different
    ;; from the top of the kill-ring (car kill-ring), then return
    ;; it. Else, nil is returned, so whatever is in the top of the
    ;; kill-ring will be used.
    (let ((xsel-output (shell-command-to-string "xsel --clipboard --output")))
      (unless (string= (car kill-ring) xsel-output)
	xsel-output )))
  ;; Attach callbacks to hooks
  (setq interprogram-cut-function 'xsel-cut-function)
  (setq interprogram-paste-function 'xsel-paste-function)
  ;; Idea from
  ;; http://shreevatsa.wordpress.com/2006/10/22/emacs-copypaste-and-x/
  ;; http://www.mail-archive.com/help-gnu-emacs@gnu.org/msg03577.html
 ))

;; auto reload when buffer Change
(global-auto-revert-mode t)
