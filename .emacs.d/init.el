;; My emacs config!

(scroll-bar-mode -1)
(tool-bar-mode -1)
(tooltip-mode -1)
(menu-bar-mode -1)
(set-frame-parameter nil `undecorated t) ;; Removes the title bar!

(set-face-attribute `default nil :font "Hack Nerd Font" :height 120)

(setq display-line-numbers 'relative)

(require `package)

(setq package-archives `(("melpa" . "https://melpa.org/packages/")
			 ("org" . "https://orgmode.org/elpa/")
			 ("elpa" . "https://elpa.gnu.org/packages/")))

(package-initialize)
(unless package-archive-contents
  (package-refresh-contents))

(require `use-package)
(setq use-package-always-ensure t)

(use-package smex
  :bind (("M-x" . smex)
	 ("M-X" . smex-major-mode-commands)
	 ("C-c C-c M-x" . execute-extended-command))
  :config
  (smex-initialize))

(ido-mode 1)
(setq ido-everywhere 1)
(setq ido-enable-flex-matching 1)

(use-package doom-themes
  :config
  (load-theme `doom-xcode t))

(use-package evil
  :init
  (setq evil-want-integration t)
  (setq evil-want-keybinding nil)
  (setq evil-want-C-u-scroll t)
  (setq evil-want-C-i-jump nil)
  :config
  (evil-mode 1))

(use-package evil-collection
  :after evil
  :config
  (evil-collection-init))

(use-package doom-modeline
  :ensure t
  :init (doom-modeline-mode 1))

(use-package which-key
  :defer 0
  :diminish which-key-mode
  :config
  (which-key-mode)
  (setq which-key-idle-delay 1))

(use-package magit)
