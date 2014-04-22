;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;
;; Java
;;

(add-hook 'java-mode-hook 
	  '(lambda ()
	     (local-set-key (kbd "RET") 'newline-and-indent)))
(add-hook 'java-mode-hook 
	  '(lambda ()
	     (setq c-basic-offset 2)))

