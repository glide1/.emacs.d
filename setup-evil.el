(require 'evil)
(evil-mode 1)

;;so we start up in the normal mode

(setq evil-default-state 'normal)

;;; esc quits
(define-key evil-normal-state-map [escape] 'keyboard-quit)
(define-key evil-visual-state-map [escape] 'keyboard-quit)
(define-key minibuffer-local-map [escape] 'minibuffer-keyboard-quit)
(define-key minibuffer-local-ns-map [escape] 'minibuffer-keyboard-quit)
(define-key minibuffer-local-completion-map [escape] 'minibuffer-keyboard-quit)
(define-key minibuffer-local-must-match-map [escape] 'minibuffer-keyboard-quit)
(define-key minibuffer-local-isearch-map [escape] 'minibuffer-keyboard-quit)


(define-key evil-normal-state-map "\C-y" 'yank)
(define-key evil-insert-state-map "\C-y" 'yank)
(define-key evil-visual-state-map "\C-y" 'yank)
(define-key evil-insert-state-map "\C-e" 'end-of-line)
(define-key evil-normal-state-map "\C-w" 'evil-delete)
(define-key evil-insert-state-map "\C-w" 'evil-delete)
(define-key evil-insert-state-map "\C-r" 'search-backward)
(define-key evil-visual-state-map "\C-w" 'evil-delete)

;; ret and return so it works in term and X
(evil-declare-key 'motion completion-list-mode-map (kbd "<return>") 'choose-completion)
(evil-declare-key 'motion completion-list-mode-map (kbd "RET") 'choose-completion)
(evil-declare-key 'motion browse-kill-ring-mode-map (kbd "<return>") 'browse-kill-ring-insert-and-quit)
(evil-declare-key 'motion browse-kill-ring-mode-map (kbd "RET") 'browse-kill-ring-insert-and-quit)
(evil-declare-key 'motion occur-mode-map (kbd "<return>") 'occur-mode-goto-occurrence)
(evil-declare-key 'motion occur-mode-map (kbd "RET") 'occur-mode-goto-occurrence)

;;initial states


(provide 'setup-evil)
