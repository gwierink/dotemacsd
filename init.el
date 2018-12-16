;; Emacs configuration
;; Tested on Emacs 25.2.2, 16.12.2018

(setq package-enable-at-startup nil) 

(require 'package)
(let* ((no-ssl (and (memq system-type '(windows-nt ms-dos))
                    (not (gnutls-available-p))))
       (proto (if no-ssl "http" "https")))
  (when no-ssl
    (warn "\
Your version of Emacs does not support SSL connections,
which is unsafe because it allows man-in-the-middle attacks.
There are two things you can do about this warning:
1. Install an Emacs version that does support SSL and be safe.
2. Remove this warning from your init file so you won't see it again."))
  ;; Comment/uncomment these two lines to enable/disable MELPA and MELPA Stable as desired
  (add-to-list 'package-archives (cons "melpa" (concat proto "://melpa.org/packages/")) t)
  ;;(add-to-list 'package-archives (cons "melpa-stable" (concat proto "://stable.melpa.org/packages/")) t)
  (when (< emacs-major-version 24)
    ;; For important compatibility libraries like cl-lib
    (add-to-list 'package-archives (cons "gnu" (concat proto "://elpa.gnu.org/packages/")))))
(package-initialize)


;; Use stable MELPA packages instead of bleeding edge 
(add-to-list 'package-archives
             '("melpa-stable" . "https://stable.melpa.org/packages/") t)


;; Disable welcome splash screen
(setq inhibit-startup-screen t)


;; Enable transient mark mode
(transient-mark-mode 1)


;;;; Org mode configuration
;; Enable Org mode
(require 'org)
;; Make Org mode work with files ending in .org
;; (add-to-list 'auto-mode-alist '("\\.org$" . org-mode))
;; The above is the default in recent emacsen


(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(package-selected-packages
   (quote
    (ac-c-headers auto-complete auto-complete-c-headers company company-c-headers company-irony-c-headers))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
)
 

;; Window layout and text wrapping
;; Use line numbers 
(global-linum-mode t)
;; Show column numbers
(setq column-number-mode t)
;; Start emacs 90 columns wide and 60 rows high
(when window-system (set-frame-size (selected-frame) 90 62))
;; Set hard line wrap as default for all modes
(setq-default auto-fill-function 'do-auto-fill)
;; Set autofill to 80 characters (hard wrap)
(setq-default fill-column 80)

;; Add load path
;(load-directory "~/.emacs.d/lisp/")
;(add-to-list 'load-path (expand-file-name "~/.emacs.d/lisp/"))
;(require 'load-path)
;(require 'load-directory)
;(load-directory "~/.emacs.d/lisp/")
;; Error - needs fixing
(defun load-directory (dir)
    (let ((load-it (lambda (f)
	    (load-file (concat (file-name-as-directory dir) f)))
		))
	    (mapc load-it (directory-files dir nil "\\.el$"))))
(load-directory "~/.emacs.d/lisp/")

;; Load editor settings
(load "init-editor")
(load "init-org")
(load "init-OpenFOAM")
(load "init-colours")
