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

;; GNU packages
(package-initialize)
(unless package-archive-contents
  (package-refresh-contents))

(dolist (package '(auctex))
  (unless (package-installed-p package)
    (package-install package)))

;; Evil
(add-to-list 'load-path "~/.emacs.d/evil")
(require 'evil)
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

;; markdown-mode
(add-to-list 'load-path "~/.emacs.d/markdown-mode")
(autoload 'markdown-mode "markdown-mode"
  "Major mode for editing Markdown files" t)
(add-to-list 'auto-mode-alist '("\\.md\\'" . markdown-mode))
