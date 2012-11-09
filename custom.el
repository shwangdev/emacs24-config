;; -*- Emacs-Lisp -*-

;; Time-stamp: <2012-11-07 21:02:59 Wednesday by devil>

;; -*- Emacs-Lisp -*-

(require 'el-get)

(defun my-require-package (package-name)
  "Provide an automatic way to fetch packages from el-get storage"
  (unless  (require package-name nil 'noerror)
    (progn
      (el-get-install package-name)
      )
    )
  )

(my-require-package 'color-theme)
(color-theme-classic)
(my-require-package 'json)
(my-require-package 'erc)
(my-require-package 'emacs-jabber)
(my-require-package 'icomplete+)

;; 
(defconst my-emacs-path "~/.emacs.d/" )
(defconst my-emacs-my-lisps-path  (concat my-emacs-path "my-lisps/") )
(defconst my-emacs-templates-path (concat my-emacs-path "templates/") "Path for templates")

;; add folders under `my-emacs-lisps-path' to `load-path'
(load (concat my-emacs-my-lisps-path "my-subdirs"))
;;(my-add-subdirs-to-load-path my-emacs-lisps-path)
(my-add-subdirs-to-load-path my-emacs-my-lisps-path)

;;
(require 'icomplete-settings)
(require 'misc)
(require 'douban-music)
(toggle-fullscreen)
