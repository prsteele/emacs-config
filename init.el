(require 'package)
(add-to-list 'package-archives
	     '("marmalade" . "http://marmalade-repo.org/packages/"))
(package-initialize)

;; Find local libraries
(add-to-list 'load-path "~/.emacs.d")
(progn (cd "~/.emacs.d")
       (normal-top-level-add-subdirs-to-load-path))

;; Load all my configuration files
(mapc 'load-library '("prsteele-auto-complete"
		      "prsteele-c++"
		      "prsteele-elisp"
		      "prsteele-general"
                      "prsteele-color-themes"
		      "prsteele-go"
		      "prsteele-haskell"
		      "prsteele-latex"
                      "prsteele-java"
                      "prsteele-js"
		      "prsteele-markdown"
		      "prsteele-octave"
		      "prsteele-python"
		      "prsteele-sass"
		      "prsteele-scons"
		      ))

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(haskell-literate-default (quote tex))
 '(send-mail-function (quote mailclient-send-it)))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(font-latex-subscript-face ((t nil)))
 '(font-latex-superscript-face ((t nil))))
