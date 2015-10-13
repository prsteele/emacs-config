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
   ))

(cyphejor-mode 1)

(require 'rich-minority)

(setq
 rm-blacklist (list " company" " Helm" " Doc" " Interactive" " $"))

(rich-minority-mode 1)

