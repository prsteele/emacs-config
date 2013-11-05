;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;
;; GO
;;
(add-to-list 'load-path "~/lib/go/misc/emacs")
(if (require 'go-mode-load nil t)
    (progn
      (add-hook 'go-mode-hook
		'(lambda ()
		   (setq default-tab-width 2)))
      (add-hook 'before-save-hook #'gofmt-before-save)
      (add-hook 'go-mode-hook 
		(lambda () 
		  (progn
		    (local-set-key (kbd "C-c C-r") 'go-remove-unused-imports)
		    (local-set-key (kbd "C-c C-a") 'go-import-add)
		    (local-set-key (kbd "C-c C-i") 'go-goto-imports))))))
