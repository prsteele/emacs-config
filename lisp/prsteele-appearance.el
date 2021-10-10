;;;; Configuration for appearances

(menu-bar-mode -1)
(tool-bar-mode -1)
(set-scroll-bar-mode 'nil)
(show-paren-mode 't)
(column-number-mode 't)

;(add-to-list 'default-frame-alist '(font . "Mononoki 11"))

(set-frame-font "Noto Sans Mono 12")

(use-package solarized-theme
  :init
  (load-theme 'solarized-dark t))

(use-package rainbow-delimiters)
(use-package rainbow-identifiers)

;; Allow Emacs to resize properly with window managers
(setq frame-resize-pixelwise t)
