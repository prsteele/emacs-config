;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;
;; Python
;;

;; We need to include this manually until it is updated and on melpa
(add-to-list 'load-path "~/lib/python-mode.el-6.1.3/")
(setq py-install-directory "~/lib/python-mode.el-6.1.3/")
(require 'python-mode)

(setq py-shell-name "python3")
