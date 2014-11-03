;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;
;; Python
;;

(add-to-list 'package-archives
             '("elpy" . "http://jorgenschaefer.github.io/packages/"))

(elpy-enable)

;; Turn off highlight-indentation-mode
(add-hook 'elpy-mode-hook (lambda () 
                            (highlight-indentation-mode 0)))

(define-key elpy-mode-map (kbd "<RET>") 'newline-and-indent)

(setq elpy-rpc-python-command "python3")
