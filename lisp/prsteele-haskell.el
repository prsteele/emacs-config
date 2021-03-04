;;;; Haskell configuration

(defcustom prsteele-haskell-mode-lsp-server-path
  "haskell-language-server"
  "The path to the Haskell language server program"
  :type 'string
  :safe 'stringp
  :group 'prsteele)

(defun eglot-haskell-lsp-server-fn (was-interactive)
  (list prsteele-haskell-mode-lsp-server-path "--lsp"))

(use-package haskell-mode
  :after (eglot)

  :hook
  ((haskell-mode . eglot-ensure))

  :config
  (add-to-list 'eglot-server-programs '(haskell-mode . eglot-haskell-lsp-server-fn))

  (setq haskell-process-wrapper-function
        (lambda (argv) (append (list "nix-shell" "-I" "." "--command" )
                               (list (mapconcat 'identity argv " ")))))

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
