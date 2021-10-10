(use-package prog-mode
  :after (rainbow-delimiters rainbow-identifiers)
  :bind
  (:map prog-mode-map
        ("C-." . 'xref-find-definitions)
        ("C-," . 'xref-pop-marker-stack)
        ("C-c ?" . 'eglot-help-at-point))

  :hook
  ((prog-mode . display-line-numbers-mode)
   (prog-mode . electric-pair-mode)
   (prog-mode . rainbow-delimiters-mode)
   (prog-mode . rainbow-identifiers-mode))

  :custom
  (show-trailing-whitespace 't))

(use-package comint
  :custom
  (show-trailing-whitespace nil))
