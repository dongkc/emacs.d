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
(setq org-mobile-inbox-for-pull (concat org-directory "/index.org"))
(setq org-mobile-inbox-for-pull "~/git/org/index.org")
(setq org-agenda-files (quote ("~/git/org")))

(beacon-mode 1)
;;(require 'org-bullets)
(add-hook 'org-mode-hook (lambda () (org-bullets-mode 1)))

;; for sciter tiscript file extension
(add-to-list 'auto-mode-alist '("\\.tis\\'" . js2-mode))

(require 'auth-source-pass)
(auth-source-pass-enable)

(load-theme 'sanityinc-tomorrow-eighties t)
 (setq exec-path (append exec-path '("/Users/dongkc/flutter/bin/")))

(require 'edit-server)
(edit-server-start)
(toggle-frame-fullscreen)