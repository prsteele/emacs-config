;;; lsp-ui integration
;; LSP
(use-package flycheck)

(use-package lsp-mode
  :commands lsp
  :diminish "LSP"
  :hook
  ((lsp-mode . lsp-enable-which-key-integration))
  :custom
  (lsp-enable-snippet nil)
  (lsp-prefer-flymake nil)
  (lsp-signature-auto-activate nil))

(use-package lsp-ui
  :commands lsp-ui-mode

 :bind
 (:map lsp-ui-mode-map
       ("C-c ?" . 'lsp-ui-doc-show-or-focus)
       ("C-." . 'lsp-ui-peek-find-definitions)
       ("M-." . 'lsp-ui-peek-find-references)
       ("C-," . 'xref-pop-marker-stack)
       ("C-c r" . 'lsp-rename)))

(defun lsp-ui-doc-show-or-focus (arg)
  (interactive "P")
  (if arg
      (lsp-ui-doc-focus-frame)
    (lsp-ui-doc-show)))

(use-package lsp-ui-doc
  ;; :hook
  ;; ((lsp-ui-doc-frame . (lambda (frame window) (message "got here"))))
  :bind
  (:map lsp-ui-doc-frame-mode-map
        ("C-c ?" . 'lsp-ui-doc-unfocus-frame)))

(add-hook
 'lsp-ui-doc-frame-hook
 (lambda (frame window)
   (set-frame-font "Noto Sans Mono 12" nil (list frame))))

(use-package helm-lsp
  :commands helm-lsp-workspace-symbol)

(use-package eglot
  :bind
  (:map eglot-mode-map
        ("C-." . 'xref-find-definitions)
        ("C-," . 'xref-pop-marker-stack)
        ("C-c ?" . 'eglot-help-at-point)
        ("C-c C-c" . 'eglot-code-actions)))
