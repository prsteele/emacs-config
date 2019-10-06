(use-package helm-gtags
  :bind
  (:map helm-gtags-mode-map
        ("M-s" . helm-gtags-select)
        ("M-." . helm-gtags-dwim)
        ("M-," . helm-gtags-pop-stack)
        ("C-c <" . helm-gtags-previous-history)
        ("C-c >" . helm-gtags-next-history))
  :hook
  ((c-mode . helm-gtags-mode)
   (c++-mode . helm-gtags-mode)
   (java-mode . helm-gtags-mode)
   (asm-mode . helm-gtags-mode)
   (dired-mode . helm-gtags-mode)
   (eshell-mode . helm-gtags-mode))

  :custom
  (helm-gtags-ignore-case t)
  (helm-gtags-auto-update t)
  (helm-gtags-use-input-at-cursor t)
  (helm-gtags-pulse-at-cursor t)
  (helm-gtags-suggested-key-mapping t)
  (helm-gtags-prefix-key "C-c g"))
