;;; setup-auto-complete --- my settings for auto complete
;;; Commentary:
;;; basic settings for auto-complete taken from the manual
;;; Code:
(require 'auto-complete-config)
(ac-config-default)

(define-key ac-mode-map (kbd "M-SPC") 'auto-complete)

(provide 'setup-auto-complete)
;;; setup-auto-complete ends here
