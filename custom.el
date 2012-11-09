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
(my-require-package 'emacs-jabber)
(my-require-package 'maxframe)
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

;;
(require 'icomplete-settings)
(require 'jabber-settings)
(require 'misc)
(require 'douban-music)
(require 'maxframe-settings)


(defun makeup()
  (interactive)
  (progn
    (byte-compile-file (expand-file-name "~/.emacs.d/init.el") 0)
    (byte-compile-file (expand-file-name "~/.emacs.d/custom.el") 0)
    (byte-recompile-directory (expand-file-name "~/.emacs.d/my-lisps") 0)
    (byte-recompile-directory (expand-file-name "~/.emacs.d/site-lisps") 0)
    )
)


