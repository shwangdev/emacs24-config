;; Copyright (C) 2012 Xiang Wang

(require 'icomplete+)

(icomplete-mode 1)

(defun icomplete-settings ()
  "Settings for `icomplete'."
  (define-key minibuffer-local-completion-map (kbd "SPC") 'minibuffer-complete-word))

(eval-after-load "icomplete"
  `(icomplete-settings))

(provide 'icomplete-settings)
