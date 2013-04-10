;(setq exec-path (cons (expand-file-name "~/.gem/ruby/1.8/bin") exec-path))
(autoload 'scss-mode "scss-mode")
(add-to-list 'auto-mode-alist '("\\.scss\\'" . scss-mode))
