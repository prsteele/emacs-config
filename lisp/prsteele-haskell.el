;;;; Haskell configuration

(use-package intero)

(use-package haskell-mode
  :hook
  (haskell-mode . intero-mode)
  :config
  (setq haskell-mode-stylish-haskell-path "stylish-haskell"))

;; Use customize to set haskell-stylish-on-save to 't
