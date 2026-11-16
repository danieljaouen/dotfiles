(global-set-key (kbd "C-h") 'backward-delete-char)
(global-set-key (kbd "C-w") 'evil-delete-backward-word)

(define-key evil-normal-state-map (kbd ";") 'evil-ex)
(define-key evil-normal-state-map (kbd "C-h") 'evil-window-left)
(define-key evil-normal-state-map (kbd "C-j") 'evil-window-down)
(define-key evil-normal-state-map (kbd "C-k") 'evil-window-up)
(define-key evil-normal-state-map (kbd "C-l") 'evil-window-right)
(define-key evil-normal-state-map (kbd ",w") 'delete-trailing-whitespace)

(define-key evil-visual-state-map (kbd ";") 'evil-ex)
(define-key evil-visual-state-map (kbd ",q") 'sort-lines)
(define-key evil-visual-state-map (kbd ",ah") 'align-repeat)

(define-key evil-insert-state-map (kbd "C-n") 'next-line)
(define-key evil-insert-state-map (kbd "C-p") 'previous-line)
(define-key evil-insert-state-map (kbd "C-y") nil)
(define-key evil-insert-state-map (kbd "C-y ,") 'my-tab-command)

(define-key evil-evilified-state-map (kbd "/") 'evil-ex-search-forward)
(define-key evil-evilified-state-map (kbd "?") 'evil-ex-search-backward)
(define-key evil-evilified-state-map (kbd "n") 'evil-ex-search-next)
(define-key evil-evilified-state-map (kbd "N") 'evil-ex-search-previous)

(define-key isearch-mode-map (kbd "C-h") 'backward-delete-char)
(define-key isearch-mode-map (kbd "C-w") 'evil-delete-backward-word)

(with-eval-after-load 'auto-highlight-symbol
  (define-key evil-motion-state-map (kbd "*") 'evil-ex-search-word-forward)
  (define-key evil-motion-state-map (kbd "#") 'evil-ex-search-word-backward))

(with-eval-after-load 'buff-menu
  (define-key Buffer-menu-mode-map (kbd "k") 'evil-previous-line))

(with-eval-after-load 'helm
  (define-key helm-map (kbd "C-h") 'delete-backward-char)
  (define-key helm-map (kbd "C-w") 'evil-delete-backward-word))

(with-eval-after-load 'helm-files
  (define-key helm-find-files-map (kbd "C-w") 'evil-delete-backward-word))

(with-eval-after-load 'iedit
  (define-key iedit-mode-keymap (kbd "C-h") 'backward-delete-char)
  (define-key iedit-mode-occurrence-keymap (kbd "C-h") 'backward-delete-char))

(with-eval-after-load 'company
  (define-key company-active-map (kbd "C-n") 'company-select-next)
  (define-key company-active-map (kbd "C-p") 'company-select-previous)
  (define-key company-active-map (kbd "C-w") 'evil-delete-backward-word)
  (define-key company-active-map (kbd "C-h") 'backward-delete-char)
  (define-key company-active-map (kbd "C-d") nil)
  (define-key company-active-map (kbd "C-d o") 'insert-eex-statement)
  (define-key company-active-map (kbd "C-d t") 'insert-eex-expression))

(with-eval-after-load 'magit
  (evil-define-key 'normal magit-mode-map
    (kbd "C-j") 'evil-window-down
    (kbd "C-k") 'evil-window-up
    "/" 'evil-ex-search-forward
    "n" 'evil-ex-search-next
    "N" 'evil-ex-search-previous
    "z" nil
    "Z" 'magit-stash
    "zt" 'evil-scroll-line-to-top
    "zz" 'evil-scroll-line-to-center))
