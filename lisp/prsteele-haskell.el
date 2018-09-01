;;;; Haskell configuration

(safely-configure
 '(haskell-mode intero)
 (add-hook 'haskell-mode-hook 'intero-mode))
