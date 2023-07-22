(global-display-line-numbers-mode)

; (if (not (server-running-p))
;     (progn
;       (atomic-chrome-start-server)
;       (server-start)))

(defalias 'sl 'sort-lines)

(put 'dired-find-alternate-file 'disabled nil)

(eval-after-load "company"
  '(progn
     (add-to-list 'company-backends 'company-anaconda)
     (add-to-list 'company-backends 'company-elm)))

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
(global-display-fill-column-indicator-mode)

;; --------------------------------------------------------------------------------------------------
;; -- Copilot
;; --------------------------------------------------------------------------------------------------
(with-eval-after-load 'company
  ;; disable inline previews
  (delq 'company-preview-if-just-one-frontend company-frontends))

(add-hook 'prog-mode-hook 'copilot-mode)

(define-key evil-insert-state-map (kbd "C-<tab>") 'copilot-accept-completion-by-word)
(define-key evil-insert-state-map (kbd "C-TAB") 'copilot-accept-completion-by-word)

(defun rk/no-copilot-mode ()
  "Helper for `rk/no-copilot-modes'."
  (copilot-mode -1))

(defvar rk/no-copilot-modes '(shell-mode
                              inferior-python-mode
                              eshell-mode
                              term-mode
                              vterm-mode
                              comint-mode
                              compilation-mode
                              debugger-mode
                              dired-mode-hook
                              compilation-mode-hook
                              flutter-mode-hook
                              minibuffer-mode-hook
                              markdown-mode)
  "Modes in which copilot is inconvenient.")

(defun rk/copilot-disable-predicate ()
  "When copilot should not automatically show completions."
  (or (member major-mode rk/no-copilot-modes)
      (company--active-p)))

(with-eval-after-load 'copilot
  (define-key copilot-completion-map (kbd "<tab>") 'copilot-accept-completion)
  (define-key copilot-completion-map (kbd "TAB") 'copilot-accept-completion)
  (add-to-list 'copilot-disable-predicates #'rk/copilot-disable-predicate))

(defun rk/copilot-quit ()
  "Run `copilot-clear-overlay' or `keyboard-quit'. If copilot is
cleared, make sure the overlay doesn't come back too soon."
  (interactive)
  (condition-case err
      (when copilot--overlay
        (lexical-let ((pre-copilot-disable-predicates copilot-disable-predicates))
          (setq copilot-disable-predicates (list (lambda () t)))
          (copilot-clear-overlay)
          (run-with-idle-timer
           1.0
           nil
           (lambda ()
             (setq copilot-disable-predicates pre-copilot-disable-predicates)))))
    (error handler)))

(advice-add 'keyboard-quit :before #'rk/copilot-quit)

(require 'eglot)
;; (add-to-list 'eglot-server-programs '(elixir-mode "~/src/elixir-ls/release/language_server.sh"))
