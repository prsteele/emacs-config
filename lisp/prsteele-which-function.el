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

(defconst
 my-which-func-current
 '(:eval (replace-regexp-in-string
	  "%" "%%"
          (let ((current-function (gethash (selected-window) which-func-table)))
            (if current-function
                (propertize
                 current-function
                 'face 'font-lock-function-name-face)
              (propertize "---" 'face 'shadow))))))

(setq
 my-which-func-format
 `("λ["
   (:propertize my-which-func-current
		local-map ,which-func-keymap
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
     `("" ,my-which-func-format)))))

(format-mode-line header-line-format)
