;; -*- coding: utf-8; lexical-binding: t -*-

;;; Intro

;; See https://github.com/patrickt/emacs for inspiration.

;; Bootstrap straight.el
(defvar bootstrap-version)
(let ((bootstrap-file
       (expand-file-name
        "straight/repos/straight.el/bootstrap.el"
        (or (bound-and-true-p straight-base-dir)
            user-emacs-directory)))
      (bootstrap-version 7))
  (unless (file-exists-p bootstrap-file)
    (with-current-buffer
        (url-retrieve-synchronously
         "https://raw.githubusercontent.com/radian-software/straight.el/develop/install.el"
         'silent 'inhibit-cookies)
      (goto-char (point-max))
      (eval-print-last-sexp)))
  (load bootstrap-file nil 'nomessage))

;; Get use-package to understand straight.el
(straight-use-package 'use-package)

;;; Window appearance
;;
;; Do this early to avoid flicker

;; Turn off toolbars, menubars, scrollbars, and tooltips
(when (window-system)
  (menu-bar-mode -1)
  (tool-bar-mode -1)
  (scroll-bar-mode -1)
  (tooltip-mode -1))

;; ...and don't let them come back in new frames
(add-hook 'server-after-make-frame-hook
          '(lambda ()
             (menu-bar-mode -1)
             (tool-bar-mode -1)
             (scroll-bar-mode -1)
             (tooltip-mode -1)))

;;; Preamble
(setq gc-cons-threshold 100000000)
(setenv "LD_PRELOAD" "")

;;; Customization
(defgroup prsteele nil
  "My customizations."
  :prefix "prsteele-"
  :group 'applications)

(setq custom-file "~/.emacs.d/custom.el")
(if (file-exists-p custom-file)
    (load custom-file)
  (message "No custom.el found, creating...")
  (touch custom-file))

;;; General

;; C-x C-x is easier on the hands
(bind-key* "C-x C-x" #'execute-extended-command)

(bind-key* (kbd "<home>") #'beginning-of-buffer)
(bind-key* (kbd "<end>") #'end-of-buffer)

;; Set a reasonable default PATH
(use-package exec-path-from-shell
  :straight t
  :config
  (exec-path-from-shell-initialize))

;; Some libraries assume tramp is loaded
(require 'tramp)

;; Support keychains
(use-package keychain-environment
  :straight t
  :config
  (keychain-refresh-environment))

;; These are taken directly from https://github.com/patrickt/emacs:
(setq
 ;; No need to see GNU agitprop.
 inhibit-startup-screen t
 ;; No need to remind me what a scratch buffer is.
 initial-scratch-message nil
 ;; Double-spaces after periods is morally wrong.
 sentence-end-double-space nil
 ;; Never ding at me, ever.
 ring-bell-function 'ignore
 ;; Save existing clipboard text into the kill ring before replacing it.
 save-interprogram-paste-before-kill t
 ;; Prompts should go in the minibuffer, not in a GUI.
 use-dialog-box nil
 ;; Fix undo in commands affecting the mark.
 mark-even-if-inactive nil
 ;; Let C-k delete the whole line.
 kill-whole-line t
 ;; search should be case-sensitive by default
 case-fold-search nil
 ;; no need to prompt for the read command _every_ time
 compilation-read-command nil
 ;; scroll to first error
 compilation-scroll-output 'first-error
 ;; accept 'y' or 'n' instead of yes/no
 ;; the documentation advises against setting this variable
 ;; the documentation can get bent imo
 use-short-answers t
 ;; eke out a little more scrolling performance
 fast-but-imprecise-scrolling t
 ;; prefer newer elisp files
 load-prefer-newer t
 ;; when I say to quit, I mean quit
 confirm-kill-processes nil
 ;; if native-comp is having trouble, there's not very much I can do
 native-comp-async-report-warnings-errors 'silent
 ;; unicode ellipses are better
 truncate-string-ellipsis "…"
 ;; I want to close these fast, so switch to it so I can just hit 'q'
 help-window-select t
 ;; this certainly can't hurt anything
 delete-by-moving-to-trash t
 )

;; Use spaces, not tabs
(setq-default indent-tabs-mode nil)

;; Use UTF-8 by default.
(set-charset-priority 'unicode)
(prefer-coding-system 'utf-8-unix)

;; Allow highlighted text to be deleted:
(delete-selection-mode t)

;; Some commands are disabled by default, and I don't want warnings
;; when I invoke them.
(mapc
 #'(lambda (x) (put x 'disabled nil))
 '(upcase-region
   downcase-region
   narrow-to-region))

;; I don't want backup files and so on.
(setq
 make-backup-files nil
 auto-save-default nil
 create-lockfiles nil)

;; I usually want two buffers visible.
(defun revert-to-two-windows ()
  "Delete all other windows and split it into two."
  (interactive)
  (delete-other-windows)
  (split-window-right))

(bind-key "C-x 1" #'revert-to-two-windows)
(bind-key "C-x !" #'delete-other-windows)

;; Appearance

;; Show line and column numbers everywhere:
(global-display-line-numbers-mode t)
(column-number-mode)

;; Highlight matching parenthesis
(show-paren-mode 't)

;; Load the first available font
(letrec ((go (lambda (fonts)
            (if-let ((font (car fonts)))
                (condition-case nil
                    (progn (set-frame-font font)
                           (message (concat "set font '" font "'")))
                  (error (funcall go (cdr fonts))))
              (message "no fonts loaded")))))
  (funcall go '(
                "FiraCode Nerd Font Mono 12"
                "FiraMono 12"
                "NotoSansM Nerd Font 12"
                "SF Mono 12")))

;; use monokai https://github.com/
(use-package monokai-theme
  :straight (monokai-theme
	     :type git
	     :host github
             :repo "oneKelvinSmith/monokai-emacs"
	     :files ("*.el"))
  :init
  (load-theme 'monokai t))

;; make delimiters and identifiers have unique colors
(use-package rainbow-delimiters
  :straight t)
(use-package rainbow-identifiers
  :straight t)

;; Fix rendering issues on some systems
(setq frame-resize-pixelwise t)

;; I almost never want trailing whitespace
(defun disable-trailing-whitespace () (setq show-trailing-whitespace nil))
(add-hook 'prog-mode-hook #'delete-trailing-whitespace)
(add-hook 'text-mode-hook #'delete-trailing-whitespace)
(setq require-final-newline t)


;; Not sure if these are actually useful yet, but we'll enable
;; recursive minibuffers
(setq enable-recursive-minibuffers t)
(minibuffer-depth-indicate-mode)

;;; Navigation
;;
;; We'll favor Emacs builtins.

;;;; Vertico

;; Minibuffer completion


;;;; Recent files
(use-package recentf
  :straight t
  :after dash
  :config
  (setq recentf-exclude (-concat recentf-exclude '("\\elpa"
                                                   "private/tmp" ; to avoid custom files
                                                   "txt/roam"
                                                   )))
  (recentf-mode))

;;; Projects

(defun find-project-local-executable (name)
  "Try to find the executable relative to the current project, falling back to `exec-path'"
  (if-let ((project (project-current))
           (local-name (expand-file-name (f-join (project-root project) name)))
           (f-exists-p local-name))
      local-name
    (executable-find name)))

;;; Completion

;;; Vertico

(use-package vertico
  :straight t
  :init
  (vertico-mode)
  )

(use-package vertico-directory
  :bind
  (:map vertico-map
        ("RET" . vertico-directory-enter)
        ("C-l" . vertico-directory-delete-word)))

(use-package vertico-buffer
  :init
  (vertico-buffer-mode)
  :custom
  (vertico-buffer-display-action '(display-buffer-below-selected (window-height . 13))))

;;;; Orderless completion
(use-package orderless
  :straight t
  :init
  (setq
   completion-styles '(orderless)
   completion-category-default nil
   completion-category-overrides '((file (styles partial-completion)))))

;;;; Marginalia

;; Add useful notes on the right of completion menus
(use-package marginalia
  :straight t
  :config (marginalia-mode))

;;;; Embark

;; The Embark package provides a sort of right-click context menu for the thing-at-point.
(use-package embark-consult
  :straight t)

(use-package embark
  :straight t
  :bind ("C-c e" . #'embark-act))

;;;; Consult
(use-package consult
  :straight t
  :bind
  (("C-x b" . #'consult-buffer)
   ("C-c i" . #'consult-imenu)
   ("C-c r" . #'consult-recent-file)
   ("M-g g" . #'consult-goto-line))
  :custom
  (completion-in-region-function #'consult-completion-in-region)
  (xref-show-xrefs-function #'consult-xref)
  (xref-show-definitions-function #'consult-xref))

;;;; Corfu: in-buffer completion
(use-package corfu
  :straight t
  :custom
  (corfu-auto t)
  :init
  (global-corfu-mode))

;;; Formatting

;;;; Reformatter
(use-package reformatter
  :straight t)

(defcustom json-format-command
  "jq"
  "The command to run when applying JSON formatting"
  :type 'string
  :safe 'stringp
  :local 't
  :group 'prsteele)

(defcustom ormolu-command
  "ormolu"
  "The command to run when applying ormolu formatting"
  :type 'string
  :safe 'stringp
  :local 't
  :group 'prsteele)

(defcustom isort-command
  "isort"
  "The command to run when applying isort formatting"
  :type 'string
  :safe 'stringp
  :local 't
  :group 'prsteele)

(defcustom black-command
  "black"
  "The command to run when applying black formatting"
  :type 'string
  :safe 'stringp
  :local 't
  :group 'prsteele)

(defcustom ruff-command
  "ruff"
  "The command to run when applying Ruff formatting"
  :type 'string
  :safe 'stringp
  :local 't
  :group 'prsteele)

(reformatter-define json-format
  :program json-format-command
  :args '(".")
  :lighter " jq")

(reformatter-define ormolu-format
  :program ormolu-command
  :args '()
  :lighter " ormolu")

(reformatter-define isort-format
  :program isort-command
  :args '("-")
  :lighter " isort")

(reformatter-define black-format
  :program black-command
  :args '("-")
  :lighter " black")

(reformatter-define ruff-format
  :program ruff-command
  :args '("format" "-")
  :lighter " ruff")

;;; LSP modes

;;;; Eglot
(use-package eglot
  :bind
  (:map eglot-mode-map
        ("C-." . 'xref-find-definitions)
        ("C-," . 'xref-go-back)
        ("C-c ?" . 'eglot-help-at-point)
        ("C-c C-c" . 'eglot-code-actions)
        ("C-c C-r" . 'eglot-rename)))

;;;; LSP
(use-package lsp-mode
  :straight t)

(use-package lsp-pyright
  :straight t
  :custom
  (lsp-pyright-multi-root nil))

;;; Mode configuration

;;;; Ace jump
(use-package ace-jump-mode
  :straight t
  :bind (("C-c SPC" . 'ace-jump-mode)))

;;;; Comint
(use-package comint
  :hook
  (comint-mode . disable-trailing-whitespace))

;;;; Compilation mode

(use-package compile
  :hook
  (compilation-mode . disable-trailing-whitespace))

;; This allows compilation buffers to play nicely with colorization.
;;
;; See the following:
;;
;; https://emacs.stackexchange.com/questions/24698/ansi-escape-sequences-in-compilation-mode
;;
;; http://endlessparentheses.com/ansi-colors-in-the-compilation-buffer-output.html
;;
;; https://oleksandrmanzyuk.wordpress.com/2011/11/05/better-emacs-shell-part-i

(use-package ansi-color
  :straight t
  :init
  (defun endless/colorize-compilation ()
    "Colorize from `compilation-filter-start' to `point'."
    (let ((inhibit-read-only t))
      (ansi-color-apply-on-region
       compilation-filter-start (point))))

  (add-hook 'compilation-filter-hook
            #'endless/colorize-compilation)

  (defun regexp-alternatives (regexps)
    "Return the alternation of a list of regexps."
    (mapconcat (lambda (regexp)
                 (concat "\\(?:" regexp "\\)"))
               regexps "\\|"))

  (defvar non-sgr-control-sequence-regexp nil
    "Regexp that matches non-SGR control sequences.")

  (setq non-sgr-control-sequence-regexp
        (regexp-alternatives
         '(;; icon name escape sequences
           "\033\\][0-2];.*?\007"
           ;; non-SGR CSI escape sequences
           "\033\\[\\??[0-9;]*[^0-9;m]"
           ;; noop
           "\012\033\\[2K\033\\[1F"
           )))

  (defun filter-non-sgr-control-sequences-in-region (begin end)
    (save-excursion
      (goto-char begin)
      (while (re-search-forward
              non-sgr-control-sequence-regexp end t)
        (replace-match ""))))

  (defun filter-non-sgr-control-sequences-in-output (ignored)
    (let ((start-marker
           (or comint-last-output-start
               (point-min-marker)))
          (end-marker
           (process-mark
            (get-buffer-process (current-buffer)))))
      (filter-non-sgr-control-sequences-in-region
       start-marker
       end-marker)))

  (add-hook 'comint-output-filter-functions
            'filter-non-sgr-control-sequences-in-output))

;;;; Coq
(use-package proof-general
  :straight t
  :bind
  (:map coq-mode-map
        (("RET" . newline-and-indent)))
  :custom
  (coq-compile-before-require t)
  :custom-face
  (proof-locked-face ((t (:extend t :background "#073642"))))
  (proof-queue-face ((t (:extend t :background "#d33682")))))

;;;; Direnv
(use-package direnv
  :straight t
  :config
  (direnv-mode))

;;;; Eldoc
(use-package eldoc
  :straight t
  :diminish)

;;;; elisp
(add-hook 'emacs-lisp-mode-hook 'turn-on-eldoc-mode)

;;;; Flycheck
(use-package flycheck
  :straight t
  :diminish flycheck-mode)

;;;; Flymake
(use-package flymake
  :straight t
  :diminish
  :custom
  (flymake-run-in-place nil))

(use-package eldoc-box
  :straight t)
(add-hook 'eglot-managed-mode-hook #'eldoc-box-hover-mode t)

;;;; Haskell
(use-package haskell-mode
  :straight t
  :hook
  (haskell-mode . (lambda ()
                    (hack-local-variables)
                    (eglot-ensure)))
  (haskell-mode . ormolu-format-on-save-mode)

  :config
  ;; Turn off broken flymake functions
  (setq flymake-allowed-file-name-masks
	(remove '("\\.l?hs\\'" haskell-flymake-init)
		flymake-allowed-file-name-masks))
  :bind
  (:map haskell-mode-map
        ("C-c C-l" . #'haskell-process-load-file)))

;;;; JSON
(use-package js
  :hook
  (js-json-mode . json-format-on-save-mode))

;;;; LaTeX

(use-package latex-mode
  :custom
  (font-latex-script-display 'nil)
  (font-latex-fontify-script 'nil)
  (font-latex-fontify-sectioning 'color)
  (show-trailing-whitespace 't)
  (tex-font-lock-suscript 'ignore)

  :hook
  (latex-mode . auto-fill-mode)
  (latex-mode . flyspell-mode))

;;;; Lean
(use-package lean4-mode
  :straight (lean4-mode
	     :type git
	     :host github
             :repo "bustercopley/lean4-mode"
	     ;; :repo "leanprover/lean4-mode"
	     :files ("*.el" "data"))
  :bind
  ("<RET>" . newline-and-indent)
  :config
  (defun lean4-get-executable (name) (find-project-local-executable name))
  :hook
  (lean4-mode . (lambda () (corfu-mode -1))))

;;;; Magit
(use-package magit
  :straight t
  :bind
  ("C-c m" . magit-status)

  :custom
  (magit-last-seen-setup-instructions "1.4.0"))

;;;; Markdown
(use-package markdown-mode
  :straight t
  :hook
  (markdown-mode . flyspell-mode)
  (markdown-mode . auto-fill-mode)
  :config
  (add-to-list 'auto-mode-alist '("\\.md" . markdown-mode)))

;;;; Org

;; I have some customization around capture templates that are based
;; off an old coworker's configuration:
;;
;; https://blog.aaronbieber.com/2016/09/24/an-agenda-for-life-with-org-mode.html
(use-package org
  :straight t
  :bind
  (("C-c l" . org-store-link)
   ("C-c a" . org-agenda)
   ("C-c c" . org-capture))

  :hook
  (org-mode . auto-fill-mode)
  (org-mode . flyspell-mode)

  :custom
  (org-log-done 'time)
  (org-agenda-files (list "~/org/agenda.org"
                          "~/org/todo.org"
                          "~/org/journal.org"
                          "~/org/research.org"
                          "~/org/courses.org"))
  (org-refile-targets (quote ((nil :maxlevel . 9)
                              (org-agenda-files :maxlevel . 9)
                              ("~/.emacs.d/readme.org" :maxlevel . 9))))

  (org-capture-templates
   '(("t" "Todo" entry (file+headline "~/org/todo.org" "Tasks")
      "* TODO %?\n\nCreated at %U")
     ("j" "Journal" entry (file+datetree "~/org/journal.org")
      "* %?\nEntered on %U\n  %i\n  %a")
     ("r" "Research" entry (file+headline "~/org/research.org" "Research"))
     ("c" "Courses" entry (file+headline "~/org/courses.org" "Courses")))))

;;;; Nix-mode
(use-package nix-mode
  :straight t
  :hook
  (nix-mode . (lambda () (add-hook 'before-save-hook 'nix-format-before-save 'local)))
  (nix-mode . eglot-ensure)
  :custom
  (nix-nixfmt-bin "nixpkgs-fmt"))

;;;; prog-mode

;; There are some good global defaults for any ~prog-mode~-derived mode:
;;
;; 1. I want rainbow delimiters
;; 2. I want rainbow identifiers
;; 3. I want line numbers
;; 4. I want to see trailing whitespace (so I can get rid of it, if
;;    somehow an auto-formatter doesn't)

(use-package prog-mode
  :after (rainbow-delimiters rainbow-identifiers)
  :bind
  (:map prog-mode-map
        ("C-." . 'xref-find-definitions)
        ("C-," . 'xref-pop-marker-stack)
        ("C-c ?" . 'eglot-help-at-point))

  :hook
  (prog-mode . display-line-numbers-mode)
  (prog-mode . electric-pair-mode)
  (prog-mode . rainbow-delimiters-mode)
  (prog-mode . rainbow-identifiers-mode)

  :custom
  (show-trailing-whitespace 't))

;;;; Project
(use-package project
  :straight t
  :bind (("C-c k" . #'project-kill-buffers)
         ("C-c m" . #'project-compile)
         ("C-x f" . #'find-file)
         ("C-c f" . #'project-find-file)
         ("C-c F" . #'project-switch-project))
  :custom
  (project-switch-commands
   '((?f "Find file" project-find-file)
     (?g "Magit" magit-project-status)
     (?d "Dired" project-dired)
     (?r "Find regexpt" project-find-regexp)))
  (compilation-always-kill t))

;;;; Python
(use-package python
  :straight t
  :bind
  (:map python-mode-map
        (("C-c C-l" . python-shell-send-buffer)))
  :hook
  (python-mode . eglot-ensure)
  (python-mode . isort-format-on-save-mode)
  (python-mode . ruff-format-on-save-mode))

;;;; rst -- reStructuredText

;; I don't use this often, and I should probably just enable
;; `flyspell-mode' and `auto-fill-mode' from a suitable ancestor mode.

(use-package rst
  :straight t
  :hook
  (rst-mode . flyspell-mode)
  (rst-mode . auto-fill-mode))

;;;; SCons
(add-to-list 'auto-mode-alist '("SConstruct" . python-mode))
(add-to-list 'auto-mode-alist '("SConscript" . python-mode))

;;;; shell
(use-package shell
  :straight t
  :hook
  (shell-mode . disable-trailing-whitespace))

;;;; SQL
(use-package sql
  :straight t
  :custom
  (sql-product "postgres"))

;;;; Smart mode line
(use-package smart-mode-line
  :straight t
  :custom
  (sml/theme 'respectful)
  (sml/vc-mode-show-backend t)
  (sml/shorten-directory t)
  (sml/shorten-modes t)
  (sml/name-width 30)
  (sml/mode-width 'full))

;;;; term
(use-package term
  :straight t
  :hook
  (term-mode . disable-trailing-whitespace))

;;;; Text
(use-package text-mode
  :hook
  (text-mode . auto-fill-mode)
  (text-mode . flyspell-mode))

;;;; Which function

;; I've run into issues with this interacting poorly with other modes,
;; and the code is probably fragile. I wish I'd commented it better
;; when I wrote it.

(use-package which-func
  :straight t
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
		   mouse-face mode-line-highligh
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

;;;; which key
;; This will fire when you pause typing a key prefix
(use-package which-key
  :straight t
  :config (which-key-mode)
  :diminish which-key-mode)
