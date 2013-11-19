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
(setq indent-line-function `indent-relative-maybe)

;; Make Emacs automatically match parenthesis, etc
(show-paren-mode 't)

;; Turn on column numbering
(column-number-mode 't)

;; Stop C-z from backgrounding emacs and make it do something useful
;; like spawn a shell
(global-set-key "\C-z" '(lambda () (interactive) (ansi-term "/bin/bash")))

;; Enable upcase-region command
(put 'upcase-region 'disabled nil)

;; Hide the top toolbar
(tool-bar-mode nil)

;; Remove the toolbar; has to be done down here, rather than at the
;; top for some reason.
(tool-bar-mode -1)
(set-scroll-bar-mode 'nil)

(require 'color-theme)
(color-theme-billw)

