(defcustom prsteele-python-mode-lsp-server-path
  "pyls"
  "The path to the Python language server program"
  :type 'string
  :safe 'stringp
  :group 'prsteele)

(defun eglot-python-lsp-server-fn (was-interactive)
  "A function to compute the LSP server for Python"
  (list prsteele-python-mode-lsp-server-path))

(defvar-local isort-command "isort" "The command to run when applying isort formatting")

(reformatter-define isort-format
  :program isort-command
  :args '("-")
  :lighter " isort")

(defvar-local black-command "black" "The command to run when applying isort formatting")

(reformatter-define black-format
  :program black-command
  :args '("-")
  :lighter " black")

(use-package python
  :after (reformatter eglot)
  :bind
  (:map python-mode-map
        (("C-c C-l" . python-shell-send-buffer)))
  :hook
  ((python-mode . isort-format-on-save-mode))
  ((python-mode . black-format-on-save-mode))
  ((python-mode . eglot-ensure))
  :config
  (add-to-list 'eglot-server-programs '(python-mode . eglot-python-lsp-server-fn))
  )

(use-package python-environment)

(use-package virtualenvwrapper
  :custom
  (venv-location (expand-file-name "~/.virtualenvs"))
  (python-environment-directory venv-location)
  (python-shell-interpreter "python")
  (python-shell-interpreter-args "-i"))
