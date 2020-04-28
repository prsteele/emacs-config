;;;; Haskell configuration

(use-package lsp-haskell
  :hook
  ((haskell-mode . lsp)))

(use-package haskell-mode
  :custom
  (haskell-stylish-on-save t)
  (haskell-mode-stylish-haskell-path "stylish-haskell"))
