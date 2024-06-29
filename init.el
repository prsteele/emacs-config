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

;; Bootstrap straight.el, and hook it into use-package
(defvar bootstrap-version)
(let ((bootstrap-file
       (expand-file-name
        "straight/repos/straight.el/bootstrap.el"
        (or (bound-and-true-p straight-base-dir)
            user-emacs-directory)))
      (bootstrap-version 7))
  (unless (file-exists-p bootstrap-file)
    (with-current-buffer
        (url-retrieve-synchronously
         "https://raw.githubusercontent.com/radian-software/straight.el/develop/install.el"
         'silent 'inhibit-cookies)
      (goto-char (point-max))
      (eval-print-last-sexp)))
  (load bootstrap-file nil 'nomessage))
(straight-use-package 'use-package)

;; Load org-based config
(use-package org
  :straight t)
(eval-when-compile
  (require 'org)
  (require 'ob-tangle))

(defun reload-config ()
  "Reload ~/.emacs.d/README.org"
  (interactive)
  (org-babel-load-file "~/.emacs.d/README.org"))

(reload-config)
