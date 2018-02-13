(atomic-chrome-start-server)
(server-start)

(org-babel-do-load-languages
 'org-babel-load-languages
 '((lisp . t)))

(put 'dired-find-alternate-file 'disabled nil)

(set-fill-column 79)
