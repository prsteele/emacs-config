(require 'projectile)

(projectile-global-mode)

(define-key projectile-mode-map (kbd "C-c p f") 'helm-projectile)
