(use-package python-environment)

(use-package company-jedi
  :after (python-environment)
  :demand
  :hook
  ((python-mode . jedi:setup)
   (python-mode . company-mode))

  :config
  (setq venv-location (expand-file-name "~/.virtualenvs"))
  (setq python-environment-directory venv-location)
  (setq jedi:environment-root "jedi")
  (setq jedi:environment-virtualenv
   (append python-environment-virtualenv
           '("--python" "/usr/bin/python3.7")))
  (setq jedi:setup-keys 't)
  (setq jedi:complete-on-dot 't)
  (setq python-shell-interpreter "python")
  (setq python-shell-interpreter-args "-i")
  (add-to-list 'company-backends 'company-jedi))
