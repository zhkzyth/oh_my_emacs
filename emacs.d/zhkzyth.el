(add-to-list 'load-path "~/.emacs.d/vendor")

;set env
(load "non_forked/env")
;default value and setting.
(load "non_forked/global")
;frequently used funcs
(load "non_forked/defuns")
;global key bindings
(load "non_forked/bindings")
;tab indent and completion stuffs.
(load "non_forked/tabs")
;reenable some default disabled vars
(load "non_forked/disabled")
;global fonts settings
(load "non_forked/fonts")
;use utf-8 encode
(load "non_forked/utf-8")
;repeate create the scratch buffer
(load "non_forked/scratch")
;define some shell grep command to help the search
(load "non_forked/grep")
;set the output gui
(load "non_forked/diff")
;config the ido plugin
(load "non_forked/ido")
;config the dired plugin
(load "non_forked/dired")
;recent files
(load "non_forked/recentf")
;kill region
(load "non_forked/rectangle")
;org-mode
(load "non_forked/org")
;folding methods
(load "non_forked/zoom")
;flymake GUI
(load "non_forked/flymake")
;config the js mode
(load "non_forked/javascript")
;config ruby mode with ri-nari plugin
(load "non_forked/ri-emacs")
;server-mode ?
(load "non_forked/server-mode")
;cofig shell mode
(load "non_forked/shell-mode")
;my personal color-theme
;(load "non_forked/color-theme")

;; (load "non_forked/hl-line")
;; (load "non_forked/iswitchb")
(load "non_forked/sr-speedbar")



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
;add scss mode support
(vendor 'scss-mode)
;add scss mode support
;(vendor 'flymake)

;; (vendor 'ruby-electric 'ruby-electric-mode)
;; (vendor 'auctex)

;; python lint
;; TODO make clear why the position so important
(load "non_forked/python-pep8")
(load "non_forked/python-pylint")

(setq custom-file "~/.emacs.d/non_forked/custom.el")
(load custom-file 'noerror) ;;well , the color theme is not the one~
