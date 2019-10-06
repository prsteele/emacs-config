(use-package helm-config)

(use-package helm
  :bind
  (("M-x" . helm-M-x)
   ("C-x b" . helm-buffers-list)
   ("C-h SPC" . helm-all-mark-rings)
   ("C-x C-f" . helm-find-files)
   (:map helm-command-map
         (("<tab>" . helm-execute-persistent-action)
          ("C-i" . helm-execute-persistent-action)
          ("C-z" . helm-select-action))))

  :bind-keymap
  ("C-c h" . helm-command-prefix)

  :config
  (global-unset-key (kbd "C-x c"))

  :custom
  (helm-quick-update t)
  (helm-split-window-in-side-p t)
  (helm-buffers-fuzzy-matching t)
  (helm-move-to-line-cycle-in-source t)
  (helm-ff-search-library-in-sexp t)
  (helm-scroll-amount 8)
  (helm-ff-file-name-history-use-recentf t)
  (helm-buffer-max-length . nil)

  :init
  (helm-mode 1))

(use-package helm-grep
  :bind
  (:map helm-grep-mode-map
        ("<return>" . helm-grep-mode-jump-other-window)
        ("n" . helm-grep-mode-jump-other-window-forward)
        ("p" . helm-grep-mode-jump-other-window-backward)))

(use-package helm-eshell)
(use-package helm-files)
