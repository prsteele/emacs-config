;;;; Markdown configuration

(use-package markdown-mode
  :hook
  ((markdown-mode-hook . flyspell-mode)
   (markdown-mode-hook . auto-fill-mode))
  :config
  (add-to-list 'auto-mode-alist '("\\.md" . markdown-mode)))
