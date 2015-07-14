;; disable splash screen, menu bar, and toolbar
(setq inhibit-splash-screen t)
(menu-bar-mode -1)
(tool-bar-mode -1)

;; maximize on startup
(toggle-frame-maximized)

;; display current column
(column-number-mode)

;; Evil
(add-to-list 'load-path "~/.emacs.d/evil")
(require 'evil)
(evil-mode 1)

;; Solarized
(add-to-list 'custom-theme-load-path "~/.emacs.d/emacs-color-theme-solarized")
(load-theme 'solarized t)
(defun set-frame-background (mode)
  "Set the current frame's Solarized background to MODE."
  (set-frame-parameter nil 'background-mode mode)
  (enable-theme 'solarized))
(defun light ()
  "Use the Solarized light background in the current frame."
  (interactive)
  (set-frame-background 'light))
(defun dark ()
  "Use the Solarized dark background in the current frame."
  (interactive)
  (set-frame-background 'dark))

;; markdown-mode
(add-to-list 'load-path "~/.emacs.d/markdown-mode")
(autoload 'markdown-mode "markdown-mode"
  "Major mode for editing Markdown files" t)
(add-to-list 'auto-mode-alist '("\\.md\\'" . markdown-mode))
