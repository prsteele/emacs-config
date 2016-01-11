(mapc '(lambda (hook) (add-hook 'rst-mode-hook hook))
      '(flyspell-mode
        auto-fill-mode))
