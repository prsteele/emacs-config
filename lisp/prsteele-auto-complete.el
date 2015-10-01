(require 'auto-complete)
(add-to-list 'ac-dictionary-directories "~/.emacs.d/auto-complete/ac-dict")
(add-to-list 'ac-dictionary-directories "~/.emacs.d/ac-dict-local")
(require 'auto-complete-config)
(add-to-list 'ac-modes 'latex-mode)
(ac-config-default)

;; Don't allow completion by RET
(define-key ac-completing-map [return] (lambda ()
					 "Don't allow completion by RET"
					 (interactive)
					 (progn
					   (ac-stop)
					   (newline-and-indent))))

;; Apparently flyspell makes auto-complete go very slow
(ac-flyspell-workaround)
