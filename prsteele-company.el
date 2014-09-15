(require 'company)
(add-hook 'after-init-hook 'global-company-mode)

(add-to-list 'company-backends 'company-c-headers)

(setq company-idle-delay .2)

;(add-to-list 'company-c-headers-path-system "/usr/include/c++/4.8/")
