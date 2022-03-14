;;;; Haskell configuration

(defcustom ormolu-command
  "ormolu"
  "The command to run when applying ormolu formatting"
  :type 'string
  :safe 'stringp
  :group 'prsteele)

(reformatter-define ormolu-format
  :program ormolu-command
  :args '()
  :lighter " ormolu")

(use-package haskell-mode
  :hook
  ((haskell-mode . (lambda ()
                     (hack-local-variables)
                     (lsp)))
   (haskell-mode . ormolu-format-on-save-mode))

  :config
  (setq haskell-process-wrapper-function
        (lambda (argv) (append (list "nix-shell" "-I" "." "--command" )
                               (list (mapconcat 'identity argv " ")))))

  ;; Turn off broken flymake functions
  (setq flymake-allowed-file-name-masks
	   (remove '("\\.l?hs\\'" haskell-flymake-init)
		   flymake-allowed-file-name-masks))
  )

(use-package haskell-process)

(use-package haskell-interactive-mode
  :hook
  (haskell-mode . interactive-haskell-mode)

  :custom
  (haskell-process-suggest-remove-import-lines nil))
