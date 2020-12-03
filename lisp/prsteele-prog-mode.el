(use-package prog-mode
  :bind
  (:map prog-mode-map
        ("C-." . 'xref-find-definitions)
        ("C-," . 'xref-pop-marker-stack)
        ("C-c ?" . 'eglot-help-at-point))

  :hook
  ((prog-mode . display-line-numbers-mode)
   (prog-mode . electric-pair-mode))

  :custom
  (show-trailing-whitespace 't))
