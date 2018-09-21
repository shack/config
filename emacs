(require 'package) ;; You might already have this line
(let* ((no-ssl (and (memq system-type '(windows-nt ms-dos))
                    (not (gnutls-available-p))))
       (url (concat (if no-ssl "http" "https") "://melpa.org/packages/")))
  (add-to-list 'package-archives (cons "melpa" url) t))
(when (< emacs-major-version 24)
  ;; For important compatibility libraries like cl-lib
  (add-to-list 'package-archives '("gnu" . "http://elpa.gnu.org/packages/")))
(package-initialize) ;; You might already have this line

; https://github.com/syl20bnr/spacemacs/issues/8853
(setq evil-want-abbrev-expand-on-insert-exit nil)
(require 'evil)
(evil-mode 1)

(load-file "~/.emacs.d/lisp/PG/generic/proof-site.el")

(require 'math-symbol-lists)
(quail-define-package "math" "UTF-8" "Ω" t)
(mapc (lambda (x)
        (if (cddr x)
            (quail-defrule (cadr x) (car (cddr x)))))
      (append math-symbol-list-basic math-symbol-list-extended))

(add-hook 'proof-mode-hook (lambda () (set-input-method "math") ))
(add-hook 'coq-mode-hook #'company-coq-mode)

(global-set-key (kbd "RET") 'newline-and-indent)

(setq exec-path (append exec-path '("/usr/local/bin")))

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(package-selected-packages (quote (company-coq evil))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
