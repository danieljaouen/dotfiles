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

; (with-eval-after-load 'lsp-mode
;   (require 'lsp-intellij)
;   (add-hook 'java-mode-hook #'lsp-intellij-enable))

(eval-after-load "company"
  '(add-to-list 'company-backends 'company-anaconda))
