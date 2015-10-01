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

;; packages
(defvar my-archives '(("melpa" . "https://melpa.org/packages/")))
(defvar my-packages
  '(evil
    solarized-theme
    magit
    markdown-mode
    auctex
    paredit
    clojure-mode
    cider))
(require 'package)
(dolist (my-archive my-archives)
  (add-to-list 'package-archives my-archive))
(package-initialize)
(unless package-archive-contents
  (package-refresh-contents))
(dolist (my-package my-packages)
  (unless (package-installed-p my-package)
    (package-install my-package)))

;; evil
(evil-mode 1)

;; solarized-theme
(defun light ()
  "Enable the Solarized light theme."
  (interactive)
  (load-theme 'solarized-light t))
(defun dark ()
  "Enable the Solarized dark theme."
  (interactive)
  (load-theme 'solarized-dark t))
(light)

;; magit
(global-set-key (kbd "C-x g") 'magit-status)

;; paredit
(add-hook 'emacs-lisp-mode-hook 'paredit-mode)
(add-hook 'clojure-mode-hook 'paredit-mode)
(add-hook 'cider-repl-mode-hook 'paredit-mode)
