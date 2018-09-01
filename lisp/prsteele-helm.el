(safely-configure
 '(helm
   helm-config
   helm-eshell
   helm-files
   helm-grep)
 (global-set-key (kbd "C-c h") 'helm-command-prefix)
 (global-unset-key (kbd "C-x c"))

 (global-set-key (kbd "C-x C-f") 'helm-find-files)
 (global-set-key (kbd "M-x") 'helm-M-x)

 (define-key helm-map (kbd "<tab>") 'helm-execute-persistent-action)
 (define-key helm-map (kbd "C-i") 'helm-execute-persistent-action)
 (define-key helm-map (kbd "C-z") 'helm-select-action)

 (global-set-key (kbd "C-h SPC") 'helm-all-mark-rings)
 
 (define-key helm-grep-mode-map (kbd "<return>")  'helm-grep-mode-jump-other-window)
 (define-key helm-grep-mode-map (kbd "n")  'helm-grep-mode-jump-other-window-forward)
 (define-key helm-grep-mode-map (kbd "p")  'helm-grep-mode-jump-other-window-backward)
 
 (setq
  helm-quick-update t
  helm-split-window-in-side-p t
  helm-buffers-fuzzy-matching t
  helm-move-to-line-cycle-in-source t
  helm-ff-search-library-in-sexp t
  helm-scroll-amount 8
  helm-ff-file-name-history-use-recentf t)

 (safely-configure
  'company
  (eval-after-load 'company
    '(progn
       (define-key company-mode-map (kbd "C-:") 'helm-company)
       (define-key company-active-map (kbd "C-:") 'helm-company)
       (define-key company-mode-map (kbd "C-;") 'helm-company)
       (define-key company-active-map (kbd "C-;") 'helm-company))))
  
 (helm-mode 1)

 (safely-configure
  '(projectile
    helm-projectile)
  (projectile-global-mode))
 
 (define-key projectile-mode-map (kbd "C-c p f") 'helm-projectile)
 (define-key projectile-mode-map (kbd "C-c p p") 'helm-projectile-switch-project)
 
 (define-key projectile-mode-map (kbd "C-c p g") 'helm-projectile-grep)
 (global-set-key (kbd "C-x b") 'helm-buffers-list)
 
 (setq helm-buffer-max-length 'nil))
