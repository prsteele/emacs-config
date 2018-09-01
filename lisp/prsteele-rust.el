;;;; Rust configuration
(safely-configure
 'rust-mode
 (add-hook 'rust-mode-hook 'flycheck-mode)
 (add-hook 'rust-mode-hook 'auto-complete-mode))
