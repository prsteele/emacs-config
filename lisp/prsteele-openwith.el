;; openwith-mode configuration
;;
;; If you need to open a PDF file within Emacs, simply disable
;; openwith-mode, e.g.
;;
;;   (openwith-mode 0)
;;

(require 'openwith)
(openwith-mode t)
(setq openwith-associations '(("\\.pdf\\'" "evince" (file))))
