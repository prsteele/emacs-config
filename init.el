(setq custom-file "~/.emacs.d/custom.el")
(load custom-file)

;; Pull in the system environment
(setq exec-path (append exec-path (list (getenv "PATH"))))

;; Configure the packages repositories
(require 'package)
(add-to-list 'package-archives
	     '("melpa" . "http://melpa.milkbox.net/packages/"))
(add-to-list 'package-archives
	     '("marmalade" . "http://marmalade-repo.org/packages/") t)
(package-initialize)

;; Find local libraries
(add-to-list 'load-path "~/.emacs.d/lisp")
(progn (cd "~/.emacs.d")
       (normal-top-level-add-subdirs-to-load-path))

;; Load all my configuration files
(mapc
 'load-library
 '("prsteele-ace-jump"
   "prsteele-company"
   "prsteele-color-themes"
   "prsteele-general"
   "prsteele-c++"
   "prsteele-elisp"
   "prsteele-haskell"
   "prsteele-helm"
   "prsteele-helm-gtags"
   "prsteele-latex"
   "prsteele-java"
   "prsteele-markdown"
   "prsteele-magit"
   "prsteele-mode-line"
   "prsteele-org"
   "prsteele-openwith"
   "prsteele-prog-mode"
   "prsteele-python"
   "prsteele-rst"
   "prsteele-rust"
   "prsteele-sass"
   "prsteele-sql"
   "prsteele-scons"
   "prsteele-text"
   ))
