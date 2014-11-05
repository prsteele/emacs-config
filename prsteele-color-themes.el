;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;
;; Cycle color themes, adapted from code from
;; http://www.emacswiki.org/emacs/ColorTheme
;;

(require 'color-theme)

(color-theme-initialize)

;; The default color theme to apply
(defvar prsteele-default-color-theme 'color-theme-dark-laptop
  "The color scheme loaded when Emacs starts.")

(if (not (display-graphic-p))
    (setq prsteele-default-color-theme 'color-theme-emacs-nw))

;; The list of all color themes we cycle through. See variable
;; color-themes for a list of all installed color themes.
(defvar prsteele-color-themes '(color-theme-calm-forest
                                color-theme-charcoal-black
                                color-theme-goldenrod
                                color-theme-clarity
                                color-theme-comidia
                                color-theme-dark-laptop
                                color-theme-emacs-nw
                                color-theme-euphoria
                                color-theme-hober
                                color-theme-late-night
                                color-theme-lawrence
                                color-theme-lethe
                                color-theme-ld-dark
                                color-theme-matrix
                                color-theme-midnight
                                color-theme-shaman
                                color-theme-taming-mr-arneson
                                color-theme-taylor
                                color-theme-tty-dark
                                color-theme-pok-wob)
  "The list of color themes to cycle through.

A complete list of installed color themes can be found in the 
variable color-themes.")

(defun prsteele-theme-init ()
  "Applies the default theme, adding it to prsteele-color-themes 
if necessary, and cycles it to the front of the list."
  (interactive)
  (if (not (memq prsteele-default-color-theme prsteele-color-themes))
      (setq prsteele-color-themes (cons prsteele-default-color-theme
                                        prsteele-color-themes)))
  (while (not (eq prsteele-default-color-theme (car prsteele-color-themes)))
    (prsteele-theme-cycle))
  (prsteele-theme-apply))

(defun prsteele-theme-apply ()
  "Applies the first color theme in the list prsteele-color-themes."
  (interactive)
  (funcall (car prsteele-color-themes))
  (message "loaded %s" (car prsteele-color-themes)))

(defun prsteele-theme-cycle ()
  "Cycles the list prsteele-color-themes."
  (interactive)
  (setq prsteele-color-themes 
        (append (cdr prsteele-color-themes)
                (list (car prsteele-color-themes)))))

(defun prsteele-theme-next ()
  "Cycles the list prsteele-color-themes, then applies the new theme."
  (interactive)
  (prsteele-theme-cycle)
  (prsteele-theme-apply))

;(prsteele-theme-init)
(require 'moe-theme)
(moe-dark)
