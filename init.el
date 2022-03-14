;;; The primary configuration is in readme.org
;;
;; This file just loads enough packages to bootstrap the real configuration

(setq custom-file "~/.emacs.d/custom.el")
(load custom-file)

(server-start)

;; Configure the packages repositories
(require 'package)

(setq load-prefer-newer t)

(add-to-list 'package-archives
             (cons "melpa-stable" "https://stable.melpa.org/packages/") t)
(add-to-list 'package-archives
             (cons "melpa" "https://melpa.org/packages/") t)
(setq package-native-compile t)
(unless (package-installed-p 'use-package)
  (message "refreshing contents")
  (package-refresh-contents)
  (package-install 'use-package))

(eval-when-compile
  (require 'use-package)
  (require 'org-install)
  (require 'ob-tangle))

(defun reload-config ()
  "Reload the Emacs configuration file"
  (interactive)
  (org-babel-load-file "~/.emacs.d/readme.org"))

(reload-config)

;; Pull in the system environment
(setq exec-path (append exec-path (list (getenv "PATH"))))

;; Pull in NIX_PATH
(setenv "NIX_PATH" "/home/prsteele/.nix-defexpr/channels:nixpkgs=/nix/var/nix/profiles/per-user/root/channels/nixos:nixos-config=/etc/nixos/configuration.nix:/nix/var/nix/profiles/per-user/root/channels")
