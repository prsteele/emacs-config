;;;; Python configuration

;;; Jedi interaction with Company
(safely-configure
 'company-jedi
 (add-to-list 'company-backends 'company-jedi)

 ;; Point Jedi to the virtualenvs
 (setq venv-location (expand-file-name "~/.virtualenvs"))
 (setq python-environment-directory venv-location)

 ;; Basic Jedi setup
 (add-hook 'python-mode-hook 'jedi:setup)
 (setq jedi:environment-root "jedi")
 (setq jedi:environment-virtualenv
       (append python-environment-virtualenv
               '("--python" "/usr/bin/python3.6")))
 (setq jedi:setup-keys t)
 (setq jedi:complete-on-dot t)

 (setq python-shell-interpreter "python"
       python-shell-interpreter-args "-i"))

(safely-configure
 'python-black
 (add-hook 'python-mode-hook 'python-black-on-save-mode))
