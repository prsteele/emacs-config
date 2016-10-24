;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;
;; General configuration
;;

;; Make Emacs automatically match parenthesis, etc
(show-paren-mode 't)

;; Turn on column numbering
(column-number-mode 't)

;; Enable upcase-region and downcase-region command
(put 'upcase-region 'disabled nil)
(put 'downcase-region 'disabled nil)

;; Remove the toolbar, scroll bars, and menu bar; has to be done down
;; here, rather than at the top for some reason.
(menu-bar-mode -1)
(tool-bar-mode -1)
(set-scroll-bar-mode 'nil)

;; Spawn a shell
(global-set-key (kbd "C-z") (lambda ()
                              (interactive)
                              (ansi-term "/bin/bash")))

;; Don't use tabs
(setq-default indent-tabs-mode nil)

;; Ubuntu 14.04 has a miserable default font in Emacs.
(add-to-list 'default-frame-alist '(font . "mononoki 14"))
(set-frame-font "mononoki 14" nil t)
