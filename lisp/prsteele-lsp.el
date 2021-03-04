
;;; lsp-ui integration
;; LSP
(use-package flycheck)

(use-package lsp-mode
  :commands lsp
  :custom
  (lsp-enable-snippet nil)
  (lsp-prefer-flymake nil)
  (lsp-signature-auto-activate nil)
  :config
  (define-key lsp-mode-map [remap xref-find-apropos] #'helm-lsp-workspace-symbol))

(use-package lsp-ui
  :commands lsp-ui-mode

 :bind
 (:map lsp-ui-mode-map
       ("C-c ?" . 'lsp-ui-doc-show)
       ("C-." . 'lsp-ui-peek-find-definitions)
       ("M-." . 'lsp-ui-peek-find-references)
       ("C-," . 'xref-pop-marker-stack)))

(use-package eglot
  :bind
  (:map eglot-mode-map
        ("C-." . 'xref-find-definitions)
        ("C-," . 'xref-pop-marker-stack)
        ("C-c ?" . 'eglot-help-at-point)
        ("C-c C-c" . 'eglot-code-actions)))
