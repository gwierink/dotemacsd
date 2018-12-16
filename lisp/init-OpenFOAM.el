;;; Initialize OpenFOAM specific settings
;; ----------------------------------------------------------------------------

;; ----------------------------------------------------------------------------
;;;  Set the auto-mode-alist for all C++ related files

(setq auto-mode-alist
      (
       append
       '(
         ("\\.C$"    . c++-mode)
         ("\\.H$"    . c++-mode)
         ("\\.l$"    . c++-mode)
         ("\\.L$"    . c++-mode)
         ("\\.y$"    . c++-mode)
         ("\\.Y$"    . c++-mode)
         ("\\.cc$"   . c++-mode)
         ("\\.hh$"   . c++-mode)
         ("\\.cxx$"   . c++-mode)
         ("\\.hxx$"   . c++-mode)
         ("\\.java$" . c++-mode)
         ("\\.cfg$" . c++-mode)
         ("\\.c$"    . c-mode)
         ("\\.h$"    . c-mode)
         ("ebrowse\\'" . ebrowse-tree-mode)
         )
       auto-mode-alist))

;;;  M-x ffap normally only recognises a "#include <foo.h>" when point is
;;  within the foo.h filename part.  This tiny spot of code lets it work when
;;  point is on the #include part, including at the start of a #include line.
(eval-after-load "ffap" '(require 'ffap-include-start))

(defvar OPENFOAM_DIR (getenv "WM_PROJECT_DIR"))
(defun foam-create-C-file (className)
  (interactive "sclass name: ") ;   which is read with the Minibuffer.
  (shell-command
   (format "foamNew source C %s" className)))

(defun foam-create-H-file (className)
  (interactive "sclass name: ") ;   which is read with the Minibuffer.
  (shell-command
   (format "foamNew source H %s" className)))

(defun foam-create-I-file (className)
  (interactive "sclass name: ") ;   which is read with the Minibuffer.
  (shell-command
   (format "foamNew source I %s" className)))

(defun foam-create-IO-file (className)
  (interactive "sclass name: ") ;   which is read with the Minibuffer.
  (shell-command
   (format "foamNew source IO %s" className)))

(defun foam-create-application-file (className)
  (interactive "sapplication name: ") ;   which is read with the Minibuffer.
  (shell-command
   (format "foamNew source App %s" className)))

(defun foam-create-template-C-file (className templateArguments)
  (interactive "sclass name: \nstemplate args: ")
  (shell-command
   (format "foamNew template C %s %s" className templateArguments)))

(defun foam-create-template-H-file (className templateArguments)
  (interactive "sclass name: \nstemplate args: ")
  (shell-command
   (format "foamNew template H %s %s" className templateArguments)))

(defun foam-create-template-I-file (className templateArguments)
  (interactive "sclass name: \nstemplate args: ")
  (shell-command
   (format "foamNew template I %s %s" className templateArguments)))

(defun foam-create-template-IO-file (className templateArguments)
  (interactive "sclass name: \nstemplate args: ")
  (shell-command
   (format "foamNew template IO %s %s" className templateArguments)))

(defun foam-create-wmake-files-options ()
  (interactive) ;   which is read with the Minibuffer.
  (shell-command "wmakeFilesAndOptions"))

