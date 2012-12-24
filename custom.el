;; -*- Emacs-Lisp -*-

;; Time-stamp: <2012-11-07 21:02:59 Wednesday by devil>

;; -*- Emacs-Lisp -*-

(require 'el-get)
(require 'cl)

(defun my-require-package (package-name)
  "Provide an automatic way to fetch packages from el-get storage"
  (unless  (require package-name nil 'noerror)
    (progn
      (el-get-install package-name)
      )
    )
  )

(my-require-package 'json)
(my-require-package 'erc)
(my-require-package 'erc-highlight-nicknames)
(my-require-package 'erc-nick-notify)
(my-require-package 'emacs-jabber)
(my-require-package 'icomplete+)
(my-require-package 'maxframe)
(my-require-package 'linum+)
;;(my-require-package 'emms)
(my-require-package 'python)
(my-require-package 'python-mode)
(my-require-package 'ipython)
(my-require-package 'ac-python)
(my-require-package 'anything-ipython)
(my-require-package 'python-pep8)
(my-require-package 'pymacs)
(eval-after-load "pymacs"
  '(add-to-list 'pymacs-load-path "~/.emacs.d/"))
(my-require-package 'anything)
(my-require-package 'shell-pop)
(my-require-package 'shell-switcher)
(my-require-package 'ecb)
;; 
(defconst my-emacs-path "~/.emacs.d/" )
(defconst my-emacs-lisps-path  (concat my-emacs-path "site-lisps/"))
(defconst my-emacs-my-lisps-path  (concat my-emacs-path "my-lisps/"))
(defconst my-emacs-templates-path (concat my-emacs-path "templates/") "Path for templates")

;; add folders under `my-emacs-lisps-path' to `load-path'
(load (concat my-emacs-my-lisps-path "my-subdirs"))
(my-add-subdirs-to-load-path my-emacs-lisps-path)
(my-add-subdirs-to-load-path my-emacs-my-lisps-path)

(my-require-package 'auto-complete+)
(my-require-package 'auto-complete-etags)
(my-require-package 'auto-complete-extension)
(my-require-package 'auto-complete-yasnippet)
(my-require-package 'xml-parse)
(my-require-package 'pos-tip)
(require 'solarized)
(load-theme 'solarized-dark t)
;;
(require 'erc-settings)
(require 'icomplete-settings)
(require 'jabber-settings)
(require 'misc)
(require 'douban-music)
(require 'maxframe-settings)
(require 'auto-complete-settings)
(require 'linum-settings)
;;(require 'emms-settings)
(require 'cedet-settings)
(require 'gmail-mew)
(require 'python-settings)
(require 'shell-command-settings)
(require 'cc-mode-settings)
(require 'ecb-settings)
(require 'dict-youdao)
(setq tab-width 8 indent-tabs-mode nil)
;;
(defun makeup()
  (interactive)
  (progn
    (byte-compile-file (expand-file-name "~/.emacs.d/init.el") 0)
    (byte-compile-file (expand-file-name "~/.emacs.d/custom.el") 0)
    (byte-recompile-directory (expand-file-name "~/.emacs.d/my-lisps") 0)
    (byte-recompile-directory (expand-file-name "~/.emacs.d/site-lisps") 0)
    )
  )
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(custom-safe-themes (quote ("8aebf25556399b58091e533e455dd50a6a9cba958cc4ebb0aab175863c25b9a4" default)))
 '(ecb-options-version "2.40")
 '(safe-local-variable-values (quote ((eval ignore-errors "Write-contents-functions is a buffer-local alternative to before-save-hook" (add-hook (quote write-contents-functions) (lambda nil (delete-trailing-whitespace) nil)) (require (quote whitespace)) "Sometimes the mode needs to be toggled off and on." (whitespace-mode 0) (whitespace-mode 1)) (whitespace-line-column . 80) (whitespace-style face trailing lines-tail) (require-final-newline . t)))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
