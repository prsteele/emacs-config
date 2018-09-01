;;;; Julia configuration
(safely-configure
 'julia-mode
 (define-key julia-mode-map (kbd "C-c C-l") 'julia-shell-save-and-go))
