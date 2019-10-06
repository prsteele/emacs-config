(use-package python-environment)

(use-package company-jedi
  :after (python-environment)
  :demand
  :hook
  ((python-mode . jedi:setup)
   (python-mode . company-mode))

  :custom
  (venv-location (expand-file-name "~/.virtualenvs"))
  (python-environment-directory venv-location)
  (jedi:environment-root "jedi")
  (jedi:environment-virtualenv
   (append python-environment-virtualenv
           '("--python" "/usr/bin/python3.7")))
  (jedi:setup-keys 't)
  (jedi:complete-on-dot 't)
  (python-shell-interpreter "python")
  (python-shell-interpreter-args "-i")

  :config
  (add-to-list 'company-backends 'company-jedi))
