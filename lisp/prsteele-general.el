;;;; General configuration

;;; Appearance

;; Remove the menu bar
(menu-bar-mode -1)

;; Remove the tool bar
(tool-bar-mode -1)

;; Remove scroll bars
(set-scroll-bar-mode 'nil)

;; Visually match delimiters
(show-paren-mode 't)

;; Show column numbers in the mode line
(column-number-mode 't)

;; Use the Mononoki font
(let ((myfont "mononoki 11"))
  (add-to-list 'default-frame-alist `(font . ,myfont))
  (set-frame-font myfont nil t))

;;; General behavior

;; Spawn a shell on C-z
(global-set-key (kbd "C-z") 'shell)

;; Use spaces, not tabs
(setq-default indent-tabs-mode nil)

;;; Enabling disabled commands
(mapc
 '(lambda (x) (put x 'disabled nil))
 '(upcase-region
   downcase-region
   narrow-to-region))
