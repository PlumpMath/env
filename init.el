;; disable splash screen, menu bar, toolbar, and scroll bars
(setq inhibit-splash-screen t)
(menu-bar-mode -1)
(tool-bar-mode -1)
(scroll-bar-mode -1)

;; maximize on startup
(toggle-frame-maximized)

;; display current column
(column-number-mode)

;; fill to 80 columns with single spaces
(setq-default fill-column 80)
(setq sentence-end-double-space nil)

;; packages
(defvar my-archives '(("melpa" . "https://melpa.org/packages/")))
(defvar my-packages '(auctex
                      evil
                      solarized-theme
                      markdown-mode))
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
