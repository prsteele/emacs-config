;;;; Settings for prog-mode and its children
(add-hook
 'prog-mode-hook
 '(lambda ()
    (display-line-numbers-mode 't)
    (electric-pair-mode)))
