(require 'package)
(add-to-list 'package-archives '("melpa" . "https://melpa.org/packages/") t)
(package-initialize)

; https://github.com/syl20bnr/spacemacs/issues/8853
; (setq evil-want-abbrev-expand-on-insert-exit nil)
(require 'evil)
(evil-mode 1)

(global-set-key (kbd "RET") 'newline-and-indent)
(setq-default indent-tabs-mode nil)
(setq tab-width 4)

(setq exec-path (append exec-path '("/usr/local/bin")))

(add-hook 'coq-mode-hook #'company-coq-mode)

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(package-selected-packages '(evil company-coq proof-general)))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
