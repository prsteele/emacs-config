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

