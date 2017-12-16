(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(custom-safe-themes
   (quote
    ("c74e83f8aa4c78a121b52146eadb792c9facc5b1f02c917e3dbb454fca931223" default)))
 '(ecb-options-version "2.40")
 '(elpy-rpc-python-command "python3")
 '(frame-background-mode (quote dark))
 '(haskell-literate-default (quote tex))
 '(haskell-process-auto-import-loaded-modules t)
 '(haskell-process-log t)
 '(haskell-process-suggest-remove-import-lines t)
 '(send-mail-function (quote mailclient-send-it))
 '(tramp-remote-path
   (quote
    (tramp-own-remote-path tramp-default-remote-path "/bin" "/usr/bin" "/sbin" "/usr/sbin" "/usr/local/bin" "/usr/local/sbin" "/local/bin" "/local/freeware/bin" "/local/gnu/bin" "/usr/freeware/bin" "/usr/pkg/bin" "/usr/contrib/bin" "/opt/bin" "/opt/sbin" "/opt/local/bin" tramp-default-remote-path))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(default ((((background dark) (type graphic)) (:foreground "#839496" :background "#002b36")) (((background dark) (type tty) (min-colors 256)) (:foreground "brightblue" :background "brightblack")) (((background dark) (type tty) (min-colors 16)) (:foreground "brightblue" :background "brightblack")) (((background dark) (type tty) (min-colors 8)) (:foreground nil :background nil)) (((background light) (type graphic)) (:foreground "#657b83" :background "#fdf6e3")) (((background light) (type tty) (min-colors 256)) (:foreground "brightyellow" :background "brightwhite")) (((background light) (type tty) (min-colors 16)) (:foreground "brightyellow" :background "brightwhite")) (((background light) (type tty) (min-colors 8)) (:foreground nil :background nil))))
 '(font-latex-subscript-face ((t nil)))
 '(font-latex-superscript-face ((t nil)))
 '(haskell-interactive-face-compile-error ((t (:foreground "#ff4b4b" :weight bold))))
 '(org-document-title ((t (:background "#303030" :foreground "#afd7ff" :weight bold)))))

;; Pull in the system environment
(setq exec-path (append exec-path (list (getenv "PATH"))))

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
                      "prsteele-python"
                      "prsteele-rst"
                      "prsteele-rust"
		      "prsteele-sass"
                      "prsteele-sql"
		      "prsteele-scons"
		      "prsteele-text"
                      "prsteele-tramp"
		      ))

;(load-library "/home/prsteele/Documents/Development/ampl-mode/ampl-mode")