(defconst OpenFOAM-style
 '(
    (c-basic-offset . 4)
    (c-tab-always-indent . t)
    (c-comment-only-line-offset . (0 . 0))
    (c-indent-comments-syntactically-p . t)
    (c-block-comments-indent-p nil)
    (c-cleanup-list .
        '((defun-close-semi) (list-close-comma) (scope-operator)))
    (c-backslash-column . 48)
    (c-toggle-auto-state 1)
    (c-toggle-auto-hungry-state 1)

    (c-offsets-alist .
      (
        (c . +)                     ;; inside a multi-line C style block comment
        (defun-open . 0)            ;; brace that opens a function definition
        (defun-close . 0)           ;; brace that closes a function definition
        (defun-block-intro . +)     ;; the first line in a top-level defun
        (class-open . 0)            ;; brace that opens a class definition
        (class-close . 0)           ;; brace that closes a class definition
        (inline-open . +)           ;; brace that opens an in-class inline method
        (inline-close . 0)          ;; brace that closes an in-class inline method
        (topmost-intro . 0)         ;; the first line in a topmost construct
                                    ;; definition
        (topmost-intro-cont . 0)    ;; topmost definition continuation lines
        (member-init-intro . +)     ;; first line in a member initialization list
        (member-init-cont . 0)      ;; subsequent member initialization list lines
        (inher-intro . 0)           ;; first line of a multiple inheritance list
        (inher-cont . +)            ;; subsequent multiple inheritance lines
        (block-open . 0)            ;; statement block open brace
        (block-close . 0)           ;; statement block close brace
        (brace-list-open . 0)       ;; open brace of an enum or static array list
        (brace-list-close . 0)      ;; open brace of an enum or static array list
        (brace-list-intro . +)      ;; first line in an enum or static array list
        (brace-list-entry . 0)      ;; subsequent lines in an enum or static array
                                    ;; list
        (statement . 0)             ;; a C/C++/ObjC statement
        (statement-cont . 0)        ;; a continuation of a C/C++/ObjC statement
        (statement-block-intro . +) ;; the first line in a new statement block
        (statement-case-intro . +)  ;; the first line in a case `block'
        (statement-case-open . +)   ;; the first line in a case `block'
                                    ;; starting with brace
        (substatement . +)          ;; the first line after an if/while/for/do/else
        (substatement-open . 0)     ;; the brace that opens a substatement block
        (case-label . +)            ;; a case or default label
        (access-label . -)          ;; C++ private/protected/public access label
        (label . -)                 ;; any non-special C/C++/ObjC label
        (do-while-closure . 0)      ;; the `while' that ends a do/while construct
        (else-clause . 0)           ;; the `else' of an if/else construct
        (comment-intro . 0)         ;; line containing only a comment introduction
        (arglist-intro . +)         ;; the first line in an argument list
        (arglist-cont . 0)          ;; subsequent argument list lines when no
                                    ;; subsequent argument list lines when no the
                                    ;; arglist opening paren
        (arglist-cont-nonempty . 0) ;; subsequent argument list lines when at
                                    ;; subsequent argument list lines when at line
                                    ;; as the arglist opening paren
        (arglist-close . 0)         ;; line as the arglist opening paren
        (stream-op . +)             ;; lines continuing a stream operator construct
        (inclass . +)               ;; the construct is nested inside a class
                                    ;; definition
        (cpp-macro . +)             ;; the construct is nested inside a class
                                    ;; definition
        (friend . 0)                ;; a C++ friend declaration
      )
    )
  )
  "OpenFOAM C++ Programming Style"
)


