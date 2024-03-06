(add-hook 'before-save-hook 'delete-trailing-whitespace)

(with-eval-after-load 'company
  (define-key company-active-map "\C-d" nil)
  (define-key company-active-map "\C-do" 'insert-opening-non-printed)
  (define-key company-active-map "\C-dt" 'insert-opening-printed)
  (define-key company-active-map (kbd "C-n") 'company-select-next)
  (define-key company-active-map (kbd "C-p") 'company-select-previous)
  (define-key company-active-map (kbd "C-w") 'evil-delete-backward-word)
  (define-key company-active-map (kbd "C-h") 'backward-delete-char))

(add-hook 'web-mode-hook  'my-web-mode-hook)

(add-hook 'gnus-topic-mode-hook   (my-gnus-mode-hook-wrapper
                                   gnus-topic-mode-map
                                   )
          )
(add-hook 'gnus-group-mode-hook   (my-gnus-mode-hook-wrapper
                                   gnus-group-mode-map
                                   )
          )
(add-hook 'gnus-server-mode-hook  (my-gnus-mode-hook-wrapper
                                   gnus-server-mode-map
                                   )
          )
(add-hook 'gnus-browse-mode-hook  (my-gnus-mode-hook-wrapper
                                   gnus-browse-mode-map
                                   )
          )
(add-hook 'gnus-article-mode-hook (my-gnus-mode-hook-wrapper
                                   gnus-article-mode-map
                                   )
          )
(add-hook 'gnus-summary-mode-hook (my-gnus-mode-hook-wrapper
                                   gnus-summary-mode-map
                                   )
          )

(add-hook 'isearch-mode-hook 'my-isearch-mode-hook)
(add-hook 'isearch-mode-end-hook 'my-isearch-mode-end-hook)
(add-hook 'magit-mode-hook 'my-magit-mode-hook)

(with-eval-after-load 'auto-highlight-symbol
  (define-key evil-motion-state-map (kbd "*") 'evil-ex-search-word-forward)
  (define-key evil-motion-state-map (kbd "#") 'evil-ex-search-word-backward))

(add-hook 'minibuffer-setup-hook 'my-minibuffer-setup-hook)
(add-hook 'minibuffer-exit-hook 'my-minibuffer-exit-hook)

(add-hook 'focus-out-hook (lambda () (interactive) (save-some-buffers t)))

(add-hook 'elixir-format-hook (lambda ()
                                (if (projectile-project-p)
                                    (setq elixir-format-arguments
                                          (list "--dot-formatter"
                                                (concat
                                                 (locate-dominating-file buffer-file-name ".formatter.exs")
                                                 ".formatter.exs")))
                                  (setq elixir-format-arguments nil))))

(add-hook 'elixir-mode-hook
          (lambda () (add-hook 'before-save-hook 'elixir-format nil t)))

(add-hook
 'elixir-mode-hook
 (lambda ()
   (subword-mode)
   (eglot-ensure)
   (company-mode)
   (flymake-mode)
   (add-hook 'before-save-hook 'eglot-format nil t)))

(add-hook
 'lfe-mode-hook
 (lambda ()
   (copilot-mode)))
