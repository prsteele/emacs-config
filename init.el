;; -*- coding: utf-8; lexical-binding: t -*-

;; Turn off toolbars, menubars, scrollbars, and tooltips.
;;
;; We do this now to avoid flickering during load.
(require 'cl-lib)
(cl-flet ((f ()
            (when (window-system)
             (menu-bar-mode -1)
             (tool-bar-mode -1)
             (scroll-bar-mode -1)
             (tooltip-mode -1))))
  ;; Turn off decoration in the current frame
  (f)
  ;; and future frames
  (add-hook 'server-after-make-frame-hook (lambda () (f))))

;; Load org-based config
(use-package org)
(eval-when-compile
  (require 'org)
  (require 'ob-tangle))

(defun reload-config ()
  "Reload ~/.emacs.d/README.org"
  (interactive)
  (org-babel-load-file "~/.emacs.d/README.org"))

(reload-config)
