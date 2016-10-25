(mapc '(lambda (hook)
         (add-hook 'text-mode-hook hook))
      '(auto-fill-mode
        flyspell-mode))
