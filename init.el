(require 'package)
(add-to-list 'package-archives
	     '("marmalade" . "http://marmalade-repo.org/packages/"))
(package-initialize)

;; Find local libraries
(add-to-list 'load-path "~/.emacs.d")
(progn (cd "~/.emacs.d")
       (normal-top-level-add-subdirs-to-load-path))

;; Load all my configuration files
(mapc 'load-library '("prsteele-c++"
		      "prsteele-elisp"
		      "prsteele-general"
		      "prsteele-go"
		      "prsteele-haskell"
		      "prsteele-latex"
		      "prsteele-octave"
		      "prsteele-python"
		      "prsteele-sass"
		      ))
