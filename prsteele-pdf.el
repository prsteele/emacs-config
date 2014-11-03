;;; Commands for opening files in an external PDF viewer.

(defvar prsteele-pdf-viewer "okular")

(defun prsteele-view-pdf (file)
  "Open a file for viewing using an external viewer.

The viewer used is the one described by `prsteele-pdf-viewer`."
  (interactive "fFile to open: ")
  (let ((name (concat "*prsteele-view-pdf "
                      file
                      "*")))
    (start-process name nil prsteele-pdf-viewer file)))
