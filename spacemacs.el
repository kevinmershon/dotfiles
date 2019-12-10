;; add the following line to ~/.spacemacs user-config
;;
;; (load-file "<path to this file>/spacemacs.el")
;;

;; parinfer config
;;
;; (requires parinfer be added to dotspacemacs-additional-packages)
;;
(use-package parinfer
  :ensure t
  :bind   (("C-," . parinfer-toggle-mode))
  :init   (progn (setq parinfer-extensions '(defaults        ;; should be included.
                                              pretty-parens   ;; different paren styles for different modes.
                                              ;;evil            ;; If you use Evil.
                                              ;;lispy         ;; If you use Lispy. With this extension, you should install Lispy and do not enable lispy-mode directly.
                                              paredit         ;; Introduce some paredit commands.
                                              smart-tab       ;; C-b & C-f jump positions and smart shift with tab & S-tab.
                                              smart-yank))
                 ;; Yank behavior depend on mode.
                 (add-hook 'clojure-mode-hook #'
                           parinfer-mode)
                 (add-hook 'emacs-lisp-mode-hook #'
                           parinfer-mode)
                 (add-hook 'common-lisp-mode-hook #'
                           parinfer-mode)
                 (add-hook 'scheme-mode-hook #'
                           parinfer-mode)
                 (add-hook 'lisp-mode-hook #'
                           parinfer-mode)))

;; treemacs config
(use-package treemacs
             :ensure t
             :config (treemacs-toggle-show-dotfiles)
             :bind   (:map global-map ("<f2>" . treemacs)))

;; disable global line highlight mode
(global-hl-line-mode 0)

;; only show line numbers in buffers with code
(add-hook 'prog-mode-hook #'display-line-numbers-mode)

;; comment with double Control-C
(global-set-key (kbd "C-c C-c") 'comment-line)

;; js bindings
(defun js-bindings()
  ;; delete trailing whitespace on save
  (add-hook 'before-save-hook 'web-beautify-js))
(add-hook 'js-mode-hook 'js-bindings)

;; clojure bindings
(defun clojure-bindings ()
  ;; eqp quick-eval in minibuffer
  (define-key evil-normal-state-map (kbd "e q p") 'cider-read-and-eval))
(add-hook 'clojure-mode-hook 'clojure-bindings)
