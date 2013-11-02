(require 'package)
(add-to-list 'package-archives
	     '("marmalade" . "http://marmalade-repo.org/packages/"))
(package-initialize)

;; Load all my configuration files

(mapc load-library '("prsteele-c++"
		     "prsteele-elisp"
		     "prsteele-general"
		     "prsteele-go"
		     "prsteele-haskell"
		     "prsteele-latex"
		     "prsteele-octave"
		     "prsteele-python"
		     "prsteele-sass"
		     ))