(defun OpenFOAM-mode-hook ()

  (setq OPENFOAM_DIR (getenv "WM_PROJECT_DIR"))

  (c-add-style "OpenFOAM" OpenFOAM-style t)

  ;;(make-local-variable 'comment-start-skip)
  ;;(setq comment-start-skip "\\(//+\\|/\\*+\\)\\s *") orig
  ;;(setq comment-start-skip "\\(//\\-+\\|/\\*+\\)\\s *")
  ;;(setq comment-start-skip "\\(//.[^ ]\\|/\\*+|/\\-\\)\\s *")
  (define-key c++-mode-map [backtab] 'insert-spaces)

  ;(setq special-display-buffer-names
  ;  (append special-display-buffer-names (list "*compilation*"))
  ;)

  ;; Show trailing whitespace, tabs and lines > 80
  (whitespace-mode 1)

  ;; Show matching parentheses
  (show-matching-paren)

  ;; Switch off abbrev mode which cc-mode switches on
  (abbrev-mode -1)

  ;; Switch off "electric" indent mode which cc-mode switches on
  ;; This mode automatically indents line when "punctuation" is typed
  (setq-default c-electric-flag nil)

  ;; Switch on fly-spell mode in comments
  (flyspell-prog-mode)

  ;; Switch on auto-fill in comments
  (set (make-local-variable 'fill-nobreak-predicate)
       (lambda ()
         (not (eq (get-text-property (point) 'face)
                  'font-lock-comment-face))))

  ;; Set the compile window to scroll as the output is generated
  (setq compilation-scroll-output t)

  (easy-menu-define
    OpenFOAM-menu c++-mode-map "OpenFOAM"
   '("OpenFOAM"
      ("New source file"
        ["{class name}.H" foam-create-H-file]
        ["{class name}.C" foam-create-C-file]
        ["{class name}I.H" foam-create-I-file]
        ["{class name}IO.C" foam-create-IO-file]
      )
      ("New templated source file"
        ["{class name}.H" foam-create-template-H-file]
        ["{class name}.C" foam-create-template-C-file]
        ["{class name}I.H" foam-create-template-I-file]
        ["{class name}IO.C" foam-create-template-IO-file]
      )
      ["New application" foam-create-application-file]
      ["New Make/files, options" foam-create-wmake-files-options]
    )
  )
  (easy-menu-add OpenFOAM-menu)

  (c-set-style "OpenFOAM")

  ;; In C++ mode, I want find-tag to pull in the whole symbol name
  ;; (e.g.: HostdApp::Init; not just Init).
  ;; I'm using ffap (Find File At Point), which is weird, but it works.
  ;;
  (when (and (require 'ffap nil t) (fboundp 'ffap-string-at-point))
    (add-hook 'c++-mode-hook
      '(lambda ()
         (put major-mode
          'find-tag-default-function #'ffap-string-at-point)))
  )

  ;; Setup fapp (find-file-at-point) search path
  (setq ffap-c-path
        (list
          "lnInclude"
          (concat OPENFOAM_DIR "/src/OpenFOAM/lnInclude")
          (concat OPENFOAM_DIR "/src/finiteVolume/lnInclude")
          (concat OPENFOAM_DIR "src/ODE/lnInclude")
          (concat OPENFOAM_DIR "src/sampling/lnInclude")
          (concat OPENFOAM_DIR "src/lagrangian/solidParticle/lnInclude")
          (concat OPENFOAM_DIR "src/lagrangian/dieselSpray/lnInclude")
          (concat OPENFOAM_DIR "src/lagrangian/basic/lnInclude")
          (concat OPENFOAM_DIR "src/lagrangian/intermediate/lnInclude")
          (concat OPENFOAM_DIR "src/autoMesh/lnInclude")
          (concat OPENFOAM_DIR "src/thermophysicalModels/pdfs/lnInclude")
          (concat OPENFOAM_DIR "src/thermophysicalModels/radiation/lnInclude")
          (concat OPENFOAM_DIR "src/thermophysicalModels/chemistryModel/lnInclude")
          (concat OPENFOAM_DIR "src/thermophysicalModels/basic/lnInclude")
          (concat OPENFOAM_DIR "src/thermophysicalModels/liquidMixture/lnInclude")
          (concat OPENFOAM_DIR "src/thermophysicalModels/liquids/lnInclude")
          (concat OPENFOAM_DIR "src/thermophysicalModels/laminarFlameSpeed/lnInclude")
          (concat OPENFOAM_DIR "src/thermophysicalModels/combustion/lnInclude")
          (concat OPENFOAM_DIR "src/thermophysicalModels/solids/lnInclude")
          (concat OPENFOAM_DIR "src/thermophysicalModels/specie/lnInclude")
          (concat OPENFOAM_DIR "src/thermophysicalModels/solidMixture/lnInclude")
          (concat OPENFOAM_DIR "src/thermophysicalModels/thermophysicalFunctions/lnInclude")
          (concat OPENFOAM_DIR "src/dynamicFvMesh/lnInclude")
          (concat OPENFOAM_DIR "src/Pstream/mpi/lnInclude")
          (concat OPENFOAM_DIR "src/Pstream/dummy/lnInclude")
          (concat OPENFOAM_DIR "src/transportModels/interfaceProperties/lnInclude")
          (concat OPENFOAM_DIR "src/transportModels/incompressible/lnInclude")
          (concat OPENFOAM_DIR "src/fvMotionSolver/lnInclude")
          (concat OPENFOAM_DIR "src/engine/lnInclude")
          (concat OPENFOAM_DIR "src/turbulenceModels/compressible/lnInclude")
          (concat OPENFOAM_DIR "src/turbulenceModels/incompressible/lnInclude")
          (concat OPENFOAM_DIR "src/dynamicMesh/lnInclude")
          (concat OPENFOAM_DIR "src/meshTools/lnInclude")
          (concat OPENFOAM_DIR "src/OSspecific/Unix/lnInclude")
          (concat OPENFOAM_DIR "src/LESmodels/compressible/lnInclude")
          (concat OPENFOAM_DIR "src/LESmodels/LESfilters/lnInclude")
          (concat OPENFOAM_DIR "src/LESmodels/incompressible/lnInclude")
          (concat OPENFOAM_DIR "src/LESmodels/LESdeltas/lnInclude")
          (concat OPENFOAM_DIR "src/topoChangerFvMesh/lnInclude")
          (concat OPENFOAM_DIR "src/postProcessing/postCalc/lnInclude")
          (concat OPENFOAM_DIR "src/postProcessing/forces/lnInclude")
          (concat OPENFOAM_DIR "src/triSurface/lnInclude")
          (concat OPENFOAM_DIR "src/randomProcesses/lnInclude")
          (concat OPENFOAM_DIR "src/edgeMesh/lnInclude")
          ))
)

(add-hook 'c-mode-common-hook 'OpenFOAM-mode-hook)


(defun c-open-relational-file (how-open-type)
  (interactive "nOpen-Type: ")
  (defun get-opened-file-name-prefix (file-name)
    (string-match "/\\([^./]+\\)\\.[^.]+$" file-name)
    (match-string 1 file-name))
  (defun get-ext-type (file-name)
    (string-match "\\.\\([^.]+\\)$" file-name)
    (match-string 1 file-name))
  (defun get-opening-file-name (file-name-prefix ext-list)
    (let ((opening-file-name (concat file-name-prefix "." (car ext-list))))
      (cond ((null (car ext-list))             nil)
            ((file-exists-p opening-file-name) opening-file-name)
            (t                                 (get-opening-file-name file-name-prefix
                                                                      (cdr ext-list))))))
  (let* ((ext-map '(
                    ("h" . ("c" "cpp" "cxx" "cc" "c++"))
                    ("c" . ("h" "s"))
                    ("s" . ("c"))
                    ("cpp" . ("hpp" "h" "hxx" "h++"))
                    ("hpp" . ("cpp" "cxx" "cc" "c++"))
                    ))
         (opened-file-name (buffer-file-name (window-buffer)))
         (opened-file-name-prefix (get-opened-file-name-prefix opened-file-name))
         (opened-file-ext-type (get-ext-type opened-file-name))
         (opening-file-ext-type-list (cdr (assoc opened-file-ext-type ext-map)))
         (opening-file-name (get-opening-file-name opened-file-name-prefix
                                                   opening-file-ext-type-list))
         (opening-file-buffer (find-file-noselect opening-file-name)))
    (cond ((= how-open-type 1) (switch-to-buffer opening-file-buffer))
          ((= how-open-type 2) (progn (split-window-horizontally)
                                      (other-window 1)
                                      (switch-to-buffer opening-file-buffer)))
          (t                   (message "Illegal Type")))))

;; ----------------------------------------------------------------------------
;;; end
