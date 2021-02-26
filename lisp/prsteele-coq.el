(use-package proof-general
  :bind
  (:map coq-mode-map
        (("RET" . newline-and-indent)))
  :custom
  (coq-compile-before-require . 't)
  (proof-locked-face))
