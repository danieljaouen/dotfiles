(setq evil-escape-excluded-major-modes '(magit-status-mode
                                         magit-revision-mode
                                         magit-diff-mode
                                         help-mode))
(setq explicit-shell-file-name "/usr/local/bin/fish")
(setq fci-rule-column 79)
(setq inferior-lisp-program "sbcl")
(setq-default evil-escape-key-sequence "jk")
(setq-default evil-escape-delay 0.4)
(setq-default evil-escape-unordered-key-sequence nil)
(setq js-indent-level 2)
(setq typescript-indent-level 2)
(setq backup-by-copying t
      make-backup-files nil
      create-lockfiles nil)
(customize-set-variable 'case-fold-search nil)
(customize-set-variable 'case-replace nil)
(customize-set-variable 'fill-column 79)

(if (eq system-type 'darwin)
    (setq browse-url-browser-function 'browse-url-default-macosx-browser))

(setq org-agenda-files `(,(expand-file-name "~/Dropbox/org/")))

(setq js2-mode-show-parse-errors nil)
(setq js2-mode-show-strict-warnings nil)
(setq inhibit-message t)
(setq dired-recursive-deletes 'always)
(setq ahs-include "\\s_+")

(setq evil-search-module 'evil-search)

(setq-default search-invisible t)

(setq spacemacs-default-jump-handlers
      (remove 'evil-goto-definition spacemacs-default-jump-handlers))
(setq c-basic-offset 2)
(setq user-mail-address "dcj24@cornell.edu")
(setq dotspacemacs-ask-for-lazy-installation nil)
(setq python-shell-interpreter-args "")
(setq undo-tree-history-directory-alist '(("." . "~/.emacs.d/undo")))
(setq inferior-lisp-program "/opt/homebrew/bin/sbcl")
(setq-default display-fill-column-indicator-column 101)
(setq chatgpt-shell-openai-key (getenv "OPENAI_API_KEY"))
(setq lsp-elixir-local-server-command "~/src/elixir-ls/release/language_server.sh")
(setq helm-ag-use-grep-ignore-list nil)
