(require 'org)

(org-babel-load-file (expand-file-name "config/packages.org" user-emacs-directory))
(org-babel-load-file (expand-file-name "config/core.org" user-emacs-directory))
(org-babel-load-file (expand-file-name "config/ui.org" user-emacs-directory))
(org-babel-load-file (expand-file-name "config/languages.org" user-emacs-directory))

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(package-selected-packages '(doom-themes forth-mode)))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
