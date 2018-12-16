;; Initialisation for the org-mode organiser
;; ----------------------------------------------------------------------------

;;; Dependencies

(require 'org)
;;(require 'org-export-latex)
;(require 'org-latex)
;(require 'org-install)
;;; Package paths
;(add-to-list 'load-path
;             (expand-file-name "~/.emacs.d/packages/org-mode/lisp"))
;(add-to-list 'load-path
;             (expand-file-name "~/.emacs.d/packages/org-mode/contrib/lisp"))
;(add-to-list 'Info-directory-list
;             (expand-file-name "~/.emacs.d/packages/org-mode/doc") t)
;(load-library "~/.emacs.d/packages/org-mode/lisp/org")
;(load-library "~/.emacs.d/packages/org-mode/lisp/org-macs")
;(load-library "~/.emacs.d/packages/org-mode/lisp/org-list")
;(load-library "~/.emacs.d/packages/org-mode/lisp/org-compat")
;(load-library "~/.emacs.d/packages/org-mode/lisp/org-faces")
;(load-library "~/.emacs.d/packages/org-mode/lisp/org-latex")
;(load-library "~/.emacs.d/packages/org-mode/lisp/org-html")
;(load-library "~/.emacs.d/packages/org-mode/lisp/org-protocol")
;(load-library "~/.emacs.d/packages/org-mode/lisp/org-table")
;(load-library "~/.emacs.d/packages/org-mode/lisp/ob-gnuplot")
;(load-library "~/.emacs.d/packages/org-mode/lisp/org-footnote")


;; ----------------------------------------------------------------------------
;;; Basic configuration

(add-to-list 'auto-mode-alist '("\\.org$" . org-mode))

(setq org-directory (concat user-emacs-working-directory "org/")
      org-return-follows-link t
      org-tab-follows-link nil
      org-hide-leading-stars t
      org-odd-levels-only t
      org-cycle-include-plain-lists t
      org-cycle-emulate-tab nil
      org-log-done t
      org-file-apps '((t . emacs))

;;;  My org-pmode hook
;(defun my-org-mode-hook ()
;  (setq fill-column 80)
;  (setq comment-start nil) ; Hack to avoid auto-fill inserting '^#'
;  (turn-on-auto-fill)

  ;; Show trailing whitespace, tabs and lines > 80
;  (whitespace-mode 1)

;  (define-key org-mode-map [S-iso-lefttab] 'org-cycle)
;  (define-key org-mode-map [C-S-iso-lefttab] 'org-global-cycle)
;  )
;;(add-hook 'org-mode-hook 'my-org-mode-hook)


;; ----------------------------------------------------------------------------
;;; General bindings for org-mode

;(global-set-key "\C-cl" 'org-store-link)

;;;   Re-bind org-force-cycle-archived to C-S-tab
;;   which is bound to C-tab by default which has been rebound in icicles
;;   to replace S-tab also used by org-mode
;(org-defkey org-mode-map [C-backtab] 'org-force-cycle-archived)

;;;   Auto-indent on return
;(org-defkey org-mode-map "\C-m"  'org-return-indent)

;;;   Move forward/backward to the next link in the buffer using `C-n' and `C-p'
;(org-defkey org-mode-map "\C-n"  'org-next-link)
;(org-defkey org-mode-map "\C-p"  'org-previous-link)


;; -----------------------------------------------------------------------------
;;; Functions to create standard layouts

  ;(interactive)
  ;(delete-other-windows)
  ;(set-frame-position (selected-frame) 0 0)
  ;(set-frame-height (selected-frame) 70)
  ;(other-window 1)
  ;(split-window-vertically 40)
  ;(other-window 1)
  ;(emms-browser)
  )

;;; end
