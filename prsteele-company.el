(require 'company)
(add-hook 'after-init-hook 'global-company-mode)

(add-to-list 'company-backends 'company-c-headers)

;(add-to-list 'company-c-headers-path-system "/usr/include/c++/4.8/")
