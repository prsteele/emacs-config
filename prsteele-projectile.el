(require 'projectile)

(projectile-global-mode)

;(global-set-key (kbd "C-c p f") 'helm-projectile)
(define-key projectile-mode-map (kbd "C-c p f") 'helm-projectile)
