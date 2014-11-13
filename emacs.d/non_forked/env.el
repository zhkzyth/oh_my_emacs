;; Environment variables

(setq exec-path (cons "/usr/local/bin" exec-path))
(setenv "PATH" (concat "/usr/local/bin:" (getenv "PATH")))

(setq exec-path (cons "/usr/local/lib/node_modules/npm/bin" exec-path))
(setenv "PATH" (concat "/usr/local/lib/node_modules/npm/bin:" (getenv "PATH")))
