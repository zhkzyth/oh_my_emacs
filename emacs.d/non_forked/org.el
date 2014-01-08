;;; org-mode

(require 'org)

;; org-mode 設定
(require 'org-crypt)

;; 當被加密的部份要存入硬碟時，自動加密回去
(org-crypt-use-before-save-magic)

;; 設定要加密的 tag 標籤為 secret
(setq org-crypt-tag-matcher "secret")

;; 避免 secret 這個 tag 被子項目繼承 造成重複加密
;; (但是子項目還是會被加密喔)
(setq org-tags-exclude-from-inheritance (quote ("secret")))

;; 用於加密的 GPG 金鑰
;; 可以設定任何 ID 或是設成 nil 來使用對稱式加密 (symmetric encryption)
(setq org-crypt-key nil)

;; 映射文件类型
(add-to-list 'auto-mode-alist '("\\.org$" . org-mode))

(setq org-todo-keywords
      '((sequence "TODO" "|" "DONE" )))

(setq org-log-done 'time)
