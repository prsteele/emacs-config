;;; Custom variables and faces.
;;
;; This section should be modified only programmatically.
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(custom-safe-themes
   (quote
    ("3c83b3676d796422704082049fc38b6966bcad960f896669dfc21a7a37a748fa" default)))
 '(ecb-options-version "2.40")
 '(elpy-rpc-python-command "python3")
 '(haskell-literate-default (quote tex))
 '(haskell-process-auto-import-loaded-modules t)
 '(haskell-process-log t)
 '(haskell-process-suggest-remove-import-lines t)
 '(send-mail-function (quote mailclient-send-it)))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(font-latex-subscript-face ((t nil)))
 '(font-latex-superscript-face ((t nil)))
 '(haskell-interactive-face-compile-error ((t (:foreground "#ff4b4b" :weight bold))))
 '(org-document-title ((t (:background "#303030" :foreground "#afd7ff" :weight bold)))))

;;; Import paths
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
(mapc 'load-library '("prsteele-ace-jump"
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
                      "prsteele-projectile"
                      "prsteele-python"
                      "prsteele-rst"
                      "prsteele-rust"
		      "prsteele-sass"
		      "prsteele-scons"
		      "prsteele-text"
		      ))

;(load-library "/home/prsteele/Documents/Development/ampl-mode/ampl-mode")
