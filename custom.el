(set-buffer-file-coding-system 'unix 't)
(require 'cnfonts)
(cnfonts-enable)
;;(cnfonts-set-spacemacs-fallback-fonts)
;; (setq cnfonts-use-face-font-rescale t)

(setq debug-on-error t)
(setq linum-format "%d ")
(setq c-basic-offset 2)
(setq-default js2-basic-offset 2)

;; org mode setup
(load (concat user-emacs-directory "org-mode.el"))
(setq org-mobile-directory "~/git/dav/test")
;; (setq org-mobile-inbox-for-pull (concat org-directory "/index.org"))
(setq org-mobile-inbox-for-pull "~/git/org/index.org")
(setq org-mobile-use-encryption t)
(setq org-agenda-files (quote ("~/git/org")))

;;treate my right option as control in my macbook
(setq mac-right-option-modifier 'control)
(beacon-mode 1)
;;(require 'org-bullets)
(add-hook 'org-mode-hook (lambda () (org-bullets-mode 1)))
;; (set-language-environment "Chinese-GB18030")

;; for sciter tiscript file extension
(add-to-list 'auto-mode-alist '("\\.tis\\'" . js2-mode))

;; for legacy code written with windows keil, which coding system is default chinese-gb18030
;; (add-hook 'c-mode-hook (lambda ()
;;                          (if (string-match-p "edog" buffer-file-name)
;;                              (revert-buffer-with-coding-system 'chinese-gb18030 t))))

(require 'auth-source-pass)
(auth-source-pass-enable)

(load-theme 'sanityinc-tomorrow-eighties t)

(setq exec-path (append exec-path '("/Users/dongkc/flutter/bin/")))
(toggle-frame-fullscreen)

(eval-after-load
  'company
  '(add-to-list 'company-backends #'company-omnisharp))

(defun my-csharp-mode-setup ()
  (omnisharp-mode)
  (company-mode)
  (flycheck-mode)

  (setq indent-tabs-mode nil)
  (setq c-syntactic-indentation t)
  (c-set-style "ellemtel")
  (setq c-basic-offset 4)
  (setq truncate-lines t)
  (setq tab-width 4)
  (setq evil-shift-width 4)

  ;csharp-mode README.md recommends this too
  ;(electric-pair-mode 1)       ;; Emacs 24
  ;(electric-pair-local-mode 1) ;; Emacs 25

  (local-set-key (kbd "C-c r r") 'omnisharp-run-code-action-refactoring)
  (local-set-key (kbd "C-c C-c") 'recompile))

(add-hook 'csharp-mode-hook 'my-csharp-mode-setup t)
(setq omnisharp-expected-server-version "1.35.1")