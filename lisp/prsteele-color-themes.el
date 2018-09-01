;;;; Configuration for appearances

(safely-configure
 'solarized-theme
 (load-theme 'solarized t))

(safely-configure
 'rainbow-delimiters
 (add-hook 'prog-mode-hook 'rainbow-delimiters-mode))
