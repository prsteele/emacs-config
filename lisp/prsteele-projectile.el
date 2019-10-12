(use-package projectile
  :delight '(:eval (concat " " (projectile-project-name)))
  :bind
  (:map projectile-mode-map
        ("C-c p c" . projectile-compile-project))
  :init
  (projectile-global-mode))

(use-package helm-projectile
  :bind
  (:map projectile-mode-map
        ("C-c p f" . helm-projectile)
        ("C-c p p" . helm-projectile-switch-project)
        ("C-c p g" . helm-projectile-grep)))
