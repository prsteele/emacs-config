;;;; General configuration

;; Spawn a shell on C-z
(global-set-key (kbd "C-z") 'shell)

;; Use spaces, not tabs
(setq-default indent-tabs-mode nil)

;;; Enabling disabled commands
(mapc
 #'(lambda (x) (put x 'disabled nil))
 '(upcase-region
   downcase-region
   narrow-to-region))

(use-package exec-path-from-shell
  :config
  (exec-path-from-shell-initialize))

;; Some libraries assume this is loaded, and I don't feel like finding
;; out why. It doesn't hurt to load it anyway.
(require 'tramp)

(use-package which-key
  :config (which-key-mode)
  :diminish which-key-mode)
