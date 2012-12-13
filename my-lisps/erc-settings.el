;; -*- Emacs-Lisp -*-

;; Time-stamp: <2012-11-07 21:02:59 Wednesday by devil>

;; -*- Emacs-Lisp -*-

(require 'socks)
(require 'erc)
(require 'erc-notify)
(require 'erc-highlight-nicknames)
(erc-highlight-nicknames-mode)
(erc-notify-mode)
(defun erc-use-proxy ()
  (interactive)
  (setq erc-server-connect-function 'socks-open-network-stream)
  (setq socks-server (list "My socks server" "127.0.0.1" 6650 5))
)
(provide 'erc-settings)
