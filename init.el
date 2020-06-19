(setq custom-file "~/.emacs.d/custom.el")
(load custom-file)

;; Pull in the system environment
(setq exec-path (append exec-path (list (getenv "PATH"))))

;; Configure the packages repositories
(require 'package)

(setq load-prefer-newer t)

(add-to-list 'package-archives
             (cons "melpa" "https://stable.melpa.org/packages/") t)

(package-initialize)

;; Find local libraries
(add-to-list 'load-path "~/.emacs.d/lisp")
(add-to-list 'load-path "~/.emacs.d/submodules/lsp-haskell")

;; We use use-package to configure all packages
(require 'use-package)

;; Load all my configuration files
(mapc
 'load-library
 '("prsteele-ace-jump"
   "prsteele-appearance"
   "prsteele-compilation"
   "prsteele-company"
   "prsteele-elisp"
   "prsteele-flycheck"
   "prsteele-general"
   "prsteele-haskell"
   "prsteele-helm"
   "prsteele-helm-gtags"
   "prsteele-julia"
   "prsteele-latex"
   "prsteele-lsp"
   "prsteele-magit"
   "prsteele-markdown"
   "prsteele-mode-line"
   "prsteele-org"
   "prsteele-prog-mode"
   "prsteele-projectile"
   "prsteele-python"
   "prsteele-rst"
   "prsteele-sass"
   "prsteele-scons"
   "prsteele-sql"
   "prsteele-text"
   "prsteele-which-function"
   ))
