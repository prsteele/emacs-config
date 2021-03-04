(use-package proof-general
  :bind
  (:map coq-mode-map
        (("RET" . newline-and-indent)))
  :custom
  (coq-compile-before-require t)
  :custom-face
  (proof-locked-face ((t (:extend t :background "#073642"))))
  (proof-queue-face ((t (:extend t :background "#d33682"))))
  :hook
  ((coq-mode . company-coq-mode)))
