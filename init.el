(require 'package)
(add-to-list 'package-archives
	     '("marmalade" . "http://marmalade-repo.org/packages/"))
(package-initialize)

;; Find local libraries
(add-to-list 'load-path "~/.emacs.d")
(progn (cd "~/.emacs.d")
       (normal-top-level-add-subdirs-to-load-path))

;; Load all my configuration files
(mapc 'load-library '("prsteele-auto-complete"
		      "prsteele-general"
                      "prsteele-color-themes"
                      "prsteele-c++"
		      "prsteele-elisp"
		      "prsteele-go"
		      "prsteele-haskell"
                      "prsteele-javascript"
		      "prsteele-latex"
		      "prsteele-markdown"
		      "prsteele-octave"
		      "prsteele-python"
		      "prsteele-sass"
		      "prsteele-scons"
		      ))

