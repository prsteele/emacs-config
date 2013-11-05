(require 'auto-complete)
(add-to-list 'ac-dictionary-directories "~/.emacs.d/auto-complete/ac-dict")
(require 'auto-complete-config)
(ac-config-default)

;; Don't allow completion by RET
(define-key ac-completing-map [return] (lambda ()
					 "Don't allow completion by RET"
					 (interactive)
					 (progn
					   (ac-stop)
					   (newline-and-indent))))


