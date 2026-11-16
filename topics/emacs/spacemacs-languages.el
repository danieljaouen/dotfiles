(defun insert-eex-statement ()
  (interactive)
  (insert "<%  %>")
  (backward-char 3))

(defun insert-eex-expression ()
  (interactive)
  (insert "<%=  %>")
  (backward-char 3))

(defun insert-jinja-statement ()
  (interactive)
  (insert "{%  %}")
  (backward-char 3))

(defun insert-jinja-expression ()
  (interactive)
  (insert "{{  }}")
  (backward-char 3))

(defun insert-elixir-map ()
  (interactive)
  (insert "%{}")
  (backward-char 1))

(setq c-basic-offset 2
      css-indent-offset 2
      js-indent-level 2
      typescript-indent-level 2
      js2-mode-show-parse-errors nil
      js2-mode-show-strict-warnings nil)

(setq web-mode-markup-indent-offset 2
      web-mode-code-indent-offset 2
      web-mode-css-indent-offset 2
      web-mode-script-padding 2
      web-mode-style-padding 2)
(add-to-list 'auto-mode-alist '("\\.leex\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.heex\\'" . web-mode))
(setq web-mode-engines-alist
      '(("elixir" . "\\.leex\\'") ("elixir" . "\\.heex\\'")))
(evil-define-key 'insert web-mode-map
  (kbd "C-d") nil
  (kbd "C-d o") 'insert-eex-statement
  (kbd "C-d t") 'insert-eex-expression
  (kbd "C-y") nil
  (kbd "C-y ,") 'spacemacs/emmet-expand)

(evil-define-key 'insert yaml-mode-map
  (kbd "C-d") nil
  (kbd "C-d o") 'insert-jinja-expression
  (kbd "C-d t") 'insert-jinja-statement)

(evil-define-key 'insert elixir-mode-map
  (kbd "C-d o") 'insert-elixir-map
  (kbd "C-d t") 'insert-elixir-map)

(with-eval-after-load 'elixir-mode
  (spacemacs/declare-prefix-for-mode 'elixir-mode "mt" "tests")
  (spacemacs/set-leader-keys-for-major-mode 'elixir-mode
    "ta" 'exunit-verify
    "tb" 'exunit-verify-all
    "tk" 'exunit-rerun
    "tt" 'exunit-verify-single))

(add-hook 'elixir-format-hook
          (lambda ()
            (setq elixir-format-arguments
                  (when (projectile-project-p)
                    (list "--dot-formatter"
                          (concat (locate-dominating-file buffer-file-name ".formatter.exs")
                                  ".formatter.exs"))))))

(add-hook 'elixir-mode-hook
          (lambda ()
            (subword-mode)
            (eglot-ensure)
            (company-mode)
            (flymake-mode)
            (add-hook 'before-save-hook 'elixir-format nil t)
            (add-hook 'before-save-hook 'eglot-format nil t)))

(setq inferior-lisp-program "sbcl")

(setq python-shell-interpreter-args ""
      flycheck-python-flake8-executable "flake8"
      flycheck-python-pylint-executable "pylint")

(setq org-agenda-files (list (expand-file-name "~/Dropbox/org/"))
      org-preview-latex-default-process 'verbatim)
