(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(custom-safe-themes
   (quote
    ("c74e83f8aa4c78a121b52146eadb792c9facc5b1f02c917e3dbb454fca931223" "26614652a4b3515b4bbbb9828d71e206cc249b67c9142c06239ed3418eff95e2" "a27c00821ccfd5a78b01e4f35dc056706dd9ede09a8b90c6955ae6a390eb1c1e" "53e29ea3d0251198924328fd943d6ead860e9f47af8d22f0b764d11168455a8e" default)))
 '(ecb-options-version "2.40")
 '(elpy-rpc-python-command "python3")
 '(haskell-literate-default (quote tex))
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
(mapc 'load-library '("prsteele-company"
		      "prsteele-general"
                      "prsteele-color-themes"
                      "prsteele-c++"
		      "prsteele-elisp"
		      "prsteele-haskell"
                      "prsteele-helm"
                      "prsteele-helm-gtags"
		      "prsteele-latex"
                      "prsteele-java"
		      "prsteele-markdown"
		      "prsteele-magit"

                      "prsteele-org"
                      "prsteele-openwith"
                      "prsteele-projectile"
                      "prsteele-python"
                      "prsteele-rust"
		      "prsteele-sass"
		      "prsteele-scons"
                      "prsteele-mode-line"
		      ))

(load-library "/home/prsteele/Documents/Development/ampl-mode/ampl-mode")
