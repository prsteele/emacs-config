(require 'helm)
(require 'helm-config)
(require 'helm-eshell)
(require 'helm-files)
(require 'helm-grep)

;; The default of C-x c is too close to C-x C-c. This must be set
;; globally because we cannot change it once helm-config is loaded.
(global-set-key (kbd "C-c h") 'helm-command-prefix)
(global-unset-key (kbd "C-x c"))

;; Better M-x completion
(global-set-key (kbd "M-x") 'helm-M-x)

;; Better find files
(global-set-key (kbd "C-x C-f") 'helm-find-files)

(define-key helm-map (kbd "<tab>") 'helm-execute-persistent-action)
(define-key helm-map (kbd "C-i") 'helm-execute-persistent-action)
(define-key helm-map (kbd "C-z") 'helm-select-action)

(define-key helm-grep-mode-map (kbd "<return>")
  'helm-grep-mode-jump-other-window)
(define-key helm-grep-mode-map (kbd "n")
  'helm-grep-mode-jump-other-window-forward)
(define-key helm-grep-mode-map (kbd "p")
  'helm-grep-mode-jump-other-window-backward)

(when (executable-find "curl")
  (setq helm-google-suggest-use-curl-p t))

(setq helm-quick-update                      t ; do not display
                                               ; invisible candidates
      helm-split-window-in-side-p            t ; open helm buffer
                                               ; inside the current
                                               ; window rather than an
                                               ; adjacent one
      helm-buffers-fuzzy-matching            t
      helm-move-to-line-cycle-in-source      t ; connect the start and
                                               ; end of the page as a
                                               ; cycle
      helm-ff-search-library-in-sexp         t ; search for libraries
                                               ; in 'require' and
                                               ; 'declare-function'
                                               ; sexps
      helm-scroll-amount                     8
      helm-ff-file-name-history-use-recentf  t)

(helm-mode 1)


