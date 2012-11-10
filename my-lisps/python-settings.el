;; -*- Emacs-Lisp -*-

;; Time-stamp: <2012-11-07 21:02:59 Wednesday by devil>

;; -*- Emacs-Lisp -*-


;;(require 'ipython)
(require 'python-mode)
(require 'pymacs)
(require 'pycomplete)

(setq py-python-command-args '( "--colors" "Linux"))
(setq py-mode-map python-mode-map)
(pymacs-load "ropemacs" "rope-")
(add-hook 'python-mode-hook
          '(lambda () (eldoc-mode 1)) t)

(add-hook 'python-mode-hook #'(lambda ()
                                (define-key py-mode-map (kbd "M-<tab>") 'anything-ipython-complete)))
(add-hook 'ipython-shell-hook #'(lambda ()
                                  (define-key py-mode-map (kbd "M-<tab>") 'anything-ipython-complete)))

(when (require 'anything-show-completion nil t)
  (use-anything-show-completion 'anything-ipython-complete
                                '(length initial-pattern)))

(autoload 'python-mode "python-mode" "Python Mode." t)
(add-to-list 'auto-mode-alist '("\\.py\\'" . python-mode))
(add-to-list 'interpreter-mode-alist '("python" . python-mode))

(provide 'python-settings)
