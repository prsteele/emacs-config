(require 'helm)
(require 'helm-config)
(require 'helm-eshell)
(require 'helm-files)
(require 'helm-grep)

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

(setq helm-quick-update                     t ; do not display invisible
                                              ; candidates
      helm-split-window-in-side-p           t ; open helm buffer inside current
                                              ; window, not another whole window
      helm-buffers-fuzzy-matching           t ; fuzzy matching buffer names when
                                              ; non-nil
      helm-move-to-line-cycle-in-source     t ; move to end or beginning of
                                              ; source when reaching top or
                                              ; bottom of source.
      helm-ff-search-library-in-sexp        t ; search for library in `require'
                                              ; and `declare-function' sexp.
      helm-scroll-amount                    8 ; scroll 8 lines other window
                                              ; using M-<next>/M-<prior>
      helm-ff-file-name-history-use-recentf t)

(eval-after-load 'company
  '(progn
     (define-key company-mode-map (kbd "C-:") 'helm-company)
     (define-key company-active-map (kbd "C-:") 'helm-company)
     (define-key company-mode-map (kbd "C-;") 'helm-company)
     (define-key company-active-map (kbd "C-;") 'helm-company)))

(helm-mode 1)

(require 'projectile)
(require 'helm-projectile)
(projectile-global-mode)

(define-key projectile-mode-map (kbd "C-c p f") 'helm-projectile)
(define-key projectile-mode-map (kbd "C-c p p") 'helm-projectile-switch-project)

(define-key projectile-mode-map (kbd "C-c p g") 'helm-projectile-grep)
