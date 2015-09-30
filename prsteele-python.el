;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;
;; Python
;;

;; (add-to-list 'package-archives
;;              '("elpy" . "http://jorgenschaefer.github.io/packages/"))

;; (elpy-enable)

;; ;; Turn off highlight-indentation-mode
;; (add-hook 'elpy-mode-hook (lambda () 
;;                             (highlight-indentation-mode 0)))

;; (define-key elpy-mode-map (kbd "<RET>") 'newline-and-indent)

;; (setq elpy-rpc-python-command "python3")

(define-key python-mode-map (kbd "<RET>") 'newline-and-indent)

(require 'company-jedi)
(add-to-list 'company-backends 'company-jedi)

(add-hook 'python-mode-hook 'jedi:setup)
(setq jedi:setup-keys t)
(setq jedi:complete-on-dot t)

;; (eval-after-load "python"
;;   '(define-key python-mode-map "\C-cx" 'jedi-direx:pop-to-buffer))
;; (add-hook 'jedi-mode-hook 'jedi-direx:setup)
