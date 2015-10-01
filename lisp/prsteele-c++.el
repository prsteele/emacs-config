;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;
;; C, C++
;;

(add-hook 'c-mode-hook 
	  '(lambda ()
	     (local-set-key (kbd "RET") 'newline-and-indent)))

(add-hook 'c++-mode-hook 
	  '(lambda ()
	     (local-set-key (kbd "RET") 'newline-and-indent)))
