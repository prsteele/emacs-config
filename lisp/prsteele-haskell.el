;;;; Haskell configuration

(use-package haskell-mode
  :after (reformatter eglot lsp-haskell)
  :custom
  (haskell-stylish-on-save nil)
  (haskell-mode-stylish-haskell-path "stylish-haskell")
  (haskell-process-path-stack "~/.local/bin/stack")

  :hook
  ((haskell-mode . ormolu-format-on-save-mode)
   (haskell-mode . eglot-ensure))

  :config

  (setq haskell-process-wrapper-function
        (lambda (argv) (append (list "nix-shell" "-I" "." "--command" )
                               (list (mapconcat 'identity argv " ")))))

  (add-to-list 'eglot-server-programs '(haskell-mode . ("ghcide" "--lsp")))

  (defvar-local ormolu-command "ormolu" "The command to run when applying ormolu formatting")

  (reformatter-define ormolu-format
    :program ormolu-command
    :args '()
    :lighter " ormolu")

  ;; Turn off broken flymake functions
  (setq flymake-allowed-file-name-masks
	   (remove '("\\.l?hs\\'" haskell-flymake-init)
		   flymake-allowed-file-name-masks)))

(use-package haskell-process)

(use-package haskell-interactive-mode
  :hook
  (haskell-mode . interactive-haskell-mode)

  :custom
  (haskell-process-suggest-remove-import-lines nil))

(use-package lsp-haskell
 :config
 (setq lsp-haskell-process-path-hie "ghcide")
 (setq lsp-haskell-process-args-hie '()))
