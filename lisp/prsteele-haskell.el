;;;; Haskell configuration

(safely-configure
 '(haskell-mode intero)
 (add-hook 'haskell-mode-hook 'intero-mode)

 (setq haskell-mode-stylish-haskell-path "stylish-haskell")

 )

;; Use customize to set haskell-stylish-on-save to 't
