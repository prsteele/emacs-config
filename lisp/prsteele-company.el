;;;; Configuration for company

(use-package company
  :hook
  (after-init . global-company-mode)

  :bind
  (:map company-mode-map
        ("C-:" . helm-company)
        ("C-;" . helm-company))
  (:map company-active-map
        ("C-:" . helm-company)
        ("C-;" . helm-company))

  :config
  (add-to-list 'company-backends 'company-c-headers)
  (setq company-idle-delay .2))
