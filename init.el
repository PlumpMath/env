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

;; Evil
(evil-mode 1)

;; Solarized
(add-to-list 'custom-theme-load-path "~/.emacs.d/emacs-color-theme-solarized")
(load-theme 'solarized t)

(defun set-frame-background (mode)
  "Set the current frame's Solarized background to MODE.

Some existing output in Term mode may keep its previous colors."
  (set-frame-parameter nil 'background-mode mode)
  (enable-theme 'solarized))

(defun light ()
  "Use the Solarized light background in the current frame.

See `set-frame-background' for more details."
  (interactive)
  (set-frame-background 'light))

(defun dark ()
  "Use the Solarized dark background in the current frame.

See `set-frame-background' for more details."
  (interactive)
  (set-frame-background 'dark))
