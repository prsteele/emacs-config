;; Configuration file for org-mode

(require 'org-install)
(require 'ob-tangle)
(require 'ob-latex)

; We need to load tex.el first...
(load "tex.el")
;;(require 'org-latex)

(setq org-src-fontify-natively t)

(global-set-key (kbd "C-c l") 'org-store-link)
(global-set-key (kbd "C-c a") 'org-agenda)
(global-set-key (kbd "C-c b") 'org-iswitchb)
(define-key global-map (kbd "C-c c") 'org-capture)

(add-hook 'org-mode-hook 'auto-fill-mode)
(add-hook 'org-mode-hook 'flyspell-mode)

;; Add timestamps to completed TODOs
(setq org-log-done 'time)

(setq org-agenda-files (list "~/org/agenda.org"
                             "~/org/todo.org"))


(setq org-refile-targets (quote ((nil :maxlevel . 9)
                                 (org-agenda-files :maxlevel . 9))))

(setq org-capture-templates
      '(("t" "Todo" entry (file+headline "~/org/todo.org" "Tasks")
         "* TODO %?\n\nCreated at %U")
        ("j" "Journal" entry (file+datetree "~/org/journal.org")
         "* %?\nEntered on %U\n  %i\n  %a")
        ("r" "Research" entry (file+headline "~/org/research.org" "Research"))))
