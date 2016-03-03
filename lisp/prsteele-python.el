;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;
;; Python
;;

;; Suppose for company
(require 'company-jedi)
(add-to-list 'company-backends 'company-jedi)

(eval-after-load "python"
  '(define-key python-mode-map (kbd "<RET>") 'newline-and-indent))

;; Basic Jedi setup
(add-hook 'python-mode-hook 'jedi:setup)
(setq jedi:environment-root "jedi")
;; (setq jedi:environment-virtualenv
;;       (append python-environment-virtualenv
;;               '("--python" "/usr/bin/python3")))
(setq jedi:setup-keys t)
(setq jedi:complete-on-dot t)
