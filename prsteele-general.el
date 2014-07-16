;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;
;; General configuration
;;

;; Define <RET> to behave like C-j
(defun RET-behaves-as-LFD ()
  (let ((x (key-binding "\C-j")))
    (local-set-key "\C-m" x)))

;; Highlight selections
(transient-mark-mode 't)

;; Auto-indent new lines
(setq indent-line-function `indent-relative);; Make Emacs automatically match parenthesis, etc
(show-paren-mode 't)

;; Turn on column numbering
(column-number-mode 't)

;; Stop C-z from backgrounding emacs and make it do something useful
;; like spawn a shell
(global-set-key "\C-z" '(lambda () (interactive) (ansi-term "/bin/bash")))

;; Enable upcase-region and downcase-region command
(put 'upcase-region 'disabled nil)
(put 'downcase-region 'disabled nil)

;; Remove the toolbar, scroll bars, and menu bar; has to be done down
;; here, rather than at the top for some reason.
(menu-bar-mode -1)
(tool-bar-mode -1)
(set-scroll-bar-mode 'nil)

;; Don't use tabs
(setq-default indent-tabs-mode nil)

;; Ubuntu 14.04 has a miserable default font in Emacs.
(add-to-list 'default-frame-alist '(font . "Ubuntu Mono 13"))
(set-frame-font "Ubuntu Mono 13" nil t)
