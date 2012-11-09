;; -*- Emacs-Lisp -*-

;; Time-stamp: <2012-11-07 21:02:59 Wednesday by devil>

;; -*- Emacs-Lisp -*-

(require 'cedet)
(global-ede-mode 1)                      ; Enable the Project management system
(semantic-load-enable-code-helpers)      ; Enable prototype help and smart completion 
(global-srecode-minor-mode 1) 
(semantic-load-enable-minimum-features)
(semantic-load-enable-guady-code-helpers)
(semantic-load-enable-excessive-code-helpers)

;; (semantic-mru-bookmark-mode)
;; (semantic-decoration-mode)

;;(semantic-idle-completions-mode)
;;(semantic-highlight-edits-mode )

(semantic-load-enable-minimum-features)
(semantic-load-enable-code-helpers)
(semantic-load-enable-guady-code-helpers)
(semantic-load-enable-semantic-debugging-helpers)

(global-set-key [f12] 'semantic-ia-fast-jump)


(global-set-key [S-f12]
		(lambda ()
		  (interactive)
		  (if (ring-empty-p (oref semantic-mru-bookmark-ring ring))
		      (error "Semantic Bookmark ring is currently empty"))
		  (let* ((ring (oref semantic-mru-bookmark-ring ring))
			 (alist (semantic-mrub-ring-to-assoc-list ring))
			 (first (cdr (car alist))))
		    (if (semantic-equivalent-tag-p (oref first tag)
						   (semantic-current-tag))
			(setq first (cdr (car (cdr alist)))))
		    (semantic-mrub-switch-tags first))))

(global-ede-mode t)

(enable-visual-studio-bookmarks)

(require 'eassist nil 'noerror)

(setq eassist-header-switches
      '(("h" . ("cpp" "cxx" "c++" "CC" "cc" "C" "c" "mm" "m"))
        ("hh" . ("cc" "CC" "cpp" "cxx" "c++" "C"))
        ("hpp" . ("cpp" "cxx" "c++" "cc" "CC" "C"))
        ("hxx" . ("cxx" "cpp" "c++" "cc" "CC" "C"))
        ("h++" . ("c++" "cpp" "cxx" "cc" "CC" "C"))
        ("H" . ("C" "CC" "cc" "cpp" "cxx" "c++" "mm" "m"))
        ("HH" . ("CC" "cc" "C" "cpp" "cxx" "c++"))
        ("cpp" . ("hpp" "hxx" "h++" "HH" "hh" "H" "h"))
        ("cxx" . ("hxx" "hpp" "h++" "HH" "hh" "H" "h"))
        ("c++" . ("h++" "hpp" "hxx" "HH" "hh" "H" "h"))
        ("CC" . ("HH" "hh" "hpp" "hxx" "h++" "H" "h"))
        ("cc" . ("hh" "HH" "hpp" "hxx" "h++" "H" "h"))
        ("C" . ("hpp" "hxx" "h++" "HH" "hh" "H" "h"))
        ("c" . ("h"))
        ("m" . ("h"))
        ("mm" . ("h"))))

(require 'semantic-tag-folding nil 'noerror)
(global-semantic-tag-folding-mode 1)
(define-key semantic-tag-folding-mode-map (kbd "C-c , -") 'semantic-tag-folding-fold-block)
(define-key semantic-tag-folding-mode-map (kbd "C-c , +") 'semantic-tag-folding-show-block)
(define-key semantic-tag-folding-mode-map (kbd "C-_") 'semantic-tag-folding-fold-all)
(define-key semantic-tag-folding-mode-map (kbd "C-+") 'semantic-tag-folding-show-all)
(global-set-key (kbd "C-?") 'global-semantic-tag-folding-mode)


(when (and window-system (require 'semantic-tag-folding nil 'noerror))
  (global-semantic-tag-folding-mode 1)
  (global-set-key (kbd "C-?") 'global-semantic-tag-folding-mode)
  (define-key semantic-tag-folding-mode-map (kbd "C-c , -") 'semantic-tag-folding-fold-block)
  (define-key semantic-tag-folding-mode-map (kbd "C-c , +") 'semantic-tag-folding-show-block)
  (define-key semantic-tag-folding-mode-map (kbd "C-_") 'semantic-tag-folding-fold-all)
  (define-key semantic-tag-folding-mode-map (kbd "C-+") 'semantic-tag-folding-show-all))
(provide 'cedet-settings)
