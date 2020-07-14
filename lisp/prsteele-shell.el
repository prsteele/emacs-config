(use-package shell
  :hook
  ((shell-mode . disable-trailing-whitespace)))

(use-package term
  :hook
  ((term-mode . disable-trailing-whitespace)))
