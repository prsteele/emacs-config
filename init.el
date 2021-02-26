(setq custom-file "~/.emacs.d/custom.el")
(load custom-file)

(server-start)

;; Pull in the system environment
(setq exec-path (append exec-path (list (getenv "PATH"))))

;; Configure the packages repositories
(require 'package)

(setq load-prefer-newer t)

(add-to-list 'package-archives
             (cons "melpa-stable" "https://stable.melpa.org/packages/") t)
(add-to-list 'package-archives
             (cons "melpa" "https://melpa.org/packages/") t)

(package-initialize)

;; Find local libraries
(add-to-list 'load-path "~/.emacs.d/lisp")
(add-to-list 'load-path "~/.emacs.d/submodules/lsp-haskell")

;; We use use-package to configure all packages
(require 'use-package)

(defun disable-trailing-whitespace () (setq show-trailing-whitespace nil))

;; Remove a stray LD_PRELOAD
(setenv "LD_PRELOAD" "")

;; Load all my configuration files
(mapc
 'load-library
 '("prsteele-ace-jump"
   "prsteele-appearance"
   "prsteele-coq"
   "prsteele-compilation"
   "prsteele-company"
   "prsteele-eldoc"
   "prsteele-elisp"
   "prsteele-flycheck"
   "prsteele-flymake"
   "prsteele-general"
   "prsteele-haskell"
   "prsteele-helm"
   "prsteele-julia"
   "prsteele-latex"
   "prsteele-lsp"
   "prsteele-magit"
   "prsteele-markdown"
   "prsteele-mode-line"
   "prsteele-nix"
   "prsteele-org"
   "prsteele-prog-mode"
   "prsteele-projectile"
   "prsteele-python"
   "prsteele-rst"
   "prsteele-sass"
   "prsteele-scons"
   "prsteele-shell"
   "prsteele-sql"
   "prsteele-text"
   "prsteele-which-function"
   "prsteele-zettelkasten"
   ))
