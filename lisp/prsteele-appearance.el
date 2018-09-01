;;;; Configuration for appearances

(menu-bar-mode -1)
(tool-bar-mode -1)
(set-scroll-bar-mode 'nil)
(show-paren-mode 't)
(column-number-mode 't)

(let ((myfont "mononoki 11"))
  (add-to-list 'default-frame-alist `(font . ,myfont))
  (set-frame-font myfont nil t))

(safely-configure
 'solarized-theme
 (load-theme 'solarized t))

(safely-configure
 'rainbow-delimiters
 (add-hook 'prog-mode-hook 'rainbow-delimiters-mode))
