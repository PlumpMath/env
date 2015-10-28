;; disable splash screen, menu bar, toolbar, and scroll bars
(setq inhibit-splash-screen t)
(menu-bar-mode -1)
(tool-bar-mode -1)
(scroll-bar-mode -1)

;; maximize on startup
(toggle-frame-maximized)

;; display current column
(column-number-mode)

;; use spaces instead of tabs
(setq-default indent-tabs-mode nil)

;; fill to 80 columns with single spaces
(setq-default fill-column 80)
(setq sentence-end-double-space nil)

;;; packages
(defvar my-archives '(("melpa" . "https://melpa.org/packages/")))

(defvar my-packages
  '(;; general
    evil
    zenburn-theme

    ;; VCS
    magit

    ;; project
    projectile

    ;; markup
    markdown-mode
    auctex

    ;; Lisp
    smartparens
    evil-smartparens
    rainbow-delimiters

    ;; Clojure
    clojure-mode
    cider

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
(load-theme 'zenburn t)

;;; magit
(global-set-key (kbd "C-x g") 'magit-status)

;;; projectile
(projectile-global-mode)

;;; smartparens
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

(add-hook 'emacs-lisp-mode-hook #'smartparens-strict-mode)
(add-hook 'clojure-mode-hook #'smartparens-strict-mode)
(add-hook 'cider-repl-mode-hook #'smartparens-strict-mode)

(dolist (my-binding my-smartparens-bindings)
  (define-key smartparens-mode-map (kbd (car my-binding)) (cdr my-binding)))

;;; evil-smartparens
(add-hook 'smartparens-enabled-hook #'evil-smartparens-mode)

;;; rainbow-delimiters
(add-hook 'smartparens-enabled-hook #'rainbow-delimiters-mode)

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
