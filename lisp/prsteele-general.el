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
(add-to-list 'exec-path "/home/prsteele/.ghcup/bin")

(setenv "PATH" (concat "/home/prsteele/.local/bin:" (getenv "PATH")))
(setenv "PATH" (concat "/home/prsteele/.ghcup/bin:" (getenv "PATH")))
