;;; The primary configuration is in readme.org
;;
;; This file just loads enough packages to bootstrap the real configuration

;; Turn off toolbars, menubars, scrollbars, and tooltips
(when (window-system)
  (menu-bar-mode -1)
  (tool-bar-mode -1)
  (scroll-bar-mode -1)
  (tooltip-mode -1))

;; Configure the packages repositories
(require 'package)
(add-to-list 'package-archives '("melpa-stable" . "https://stable.melpa.org/packages/") t)
(add-to-list 'package-archives '("melpa" . "https://melpa.org/packages/") t)
(setq package-native-compile t)
(unless (package-installed-p 'use-package)
  (message "refreshing contents")
  (package-refresh-contents)
  (package-install 'use-package))

(eval-when-compile
  (require 'use-package)
  (require 'org-install)
  (require 'ob-tangle))

(defun reload-config ()
  "Reload the Emacs configuration file"
  (interactive)
  (org-babel-load-file "~/.emacs.d/readme.org"))

(reload-config)
