(setq backup-by-copying t
      make-backup-files nil
      create-lockfiles nil)

(setq-default case-fold-search nil
              case-replace nil
              search-invisible t
              fill-column 79
              display-fill-column-indicator-column 101
              display-line-numbers-type 'relative)

(global-display-line-numbers-mode)
(global-display-fill-column-indicator-mode)

(setq inhibit-message t)
(add-hook 'isearch-mode-hook (lambda () (setq inhibit-message nil)))
(add-hook 'isearch-mode-end-hook (lambda () (setq inhibit-message t)))

(setq-default evil-escape-key-sequence "jk"
              evil-escape-delay 0.4)
(setq evil-escape-excluded-major-modes '(magit-status-mode
                                         magit-revision-mode
                                         magit-diff-mode
                                         help-mode))

(setq spacemacs-default-jump-handlers
      (remove 'evil-goto-definition spacemacs-default-jump-handlers))
(setq ahs-include "\\s_+")
(setq helm-ag-use-grep-ignore-list nil)
(setq dired-recursive-deletes 'always)
(put 'dired-find-alternate-file 'disabled nil)

(add-hook 'before-save-hook 'delete-trailing-whitespace)
(add-function :after after-focus-change-function
              (lambda ()
                (unless (frame-focus-state)
                  (save-some-buffers t))))

(defalias 'sl 'sort-lines)

(defun align-repeat (start end regexp)
  "Align the region on every occurrence of REGEXP."
  (interactive "r\nsAlign regexp: ")
  (align-regexp start end
                (concat "\\(\\s-*\\)" regexp) 1 1 t))

(defun my-tab-command ()
  (interactive)
  (indent-for-tab-command)
  (yas-expand))
