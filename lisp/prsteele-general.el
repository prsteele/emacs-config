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

(add-to-list 'exec-path "/home/prsteele/.local/bin")

(setenv "PATH" (concat (getenv "PATH") ":/home/prsteele/.local/bin"))
