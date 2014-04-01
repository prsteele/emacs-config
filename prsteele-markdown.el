;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;
;; Markdown
;;

(add-to-list 'auto-mode-alist '("\\.md" . markdown-mode))

(mapc '(lambda (x)
         (add-hook 'markdown-mode-hook x))
      '(auto-fill-mode flyspell-mode))

