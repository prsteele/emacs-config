;;; lsp-ui integration
;; LSP
(use-package flycheck
  :hook
  (haskell-mode . flycheck-mode))

;; (use-package yasnippet)

(use-package lsp-mode
  :hook (haskell-mode . lsp)
  :commands lsp
  :custom
  (lsp-enable-snippet nil)
  (lsp-prefer-flymake nil))

(use-package lsp-ui
  :commands lsp-ui-mode)

(use-package lsp-haskell
 :config
 (setq lsp-haskell-process-path-hie "ghcide")
 (setq lsp-haskell-process-args-hie '())
 )
