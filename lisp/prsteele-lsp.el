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
  (lsp-prefer-flymake nil)
  (lsp-signature-auto-activate nil))

(use-package lsp-ui
  :commands lsp-ui-mode

 :bind
 (:map lsp-ui-mode-map
       ("C-c ?" . 'lsp-ui-doc-show)
       ("C-." . 'lsp-ui-peek-find-definitions)
       ("M-." . 'lsp-ui-peek-find-references)
       ("C-," . 'xref-pop-marker-stack)))

(use-package lsp-haskell
 :config
 (setq lsp-haskell-process-path-hie "ghcide")
 (setq lsp-haskell-process-args-hie '())

 :custom
 (lsp-ui-doc-include-signature 't)
 (lsp-ui-doc-delay 0.75))

(define-key lsp-mode-map [remap xref-find-apropos] #'helm-lsp-workspace-symbol)
