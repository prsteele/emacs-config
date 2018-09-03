;;;; which-function-mode configuration

;; We need to remove the which-function-mode configuration from the
;; mode line. It currently resides in mode-line-misc-info
(setq
 mode-line-misc-info
 (delete
  (assoc 'which-function-mode mode-line-misc-info)
  mode-line-misc-info))

(copy-face 'which-func 'font-lock-constant-face)

(which-function-mode)

(setq which-func-unknown '(:propertize "---" 'face 'font-lock-comment-face))

(setq
 my-which-func-format
 '(""
   "λ["
   (:propertize which-func-current
		local-map ,which-func-keymap
		face font-lock-function-name-face
		mouse-face mode-line-highlight
		help-echo "mouse-1: go to beginning\n\
mouse-2: toggle rest visibility\n\
mouse-3: go to end")
   "]"))

(safely-configure
 'cc-mode
 (add-hook
  'prog-mode-hook
  (lambda ()
    (setq
     header-line-format
     `("" ,my-which-func-format " ")))))
