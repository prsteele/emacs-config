;;;; Haskell configuration

(use-package haskell-mode
  :custom
  (haskell-stylish-on-save t)
  (haskell-mode-stylish-haskell-path "stylish-haskell")
  (haskell-process-path-stack "~/.local/bin/stack"))

(use-package haskell-process)

(use-package haskell-interactive-mode
  :hook
  (haskell-mode . interactive-haskell-mode))
