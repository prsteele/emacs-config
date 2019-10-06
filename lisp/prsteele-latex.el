;;;; LaTeX configuration

;; Turn on auto-fill-mode, flyspell-mode

(use-package latex-mode
  :custom
  (font-latex-script-display 'nil)
  (font-latex-fontify-script 'nil)
  (font-latex-fontify-sectioning 'color)
  (show-trailing-whitespace 't)
  (tex-font-lock-suscript 'ignore)

  :hook
  ((latex-mode . auto-fill-mode)
   (latex-mode . flyspell-mode)))
