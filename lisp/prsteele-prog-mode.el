;;;; Settings for prog-mode and its children
(safely-configure
 'cc-mode
 (add-hook
  'prog-mode-hook
  '(lambda ()
     (display-line-numbers-mode 't)
     (electric-pair-mode)
     (setq show-trailing-whitespace 't))))
