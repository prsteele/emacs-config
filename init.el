(require 'package)
(add-to-list 'package-archives
	     '("marmalade" . "http://marmalade-repo.org/packages/"))
(package-initialize)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;
;; General configuration
;;

;; Define <RET> to behave like C-j
(defun RET-behaves-as-LFD ()
  (let ((x (key-binding "\C-j")))
    (local-set-key "\C-m" x)))

;; Highlight selections
(transient-mark-mode 't)

;; Auto-indent new lines
(setq indent-line-function `indent-relative-maybe)

;; Make Emacs automatically match parenthesis, etc
(show-paren-mode 't)

;; Turn on column numbering
(column-number-mode 't)

;; Stop C-z from backgrounding emacs and make it do something useful
;; like spawn a shell
(global-set-key "\C-z" '(lambda () (interactive) (ansi-term "/bin/bash")))

;; Enable upcase-region command
(put 'upcase-region 'disabled nil)

;; Hide the top toolbar
(tool-bar-mode nil)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;
;; LaTeX and AuxTeX Mode
;;

;; Turn on auto-fill-mode, flyspell-mode
(mapc (lambda (hook) (progn (add-hook hook 'auto-fill-mode)
			    (add-hook hook 'flyspell-mode)))
      '(LaTeX-mode-hook tex-mode-hook plain-TeX-mode-hook 
			AmS-TeX-mode-hook ConTeXt-mode-hook 
			Texinfo-mode-hook docTeX-mode-hook))

;; Disable font-locking for sub- and super-scripts in the various
;; AuxTeX modes
(setq font-latex-script-display 'nil)
(setq font-latex-fontify-sectioning 'color)

(custom-set-faces
 '(font-latex-subscript-face ((t nil)))
 '(font-latex-superscript-face ((t nil))))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;
;; elisp
;;

(add-hook 'emacs-lisp-mode-hook 'turn-on-eldoc-mode)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;
;; Python
;;

(add-hook 'python-mode-hook 
	  '(lambda ()
	     (local-set-key (kbd "RET") 'newline-and-indent)))

;; Cython mode
(add-to-list 'auto-mode-alist '("\\.pyx\\'" . cython-mode))

(define-derived-mode cython-mode python-mode "Cython"
  (font-lock-add-keywords
   nil
   `((,(concat "\\<\\(NULL"
               "\\|c\\(def\\|har\\|typedef\\)"
               "\\|e\\(num\\|xtern\\)"
               "\\|float"
               "\\|in\\(clude\\|t\\)"
               "\\|object\\|public\\|struct\\|type\\|union\\|void"
               "\\)\\>")
      1 font-lock-keyword-face t))))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;
;; Haskell
;;

(add-hook 'haskell-mode-hook 'turn-on-haskell-doc-mode)
(add-hook 'haskell-mode-hook 'turn-on-haskell-indentation)
(add-hook 'haskell-mode-hook 'font-lock-mode)

;; Recognize *.hs-boot files as Haskell files
(add-to-list 'auto-mode-alist '("\\.hs-boot\\'" . haskell-mode))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;
;; Octave
;;

(autoload 'octave-mode "octave-mod" nil t)
(setq auto-mode-alist
      (cons '("\\.m$" . octave-mode) auto-mode-alist))

(add-hook 'octave-mode-hook
	  (lambda ()
	    (abbrev-mode 1)
	    (auto-fill-mode 1)
	    (if (eq window-system 'x)
		(font-lock-mode 1))))

(add-hook 'octave-mode-hook 'RET-behaves-as-LFD)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;
;; C, C++
;;

(add-hook 'c-mode-hook 
	  '(lambda ()
	     (local-set-key (kbd "RET") 'newline-and-indent)))

(add-hook 'c++-mode-hook 
	  '(lambda ()
	     (local-set-key (kbd "RET") 'newline-and-indent)))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;
;; GO
;;
(add-to-list 'load-path "~/lib/go/misc/emacs")
(require 'go-mode-load)
(add-hook 'go-mode-hook
	  '(lambda ()
	     (setq default-tab-width 2)))
(add-hook 'before-save-hook #'gofmt-before-save)
(add-hook 'go-mode-hook 
	  (lambda () 
	    (progn
	      (local-set-key (kbd "C-c C-r") 'go-remove-unused-imports)
	      (local-set-key (kbd "C-c C-a") 'go-import-add)
	      (local-set-key (kbd "C-c C-i") 'go-goto-imports))))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;
;; Sass
;;
(add-to-list 'auto-mode-alist '("\\.scss\\'" . css-mode))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;
;; Appearance
;;

(add-to-list 'default-frame-alist '(foreground-color . "white"))
(add-to-list 'default-frame-alist '(background-color . "black"))
(add-to-list 'default-frame-alist '(cursor-color . "coral"))
(set-default-font "Inconsolata 14")

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;
;; Miscellaneous fixes
;;

;; fix for Ubuntu 10.10 problem
;;(setq flyspell-issue-welcome-flag nil)

;; Remove the toolbar; has to be done down here, rather than at the
;; top for some reason.
(tool-bar-mode -1)
(set-scroll-bar-mode 'nil)
