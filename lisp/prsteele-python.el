;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;
;; Python
;;

;; Suppose for company
(require 'company-jedi)
(add-to-list 'company-backends 'company-jedi)

;; Point Jedi to the virtualenvs
(setq venv-location (expand-file-name "~/.virtualenvs"))
(setq python-environment-directory venv-location)

;; Basic Jedi setup
(add-hook 'python-mode-hook 'jedi:setup)
(setq jedi:environment-root "jedi")
(setq jedi:environment-virtualenv
      (append python-environment-virtualenv
              '("--python" "/usr/bin/python3")))
(setq jedi:setup-keys t)
(setq jedi:complete-on-dot t)

(setq python-shell-interpreter "ipython"
      python-shell-interpreter-args "-i --simple-prompt")

