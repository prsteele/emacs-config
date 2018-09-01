;;;; Markdown configuration

(safely-configure
 'markdown-mode
 (add-to-list 'auto-mode-alist '("\\.md" . markdown-mode))
 (add-hook 'markdown-mode-hook 'flyspell-mode)
 (add-hook 'markdown-mode-hook 'auto-fill-mode))
