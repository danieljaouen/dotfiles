(define-key evil-normal-state-map (kbd ";") 'evil-ex)
(define-key evil-visual-state-map (kbd ";") 'evil-ex)
(define-key evil-normal-state-map (kbd "TAB") 'evil-toggle-fold)
(global-set-key "\C-h" 'backward-delete-char)
(global-set-key "\C-w" 'evil-delete-backward-word)
(define-key helm-map "\C-h" 'delete-backward-char)
(define-key helm-map "\C-w" 'evil-delete-backward-word)
(define-key helm-find-files-map "\C-w" 'evil-delete-backward-word)
(define-key evil-normal-state-map "\C-h" 'evil-window-left)
(define-key evil-normal-state-map "\C-j" 'evil-window-down)
(define-key evil-normal-state-map "\C-k" 'evil-window-up)
(define-key evil-normal-state-map "\C-l" 'evil-window-right)
(define-key evil-normal-state-map ",w" 'delete-trailing-whitespace)
(define-key evil-visual-state-map ",q" 'sort-lines)
(define-key evil-insert-state-map "\C-n" 'next-line)
(define-key evil-insert-state-map "\C-p" 'previous-line)
(define-key evil-insert-state-map "\C-y" nil)
(define-key evil-insert-state-map (kbd "C-y ,") 'my-tab-command)
(define-key iedit-mode-keymap "\C-h" 'backward-delete-char)
(define-key iedit-mode-occurrence-keymap "\C-h" 'backward-delete-char)
(define-key evil-visual-state-map ",ah" 'align-repeat)
(evil-define-key 'insert web-mode-map "\C-d" nil)
;; (evil-define-key 'insert web-mode-map "\C-do" 'insert-opening-non-printed-j2)
;; (evil-define-key 'insert web-mode-map "\C-dt" 'insert-opening-printed-j2)
(evil-define-key 'insert web-mode-map "\C-do" 'insert-opening-non-printed)
(evil-define-key 'insert web-mode-map "\C-dt" 'insert-opening-printed)
(evil-define-key 'insert yaml-mode-map "\C-d" nil)
(evil-define-key 'insert yaml-mode-map "\C-do"
  'insert-opening-non-printed-j2
  )
(evil-define-key 'insert yaml-mode-map "\C-dt" 'insert-opening-printed-j2)
(evil-define-key 'insert elixir-mode-map "\C-do" 'insert-map)
(evil-define-key 'insert elixir-mode-map "\C-dt" 'insert-map)

(define-key isearch-mode-map "\C-h" 'backward-delete-char)
(define-key isearch-mode-map "\C-w" 'evil-delete-backward-word)
(define-key Buffer-menu-mode-map "k" 'evil-previous-line)

(define-key evil-evilified-state-map "/" 'evil-ex-search-forward)
(define-key evil-evilified-state-map "?" 'evil-ex-search-backward)
(define-key evil-evilified-state-map "n" 'evil-ex-search-next)
(define-key evil-evilified-state-map "N" 'evil-ex-search-previous)

(define-key evil-normal-state-map "/" 'evil-ex-search-forward)
(define-key evil-normal-state-map "?" 'evil-ex-search-backward)
(define-key evil-normal-state-map "n" 'evil-ex-search-next)
(define-key evil-normal-state-map "N" 'evil-ex-search-previous)

(define-key evil-insert-state-map (kbd "C-j") #'copilot-next-completion)
(define-key evil-insert-state-map (kbd "C-k") #'copilot-previous-completion)
