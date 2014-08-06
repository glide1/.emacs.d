;;;; init.el --- my init.el file

;; turn off mouse interface early in startup to avoid momentary display
(when (fboundp 'menu-bar-mode) (menu-bar-mode -1))
(when (fboundp 'tool-bar-mode) (tool-bar-mode -1))
(when (fboundp 'scroll-bar-mode) (scroll-bar-mode -1))

(setq inhibit-startup-screen t)

(setq site-lisp-dir
      (expand-file-name "site-lisp" user-emacs-directory))

(add-to-list 'load-path user-emacs-directory)
(add-to-list 'load-path site-lisp-dir)

;;;; package.el
(require 'package)
(setq package-user-dir "~/.emacs.d/elpha/")
(add-to-list 'package-archives
	     '("melpa" . "http://melpa.milkbox.net/packages/") t)
(package-initialize)

(defun install-my-packages ()
  "install my packages"
  (mapc `(lambda (package)
	   (unless (package-installed-p package)
	     (package-install package)))
	'(evil
	  magit
	  paredit
	  undo-tree
	  ag
	  zenburn-theme)))

(condition-case nil 
    (install-my-packages)
  (error
   (package-refresh-contents)
   (install-my-packages)))

;;;; macros
(defmacro after (mode &rest body)
  "`eval-after-load' MODE evaluate BODY."
  (declare (indent defun))
  `(eval-after-load ,mode
     '(progn ,@body)))

;;;; global key bindings

(require 'setup-evil)

(load-theme 'zenburn t)

;;;; emacs lisp
(defun imenu-elisp-sections ()
  (setq imenu-prev-index-position-function nil)
  (add-to-list 'imenu-generic-expression '("Sections" "^;;;; \\(.+\\)$" 1) t))

(add-hook 'emacs-lisp-mode-hook 'imenu-elisp-sections)