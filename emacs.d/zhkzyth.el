(add-to-list 'load-path "~/.emacs.d/vendor")

;set env
(load "rmm5t/env")
;default value and setting.
(load "rmm5t/global")
;frequently used funcs
(load "rmm5t/defuns")
;global key bindings
(load "rmm5t/bindings")
;tab indent and completion stuffs.
(load "rmm5t/tabs")
;reenable some default disabled vars
(load "rmm5t/disabled")
;global fonts settings
(load "rmm5t/fonts")
;use utf-8 encode
(load "rmm5t/utf-8")
;repeate create the scratch buffer
(load "rmm5t/scratch")
;define some shell grep command to help the search
(load "rmm5t/grep")
;set the output gui
(load "rmm5t/diff")
;config the ido plugin
(load "rmm5t/ido")
;config the dired plugin
(load "rmm5t/dired")
;recent files
(load "rmm5t/recentf")
;kill region
(load "rmm5t/rectangle")
;org-mode
(load "rmm5t/org")
;folding methods
(load "rmm5t/zoom")
;flymake GUI
(load "rmm5t/flymake")
;config the js mode
(load "rmm5t/javascript")
;config ruby mode with ri-nari plugin
(load "rmm5t/ri-emacs")
;server-mode ?
(load "rmm5t/server-mode")
;cofig shell mode
(load "rmm5t/shell-mode")

;; (load "rmm5t/hl-line")
;; (load "rmm5t/iswitchb")

;my personal color-theme
(vendor 'color-theme)
;
(vendor 'ruby-mode)
;
(vendor 'rinari)
;
(vendor 'textmate)
;
(vendor 'maxframe)
;
(vendor 'filladapt)
;
(vendor 'coffee-mode)
;
(vendor 'haml-mode)
;
(vendor 'sass-mode)
;
(vendor 'htmlize)
;
(vendor 'full-ack      'ack 'ack-same 'ack-find-same-file 'ack-find-file 'ack-interactive)
;
(vendor 'cdargs        'cv 'cdargs)
;
(vendor 'magit         'magit-status)
;
(vendor 'psvn          'svn-status)
;
(vendor 'js2-mode      'js2-mode)
;
(vendor 'markdown-mode 'markdown-mode)
;
(vendor 'textile-mode  'textile-mode)
;
(vendor 'csv-mode      'csv-mode)
;
(vendor 'yaml-mode     'yaml-mode)
;
(vendor 'inf-ruby      'inf-ruby)
;
(vendor 'rcodetools    'xmp)
;
(vendor 'yasnippet)
;
(vendor 'jekyll)
;
(vendor 'lua-mode      'lua-mode)
;
(vendor 'feature-mode)
;
(vendor 'mode-line-bell)
;
(vendor 'revbufs       'revbufs)
;
(vendor 'buffer-move)
;
(vendor 'ibus)
;add the visual tree support
(vendor 'tree-mode)
(vendor 'windata)
;so here is the dir tree support
(vendor 'dirtree)

;helm framework
(vendor 'helm)
;helm-cmd-t file navigator
(vendor 'helm-cmd-t)

;auto-complete
(vendor 'auto-complete)

;pycomplete
(vendor 'pycomplete)


;for the evil Project
(vendor 'undo-tree)
;add the fucking evil support
(vendor 'evil)
;TODO add evil-surround support, not load in =.=
;(vendor 'evil-surround 'surround)
;TODO add evil-numbers support
(vendor 'evil-numbers)
;TODO free the , map default in emacs
;add evil-leader support
(vendor 'evil-leader)
;add evil-nerd-commenter support
(vendor 'evil-nerd-commenter)


;; (vendor 'ruby-electric 'ruby-electric-mode)
;; (vendor 'auctex)

(setq custom-file "~/.emacs.d/rmm5t/custom.el")
(load custom-file 'noerror) ;;well , the color theme is not the one~
