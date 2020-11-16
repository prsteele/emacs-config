(use-package python
  :after (reformatter eglot)
  :hook
  ((python-mode . isort-format-on-save-mode))
  ((python-mode . eglot-ensure))
  :config
  (defvar-local isort-command "isort" "The command to run when applying isort formatting")

  (reformatter-define isort-format
    :program isort-command
    :args '("-")
    :lighter " isort"))

(use-package python-environment)

(use-package eglot
  :bind
  (:map eglot-mode-map
        ("C-." . 'xref-find-definitions)
        ("C-," . 'xref-pop-marker-stack)))

(use-package virtualenvwrapper
  :custom
  (venv-location (expand-file-name "~/.virtualenvs"))
  (python-environment-directory venv-location)
  (python-shell-interpreter "python")
  (python-shell-interpreter-args "-i"))

(use-package python-black
  :after python
  :diminish (python-black-on-save-mode . "black")
  :hook
  ((python-mode . python-black-on-save-mode)))
