;;;; which-function-mode configuration

(use-package which-func
  :config
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

  (defconst
    my-which-func-format
    `("λ["
      (:propertize my-which-func-current
		   local-map ,which-func-keymap
		   mouse-face mode-line-highlight
		   help-echo "mouse-1: go to beginning\n\
mouse-2: toggle rest visibility\n\
mouse-3: go to end")
      "]"))

  (defconst my-which-func-header-line-format
    '(which-function-mode ("" my-which-func-format)))

  (defadvice which-func-ff-hook (after header-line activate)
    (when which-func-mode
      ;; We need to remove the which-function-mode configuration from the
      ;; mode line. It currently resides in mode-line-misc-info
      (setq
       mode-line-misc-info
       (delete
        (assoc 'which-function-mode mode-line-misc-info)
        mode-line-misc-info))
      ;; Set the header line
      (setq
       header-line-format
       my-which-func-header-line-format))))
