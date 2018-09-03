(setq custom-file "~/.emacs.d/custom.el")
(load custom-file)

;; Pull in the system environment
(setq exec-path (append exec-path (list (getenv "PATH"))))

;; Configure the packages repositories
(require 'package)
(add-to-list 'package-archives
	     '("melpa" . "http://melpa.milkbox.net/packages/"))
(add-to-list 'package-archives
	     '("marmalade" . "http://marmalade-repo.org/packages/") t)
(package-initialize)

;; Find local libraries
(add-to-list 'load-path "~/.emacs.d/lisp")
(progn (cd "~/.emacs.d")
       (normal-top-level-add-subdirs-to-load-path))

(defun safely-require (library)
  "A variant of `require' that won't throw an error for missing files.

This function calls (require LIBRARY), but handles errors by
logging warnings to the *Warnings* buffer. Returns 't if the
library is loaded successfully and nil otherwise."
  (condition-case
      nil
      (progn (require library) 't)
    (file-missing
     (display-warning
      'safely-require
      (format "Cannot load library %s" library)
      :warning
      "*Warnings*")
     nil)))

(defmacro safely-configure (libraries &rest body)
  "Load a library using `safely-require', and configure it on success.

LIBRARIES can either be a single library name, or a list of
library names to load.

BODY will only be executed if all the requested libraries are
loaded successfully."
  `(let ((library-list (if (listp ,libraries)
                           ,libraries
                         (list ,libraries))))
     (when (eval `(and ,@(mapcar 'safely-require library-list)))
       ,@body)))

;; Load all my configuration files
(mapc
 'load-library
 '("prsteele-ace-jump"
   "prsteele-appearance"
   "prsteele-c++"
   "prsteele-company"
   "prsteele-elisp"
   "prsteele-general"
   "prsteele-haskell"
   "prsteele-helm"
   "prsteele-helm-gtags"
   "prsteele-java"
   "prsteele-julia"
   "prsteele-latex"
   "prsteele-magit"
   "prsteele-markdown"
   "prsteele-mode-line"
   "prsteele-openwith"
   "prsteele-org"
   "prsteele-prog-mode"
   "prsteele-python"
   "prsteele-rst"
   "prsteele-rust"
   "prsteele-sass"
   "prsteele-scons"
   "prsteele-sql"
   "prsteele-text"
   "prsteele-which-function"
   ))
