;;;; openwith configuration

;; If you need to open a PDF file within Emacs, simply disable
;; openwith-mode, e.g.
;;
;;   (openwith-mode 0)

(use-package openwith
  :config
  (openwith-mode t)

  :custom
  (openwith-associations '(("\\.pdf\\'" "evince" (file)))))
