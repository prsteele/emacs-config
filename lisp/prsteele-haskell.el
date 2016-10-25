;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;
;; Haskell
;;

(require 'haskell-mode)

(mapc '(lambda (hook)
         (add-hook 'haskell-mode-hook hook))
      '(interactive-haskell-mode
        haskell-indentation-mode
        haskell-doc-mode))

(customize-set-variable 'haskell-process-suggest-remove-import-lines t)
(customize-set-variable 'haskell-process-auto-import-loaded-modules t)
(customize-set-variable 'haskell-process-log t)

(define-key haskell-mode-map (kbd "C-c C-l") 'haskell-process-load-or-reload)
(define-key haskell-mode-map (kbd "C-`") 'haskell-interactive-bring)
(define-key haskell-mode-map (kbd "C-c C-t") 'haskell-process-do-type)
(define-key haskell-mode-map (kbd "C-c C-i") 'haskell-process-do-info)
(define-key haskell-mode-map (kbd "C-c C-c") 'haskell-process-cabal-build)
(define-key haskell-mode-map (kbd "C-c C-k") 'haskell-interactive-mode-clear)
(define-key haskell-mode-map (kbd "C-c c") 'haskell-process-cabal)

(define-key haskell-mode-map "\C-ch" 'haskell-hoogle)
(setq haskell-hoogle-command "hoogle")
