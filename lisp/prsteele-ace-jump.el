;;;; Configuration for ace-jump-mode

(safely-configure
 'ace-jump-mode
 (define-key global-map (kbd "C-c SPC") 'ace-jump-mode))
