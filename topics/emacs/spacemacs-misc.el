(global-display-line-numbers-mode)

(if (not (server-running-p))
    (progn
      (atomic-chrome-start-server)
      (server-start)))

(org-babel-do-load-languages
 'org-babel-load-languages
 '((lisp . t)))

(defalias 'sl 'sort-lines)

(put 'dired-find-alternate-file 'disabled nil)

(eval-after-load "company"
  '(progn
     (add-to-list 'company-backends 'company-anaconda)
     (add-to-list 'company-backends 'company-elm)))

(if (string-equal system-type "gnu/linux")
    (progn
      (require 'exwm)
      (require 'exwm-config)
      (exwm-config-default)))
