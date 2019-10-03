;;;; LaTeX configuration

;; Turn on auto-fill-mode, flyspell-mode

(safely-configure
 'tex-mode
 (mapc (lambda (hook)
         (add-hook hook
                   '(lambda ()
                      (auto-fill-mode)
                      (flyspell-mode)
                      (fset 'tex-font-lock-suscript 'ignore)
                      (setq font-latex-script-display 'nil)
                      (setq font-latex-fontify-script 'nil)
                      (setq font-latex-fontify-sectioning 'color)
                      (setq show-trailing-whitespace 't))))
       '(LaTeX-mode-hook tex-mode-hook plain-TeX-mode-hook
			 AmS-TeX-mode-hook ConTeXt-mode-hook
			 Texinfo-mode-hook docTeX-mode-hook)))

(setenv "TEXINPUTS" ".:~/share//:")
