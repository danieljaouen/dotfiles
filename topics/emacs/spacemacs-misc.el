(global-display-line-numbers-mode)

; (if (not (server-running-p))
;     (progn
;       (atomic-chrome-start-server)
;       (server-start)))

(org-babel-do-load-languages
 'org-babel-load-languages
 '((lisp . t)))

(defalias 'sl 'sort-lines)

(put 'dired-find-alternate-file 'disabled nil)

(eval-after-load "company"
  '(progn
     (add-to-list 'company-backends 'company-anaconda)
     (add-to-list 'company-backends 'company-elm)))

(use-package lsp-mode
  :commands lsp
  :ensure t
  :diminish lsp-mode
  :hook
  (elixir-mode . lsp)
  :init
  (add-to-list 'exec-path "~/src/elixir-ls/release"))

(with-eval-after-load 'elixir-mode
  (spacemacs/declare-prefix-for-mode 'elixir-mode
    "mt" "tests" "testing related functionality")
  (spacemacs/set-leader-keys-for-major-mode 'elixir-mode
    "tb" 'exunit-verify-all
    "ta" 'exunit-verify
    "tk" 'exunit-rerun
    "tt" 'exunit-verify-single))


(add-to-list 'auto-mode-alist '("\\.leex\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.heex\\'" . web-mode))
(setq web-mode-engines-alist
      '(("elixir" . "\\.leex\\'") ("elixir" . "\\.heex\\'")))

(setq TeX-PDF-mode t)
(add-hook 'LaTeX-mode-hook
          (lambda ()
            (push
             '("latexmk" "latexmk -pdf %s" TeX-run-TeX nil t
               :help "Run latexmk on file")
             TeX-command-list)))
(add-hook 'TeX-mode-hook '(lambda () (setq TeX-command-default "latexmk")))
(setq flycheck-python-flake8-executable "flake8")
(setq flycheck-python-pylint-executable "pylint")
(setq rust-format-on-save t)
(pyenv-mode)
