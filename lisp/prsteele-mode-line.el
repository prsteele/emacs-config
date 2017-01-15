;; It appears that rich-minority must be initialized before
;; smart-mode-line.
(require 'rich-minority)

(setq
 rm-blacklist '(" company"
                " Doc" 
                " Interactive" 
                " $" 
                " Helm"
                " ElDoc"))

(setq
 rm-text-properties '(("Projectile.*" 'display "")
                      ("Fly" 'display " abc")))

(require 'smart-mode-line)

(setq sml/theme 'respectful)
(setq sml/vc-mode-show-backend t)
;(setq sml/shorten-directory t)
(setq sml/shorten-modes t)
(setq sml/name-width 30)
(setq sml/mode-width 'full)

(sml/setup)

(require 'cyphejor)

(setq
 cyphejor-rules
 '(("projectile" "P")
   ("buffer"      "β")
   ("diff"        "Δ")
   ("inferior"    "i" :prefix)
   ("interaction" "i" :prefix)
   ("Interactive" "i" :prefix)
   ("lisp"        "λ" :postfix)
   ("haskell"     "λ=" :postfix)
   ("mode"        "")
   ("python"      "π")
   ("text"        "ξ")
   ("emacs"       "ε")
   ))

(cyphejor-mode 1)



