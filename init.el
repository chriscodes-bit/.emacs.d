(require 'package)
(add-to-list 'package-archives
              '("melpa" . "https://melpa.org/packages/")
              t)
(package-initialize)

(when (memq window-system '(mac ns))
      (exec-path-from-shell-initialize))

(menu-bar-mode 0)
(tool-bar-mode 0)
(scroll-bar-mode 0)

(add-to-list 'default-frame-alist
             '(font . "JetBrains Mono-14"))

(setq make-backup-files nil) ; stop creating ~ files

(add-hook 'racket-mode-hook 'eglot-ensure) ; start eglot when racket-mode is active
(add-hook 'racket-mode 'rainbow-delimiters-hook)

(global-company-mode 1)
(smartparens-global-mode 1)

(use-package evil
  :ensure t
  :init
  (setq evil-want-integration t)
  (setq evil-want-keybinding nil) ;; Required for evil-collection
  (setq evil-want-C-u-scroll t)
  (setq evil-want-C-i-jump nil)
  :config
  (evil-mode 1)
  ;; Define a key to return to normal mode
  (define-key evil-insert-state-map (kbd "C-g") 'evil-normal-state))

(use-package evil-collection
  :after evil
  :ensure t
  :config
  (evil-collection-init))

(use-package evil-leader
  :ensure t
  :config
  (setq evil-leader/leader "<SPC>")
  (global-evil-leader-mode)
  (evil-leader/set-key "ff" 'find-file)
  (evil-leader/set-key "o" 'other-window)
  (evil-leader/set-key "b" 'switch-to-buffer)
  (evil-leader/set-key "wq" 'delete-window)
  (evil-leader/set-key "wh" 'split-window-below)
  (evil-leader/set-key "wv" 'split-window-right)
  (evil-leader/set-key-for-mode 'racket-mode "rm" 'racket-run-module-at-point)
  (evil-leader/set-key-for-mode 'racket-mode "rr" 'racket-send-region)
  (evil-leader/set-key-for-mode 'racket-mode "ri"
    (lambda ()
      (interactive)
      (indent-region (point-min) (point-max)))))

(use-package which-key
  :ensure t
  :config
  (which-key-mode 1)
  (setq which-key-show-early-on-C-h t)
  (setq which-key-idle-delay 0.5))

(use-package ligature
  :config
  (ligature-set-ligatures 'prog-mode '("--" "---" "==" "===" "!=" "!==" "=!="
                              "=:=" "=/=" "<=" ">=" "&&" "&&&" "&=" "++" "+++" "***" ";;" "!!"
                              "??" "???" "?:" "?." "?=" "<:" ":<" ":>" ">:" "<:<" "<>" "<<<" ">>>"
                              "<<" ">>" "||" "-|" "_|_" "|-" "||-" "|=" "||=" "##" "###" "####"
                              "#{" "#[" "]#" "#(" "#?" "#_" "#_(" "#:" "#!" "#=" "^=" "<$>" "<$"
                              "$>" "<+>" "<+" "+>" "<*>" "<*" "*>" "</" "</>" "/>" "<!--" "<#--"
                              "-->" "->" "->>" "<<-" "<-" "<=<" "=<<" "<<=" "<==" "<=>" "<==>"
                              "==>" "=>" "=>>" ">=>" ">>=" ">>-" ">-" "-<" "-<<" ">->" "<-<" "<-|"
                              "<=|" "|=>" "|->" "<->" "<~~" "<~" "<~>" "~~" "~~>" "~>" "~-" "-~"
                              "~@" "[||]" "|]" "[|" "|}" "{|" "[<" ">]" "|>" "<|" "||>" "<||"
                              "|||>" "<|||" "<|>" "..." ".." ".=" "..<" ".?" "::" ":::" ":=" "::="
                              ":?" ":?>" "//" "///" "/*" "*/" "/=" "//=" "/==" "@_" "__" "???"
                              "<:<" ";;;"))
  (global-ligature-mode t))

(use-package doom-themes
  :ensure t
  :custom
  ;; Global settings (defaults)
  (doom-themes-enable-bold t)   ; if nil, bold is universally disabled
  (doom-themes-enable-italic t) ; if nil, italics is universally disabled
  ;; for treemacs users
  (doom-themes-treemacs-theme "doom-one") ; use "doom-colors" for less minimal icon theme
  :config
  (load-theme 'doom-acario-dark t)

  ;; Enable flashing mode-line on errors
  (doom-themes-visual-bell-config)
  ;; Enable custom neotree theme (nerd-icons must be installed!)
  (doom-themes-neotree-config)
  ;; or for treemacs users
  (doom-themes-treemacs-config)
  ;; Corrects (and improves) org-mode's native fontification.
  (doom-themes-org-config))

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(custom-safe-themes
   '("01a9797244146bbae39b18ef37e6f2ca5bebded90d9fe3a2f342a9e863aaa4fd"
     default))
 '(package-selected-packages
   '(company doom-themes evil evil-collection evil-leader
	     exec-path-from-shell gruber-darker-theme ligature
	     markdown-mode racket-mode rainbow-delimiters smartparens)))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
