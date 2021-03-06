(defun my-tab-command ()
  (interactive)
  (indent-for-tab-command)
  (yas-expand))

(defun align-repeat (start end regexp)
  "Repeat alignment with respect to
     the given regular expression."
  (interactive "r\nsAlign regexp: ")
  (align-regexp start end
                (concat "\\(\\s-*\\)" regexp) 1 1 t))

(defun insert-opening-printed ()
  (interactive)
  (insert "<%=  %>")
  (backward-char 3))

(defun insert-opening-non-printed ()
  (interactive)
  (insert "<%  %>")
  (backward-char 3))

(defun insert-map ()
  (interactive)
  (insert "%{}")
  (backward-char 1))

(defun insert-opening-printed-j2 ()
  (interactive)
  (insert "{%  %}")
  (backward-char 3))

(defun insert-opening-non-printed-j2 ()
  (interactive)
  (insert "{{  }}")
  (backward-char 3))

(defun my-web-mode-hook ()
  "Hooks for Web mode."
  (evil-define-key 'insert web-mode-map "\C-y" nil)
  (evil-define-key 'insert web-mode-map (kbd "C-y ,")
    'spacemacs/emmet-expand
    )
  (setq web-mode-markup-indent-offset 2)
  )

;; this needs to be a macro because the mode-maps aren't defined at load time
(defmacro my-gnus-mode-hook-wrapper (map)
  `(lambda ()
     (define-key ,map "\C-h" nil)
     (define-key ,map "\C-w" nil)
     (define-key ,map "\C-k" nil)
     (define-key ,map "z" nil)
     (define-key ,map "\C-h" 'evil-window-left)
     (define-key ,map "\C-wh" 'evil-window-left)
     (define-key ,map "\C-j" 'evil-window-down)
     (define-key ,map "\C-wj" 'evil-window-down)
     (define-key ,map "\C-k" 'evil-window-up)
     (define-key ,map "\C-wk" 'evil-window-up)
     (define-key ,map "\C-l" 'evil-window-right)
     (define-key ,map "\C-wl" 'evil-window-right)
     (define-key ,map "\C-wv" 'evil-window-vsplit)
     (define-key ,map "\C-ws" 'evil-window-split)
     (define-key ,map ";" 'evil-ex)
     (define-key ,map "zt" 'evil-scroll-line-to-top)
     (define-key ,map "zz" 'evil-scroll-line-to-center)
     (define-key ,map "{" 'evil-backward-paragraph)
     (define-key ,map "}" 'evil-forward-paragraph)
     (define-key ,map "R" 'gnus-group-restart)
     (define-key ,map "0" 'evil-digit-argument-or-evil-beginning-of-line)
     (define-key ,map "w" 'evil-forward-word-begin)
     (define-key ,map "W" 'evil-forward-WORD-begin)
     (define-key ,map "b" 'evil-backward-word-begin)
     (define-key ,map "B" 'evil-backward-WORD-begin)
     )
  )

(defun my-isearch-mode-hook ()
  (setq inhibit-message nil))

(defun my-isearch-mode-end-hook ()
  (setq inhibit-message t))

(defun my-magit-mode-hook ()
  (evil-define-key 'normal magit-mode-map "\C-j" 'evil-window-down)
  (evil-define-key 'normal magit-mode-map "\C-k" 'evil-window-up)
  (evil-define-key 'normal magit-mode-map "/" 'evil-ex-search-forward)
  (evil-define-key 'normal magit-mode-map "n" 'evil-ex-search-next)
  (evil-define-key 'normal magit-mode-map "N" 'evil-ex-search-previous)
  (evil-define-key 'normal magit-mode-map "z" nil)
  (evil-define-key 'normal magit-mode-map "Z" 'magit-stash-popup)
  (evil-define-key 'normal magit-mode-map "zt" 'evil-scroll-line-to-top)
  (evil-define-key 'normal magit-mode-map "zz" 'evil-scroll-line-to-center)
  )

(defun my-minibuffer-setup-hook ()
  (setq gc-cons-threshold most-positive-fixnum))

(defun my-minibuffer-exit-hook ()
  (setq gc-cons-threshold 10000000))
