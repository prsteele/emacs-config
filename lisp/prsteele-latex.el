;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;
;; LaTeX and AuxTeX Mode
;;

;; Turn on auto-fill-mode, flyspell-mode
(mapc (lambda (hook) (progn (add-hook hook 'auto-fill-mode)
			    (add-hook hook 'flyspell-mode)
                            (fset 'tex-font-lock-suscript 'ignore)))
      '(LaTeX-mode-hook tex-mode-hook plain-TeX-mode-hook 
			AmS-TeX-mode-hook ConTeXt-mode-hook 
			Texinfo-mode-hook docTeX-mode-hook))

;; Disable font-locking for sub- and super-scripts in the various
;; AuxTeX modes
(setq font-latex-script-display 'nil)
(setq font-latex-fontify-script 'nil)
(setq font-latex-fontify-sectioning 'color)

(setenv "TEXINPUTS" ".:~/share//:")
