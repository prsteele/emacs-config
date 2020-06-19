(use-package python-environment)

(use-package lsp-pyls
  :hook
  ((python-mode . lsp)))

(use-package virtualenvwrapper
  :custom
  (venv-location (expand-file-name "~/.virtualenvs"))
  (python-environment-directory venv-location)
  (python-shell-interpreter "python")
  (python-shell-interpreter-args "-i"))
