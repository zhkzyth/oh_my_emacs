;add template support for new files



;To load python templates
(add-hook 'find-file-hook 'maybe-load-template)

(defun maybe-load-template()
 (interactive)
 (when (and
        (string-match "\\.py$" (buffer-file-name))
        (eq 1 (point-max)))
  (insert-file "~/.emacs.d/templates/template.py")
        ))
