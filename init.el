;;;; init.el --- my init.el file
;;; Commentary:
;;; This is the initialization file for Emacs
;;; This file is based off of the org-mode literate programming
;;; guide.  This bootstraps org mode and reads the rest from literate
;;; Org-mode files.

;;; Code:
;; turn off mouse interface early in startup to avoid momentary display
(when (fboundp 'menu-bar-mode) (menu-bar-mode -1))
(when (fboundp 'tool-bar-mode) (tool-bar-mode -1))
(when (fboundp 'scroll-bar-mode) (scroll-bar-mode -1))

(setq inhibit-startup-screen t)

(setq dotfiles-dir (file-name-directory (or (buffer-file-name) load-file-name)))

(let* ((org-dir (expand-file-name
		 "lisp" (expand-file-name
			 "org" (expand-file-name
				"src" dotfiles-dir))))
       (org-contrib-dir (expand-file-name
			 "lisp" (expand-file-name
				 "contrib" (expand-file-name
					    ".." org-dir))))
       (load-path (append (list org-dir org-contrib-dir)
			  (or load-path nil))))
  ;load up Org-mode and Org-babel
  (require 'org-install)
  (require 'ob-tangle))

;; load all literate org-mode files in this directory
;;(org-babel-load-file "emacs-setup.org")
(mapc #'org-babel-load-file (directory-files dotfiles-dir t "^emacs-setup.org$"))

;;; init.el ends here
