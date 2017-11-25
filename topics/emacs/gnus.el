(setq user-mail-address "dcj24@cornell.edu"
      user-full-name "Daniel Jaouen")

(setq gnus-select-method
      '(nnimap "gmail"
               (nnimap-address "imap.gmail.com")
               (nnimap-server-port "imaps")
               (nnimap-stream ssl)))

(setq smtpmail-smtp-server "smtp.gmail.com"
      smtpmail-smtp-service 587
      gnus-ignored-newsgroups "^to\\.\\|^[0-9. ]+\\( \\|$\\)\\|^[\"]\"[#'()]")

(define-key isearch-mode-map "\C-h" 'isearch-delete-char)
