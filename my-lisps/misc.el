;; -*- Emacs-Lisp -*-

;; Time-stamp: <2012-11-07 21:02:59 Wednesday by devil>

;; -*- Emacs-Lisp -*-


(defun switch-to-scratch ()
  "switch to *scratch*"
  (interactive)
  (let ((buffer (get-buffer-create "*scratch*")))
    (switch-to-buffer buffer)
    (unless (equal major-mode 'lisp-interaction-mode)
      (lisp-interaction-mode))))
;;(global-set-key (kbd "C-x s") 'switch-to-scratch)

(defun toggle-fullscreen ()
  (interactive)
  ;; TODO: this only works for X. patches welcome for other OSes.
  (x-send-client-message nil 0 nil "_NET_WM_STATE" 32
                         '(2 "_NET_WM_STATE_MAXIMIZED_VERT" 0))
  (x-send-client-message nil 0 nil "_NET_WM_STATE" 32
                         '(2 "_NET_WM_STATE_MAXIMIZED_HORZ" 0)))
(provide 'misc)
