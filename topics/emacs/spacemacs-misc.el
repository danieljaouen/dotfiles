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
