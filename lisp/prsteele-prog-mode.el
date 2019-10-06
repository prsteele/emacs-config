(use-package prog-mode
  :hook
  ((prog-mode . display-line-numbers-mode)
   (prog-mode . electric-pair-mode)
   (prog-mode . which-function-mode))

  :bind
  (:map prog-mode-map
        ("<return>" . newline-and-indent))

  :custom
  (show-trailing-whitespace 't))
