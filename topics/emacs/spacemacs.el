;; -*- mode: emacs-lisp -*-

(defun dotspacemacs/layers ()
  (setq-default
   dotspacemacs-ask-for-lazy-installation nil
   dotspacemacs-configuration-layers
   '(ansible
     (auto-completion :variables
                      auto-completion-enable-sort-by-usage t
                      auto-completion-enable-snippets-in-popup t)
     c-c++
     claude-code
     clojure
     colors
     common-lisp
     csv
     elixir
     emacs-lisp
     emoji
     erlang
     git
     helm
     html
     javascript
     lua
     markdown
     (org :variables
          org-enable-reveal-js-support t)
     osx
     python
     react
     ruby
     ruby-on-rails
     shell
     shell-scripts
     sql
     swift
     syntax-checking
     tmux
     typescript
     version-control
     vimscript
     yaml)
   dotspacemacs-additional-packages
   '(exunit
     hy-mode
     lfe-mode)
   dotspacemacs-excluded-packages
   '(alchemist
     evil-search-highlight-persist)))

(defun dotspacemacs/init ()
  (setq-default
   dotspacemacs-elpa-subdirectory nil
   dotspacemacs-themes '(monokai
                         spacemacs-dark
                         spacemacs-light)
   dotspacemacs-default-font '("Menlo"
                               :size 12
                               :weight normal
                               :width normal
                               :powerline-scale 1.1)
   dotspacemacs-maximized-at-startup nil))

(defun dotspacemacs/user-init ()
  (setq custom-file (concat spacemacs-cache-directory "custom.el"))
  (setq sentence-end-double-space t))

(defun dotspacemacs/user-config ()
  (load custom-file 'noerror)
  (dolist (file '("editing" "keybindings" "languages"))
    (load (concat "~/.spacemacs.d/" file))))
