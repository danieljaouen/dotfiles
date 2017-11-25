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

; (define-key gnus-group-mode-map "\C-h" 'evil-window-left)
; (define-key gnus-group-mode-map "\C-j" 'evil-window-down)
; (define-key gnus-group-mode-map "\C-k" 'evil-window-up)
; (define-key gnus-group-mode-map "\C-l" 'evil-window-right)
; (define-key gnus-article-mode-map "\C-h" 'evil-window-left)
; (define-key gnus-article-mode-map "\C-j" 'evil-window-down)
; (define-key gnus-article-mode-map "\C-k" 'evil-window-up)
; (define-key gnus-article-mode-map "\C-l" 'evil-window-right)
; (define-key gnus-group-mode-map (kbd "C-w") nil)
; (define-key gnus-article-mode-map (kbd "C-w") nil)
; (define-key gnus-group-mode-map (kbd "C-w v") 'evil-window-vsplit)
; (define-key gnus-group-mode-map (kbd "C-w s") 'evil-window-split)
; (define-key gnus-article-mode-map (kbd "C-w v") 'evil-window-vsplit)
; (define-key gnus-article-mode-map (kbd "C-w s") 'evil-window-split)
(define-key gnus-group-mode-map ";" 'evil-ex)
(define-key gnus-article-mode-map ";" 'evil-ex)
(define-key isearch-mode-map "\C-h" 'isearch-delete-char)
