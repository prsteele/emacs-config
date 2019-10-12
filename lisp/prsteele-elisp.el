;;;; Emacs Lisp configuration

(add-hook 'emacs-lisp-mode-hook 'turn-on-eldoc-mode)

(use-package eldoc
  :diminish eldoc-mode)
