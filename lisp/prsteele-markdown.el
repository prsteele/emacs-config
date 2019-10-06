;;;; Markdown configuration

(use-package markdown-mode
  :hook
  ((markdown-mode . flyspell-mode)
   (markdown-mode . auto-fill-mode))
  :config
  (add-to-list 'auto-mode-alist '("\\.md" . markdown-mode)))
