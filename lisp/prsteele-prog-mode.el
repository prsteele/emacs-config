(use-package prog-mode
  :hook
  ((prog-mode-hook . display-line-numbers-mode)
   (prog-mode-hook . electric-pair-mode)
   (prog-mode-hook . which-function-mode))

  :bind
  (:map prog-mode-map
        ("<return>" . newline-and-indent))

  :custom
  (show-trailing-whitespace 't))
