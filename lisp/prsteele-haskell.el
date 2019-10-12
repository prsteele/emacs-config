;;;; Haskell configuration

(use-package intero
  :diminish intero-mode)

(use-package haskell-mode
  :hook
  (haskell-mode . intero-mode)
  :config
  (setq haskell-mode-stylish-haskell-path "stylish-haskell"))

;; Use customize to set haskell-stylish-on-save to 't
