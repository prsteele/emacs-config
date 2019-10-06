;;;; org-mode configuration

(use-package org
  :bind
  (("C-c l" . org-store-link)
   ("C-c a" . org-agenda)
   ("C-c c" . org-capture))

  :hook
  ((org-mode-hook . auto-fill-mode)
   (org-mode-hook . flyspell-mode))

  :custom
  (org-log-done 'time)
  (org-agenda-files (list "~/org/agenda.org"
                              "~/org/todo.org"
                              "~/org/journal.org"
                              "~/org/research.org"
                              "~/org/courses.org"))
  (org-refile-targets (quote ((nil :maxlevel . 9)
                              (org-agenda-files :maxlevel . 9))))

  (org-capture-templates
       '(("t" "Todo" entry (file+headline "~/org/todo.org" "Tasks")
          "* TODO %?\n\nCreated at %U")
         ("j" "Journal" entry (file+datetree "~/org/journal.org")
          "* %?\nEntered on %U\n  %i\n  %a")
         ("r" "Research" entry (file+headline "~/org/research.org" "Research"))
         ("c" "Courses" entry (file+headline "~/org/courses.org" "Courses")))))
