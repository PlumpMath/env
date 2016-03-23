;; disable splash screen, menu bar, toolbar, and scroll bars
(setq inhibit-splash-screen t)
(menu-bar-mode -1)
(tool-bar-mode -1)
(scroll-bar-mode -1)

;; maximize on startup
(toggle-frame-maximized)

;; display current column
(column-number-mode 1)

;; indent with 2 spaces, no tabs
(setq-default indent-tabs-mode nil)
(setq css-indent-offset 2)
(setq js-indent-level 2)

;; fill to 80 columns with single spaces
(setq-default fill-column 80)
(setq sentence-end-double-space nil)

;; show trailing whitespace
(setq-default show-trailing-whitespace t)

;; ido
(ido-mode 1)
(ido-everywhere 1)

;; windmove
(windmove-default-keybindings)

;;; packages
(defvar my-archives '(("melpa" . "https://melpa.org/packages/")))

(defvar my-packages
  '(;; general
    evil
    zenburn-theme

    ;; ido
    ido-ubiquitous
    smex
    ido-yes-or-no

    ;; autocomplete
    company

    ;; VCS
    magit

    ;; project
    projectile

    ;; markup
    tagedit
    markdown-mode
    auctex

    ;; web
    impatient-mode

    ;; Lisp
    smartparens
    evil-smartparens
    rainbow-delimiters

    ;; Clojure
    clojure-mode
    cider
    clj-refactor

    ;; Scheme
    geiser

    ;; Haskell
    haskell-mode))

(require 'package)

(dolist (my-archive my-archives)
  (add-to-list 'package-archives my-archive))

(package-initialize)

(unless package-archive-contents
  (package-refresh-contents))

(dolist (my-package my-packages)
  (unless (package-installed-p my-package)
    (package-install my-package)))

;;; evil
(evil-mode 1)

;;; zenburn-theme
(defvar my-theme 'zenburn)
(defvar *my-theme-active* nil)

(defun theme ()
  (interactive)
  (if *my-theme-active*
      (disable-theme my-theme)
    (load-theme my-theme t))
  (setq *my-theme-active* (not *my-theme-active*)))

(theme)

;;; ido-ubiquitous
(ido-ubiquitous-mode 1)

;;; smex
(defvar my-smex-bindings
  '(("M-x" . smex)
    ("M-X" . smex-major-mode-commands)
    ("C-c C-c M-x" . execute-extended-command)))

(dolist (my-binding my-smex-bindings)
  (global-set-key (kbd (car my-binding)) (cdr my-binding)))

;;; ido-yes-or-no
(ido-yes-or-no-mode 1)

;;; company
(global-company-mode 1)
(setq company-idle-delay 0)

;;; magit
(global-set-key (kbd "C-x g") 'magit-status)
(setq magit-completing-read-function 'magit-ido-completing-read)

;;; projectile
(projectile-global-mode 1)

;;; tagedit
(add-hook 'html-mode-hook (lambda () (tagedit-mode 1)))
(tagedit-add-experimental-features)
(setq tagedit-expand-one-line-tags nil)

;;; smartparens
(defvar my-smartparens-modes
  '(html-mode-hook
    css-mode-hook
    emacs-lisp-mode-hook
    clojure-mode-hook
    cider-repl-mode-hook
    geiser-mode-hook
    geiser-repl-mode-hook))

(defvar my-smartparens-bindings
  '(("C-M-f" . sp-next-sexp)
    ("C-M-b" . sp-backward-sexp)

    ("C-M-d" . sp-down-sexp)
    ("C-M-a" . sp-backward-down-sexp)
    ("C-M-u" . sp-up-sexp)
    ("C-M-e" . sp-backward-up-sexp)

    ("C-M-n" . sp-forward-sexp)
    ("C-M-p" . sp-previous-sexp)

    ("C-S-d" . sp-beginning-of-sexp)
    ("C-S-a" . sp-end-of-sexp)

    ("C-M-k" . sp-kill-sexp)
    ("C-M-w" . sp-copy-sexp)

    ("M-<delete>" . sp-unwrap-sexp)
    ("M-<backspace>" . sp-backward-unwrap-sexp)

    ("M-D" . sp-splice-sexp)
    ("C-S-<backspace>" . sp-splice-sexp-killing-around)

    ("C-<right>" . sp-forward-slurp-sexp)
    ("C-<left>" . sp-forward-barf-sexp)
    ("C-S-<left>" . sp-backward-slurp-sexp)
    ("C-S-<right>" . sp-backward-barf-sexp)

    ("C-M-]" . sp-select-next-thing-exchange)))

(require 'smartparens-config)
(setq sp-cancel-autoskip-on-backward-movement nil)

(dolist (mode-hook my-smartparens-modes)
  (add-hook mode-hook (lambda () (smartparens-strict-mode 1))))

(dolist (my-binding my-smartparens-bindings)
  (define-key smartparens-mode-map (kbd (car my-binding)) (cdr my-binding)))

;;; evil-smartparens
(add-hook 'smartparens-enabled-hook (lambda () (evil-smartparens-mode 1)))

;;; rainbow-delimiters
(add-hook 'smartparens-enabled-hook (lambda () (rainbow-delimiters-mode 1)))

;;; cider
(setq cider-repl-display-help-banner nil)

;;; clj-refactor
(setq cljr-warn-on-eval nil)
(add-hook 'clojure-mode-hook
          (lambda ()
            (clj-refactor-mode 1)
            (yas-minor-mode 1)
            (cljr-add-keybindings-with-prefix "C-c C-m")))

;;; geiser
(setq geiser-active-implementations '(racket))

;;; haskell-mode
(defvar my-haskell-mode-bindings
  '(("C-c C-l" . haskell-process-load-or-reload)
    ("C-`" . haskell-interactive-bring)
    ("C-c C-t" . haskell-process-do-type)
    ("C-c C-i" . haskell-process-do-info)
    ("C-c C-c" . haskell-process-cabal-build)
    ("C-c C-k" . haskell-interactive-mode-clear)
    ("C-c c" . haskell-process-cabal)
    ("SPC" . haskell-mode-contextual-space)))

(require 'haskell-interactive-mode)
(require 'haskell-process)
(add-hook 'haskell-mode-hook 'interactive-haskell-mode)

(dolist (my-binding my-haskell-mode-bindings)
  (define-key haskell-mode-map (kbd (car my-binding)) (cdr my-binding)))
