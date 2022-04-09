(set-buffer-file-coding-system 'unix 't)
(require 'cnfonts)
(require 'pyim)
;; font setting here, when changing font, run cn-font-ui cmd again
(cnfonts-enable)
;;(cnfonts-set-spacemacs-fallback-fonts)
;; (setq cnfonts-use-face-font-rescale t)

(setq debug-on-error nil)
(setq linum-format "%d ")
(setq c-basic-offset 4)
(setq-default js2-basic-offset 2)

;; org mode setup
(load (concat user-emacs-directory "org-mode.el"))
(setq org-mobile-directory "~/git/dav/test")
(setq org-mobile-inbox-for-pull (concat org-directory "/index.org"))
(setq org-mobile-inbox-for-pull "~/git/org/index.org")
(setq org-agenda-files (quote ("~/git/org")))

(beacon-mode 1)
(require 'org-bullets)
(add-hook 'org-mode-hook (lambda () (org-bullets-mode 1)))
(setq org-bullets-face-name (quote org-bullet-face))
(add-hook 'org-mode-hook (lambda () (org-bullets-mode 1)))
;; (setq org-bullets-bullet-list '("✙" "♱" "♰" "☥" "✞" "✟" "✝" "†" "✠" "✚" "✜" "✛" "✢" "✣" "✤" "✥"))

;; set the fall-back font
;; this is critical for displaying various unicode symbols, such as those used in my init-org.el settings
;; http://endlessparentheses.com/manually-choose-a-fallback-font-for-unicode.html
(set-fontset-font "fontset-default" nil
                  (font-spec :size 20 :name "Symbola"))

;; for sciter tiscript file extension
(add-to-list 'auto-mode-alist '("\\.tis\\'" . js2-mode))

(add-to-list 'auto-mode-alist '("\\.xaml\\'" . xml-mode))

(require 'auth-source-pass)
(auth-source-pass-enable)

(setq exec-path (append exec-path '("/Users/dongkc/bin/")))
(toggle-frame-fullscreen)

(setq elfeed-feeds
      '("http://nullprogram.com/feed/"
        "https://planet.emacslife.com/atom.xml"))

;; (require 'auctex)
;; (add-hook 'TeX-mode-hook
;;   (lambda ()
;;     (setq TeX-command-extra-options "-file-line-error -shell-escape")
;;   )
;; )
;; (setq TeX-source-correlate-mode t)
;; (add-to-list 'TeX-command-list '("XeLaTeX" "%`xelatex %(extraopts)%(mode)%' %t" TeX-run-TeX nil t))

;; (define-key lsp-mode-map [remap xref-find-apropos] #'helm-lsp-workspace-symbol)
;; (require 'lsp-mode)
;; (with-eval-after-load 'lsp-mode
;;   (add-hook 'lsp-mode-hook #'lsp-enable-which-key-integration))

;; (setq lsp-keymap-prefix "c-,")

(add-hook 'go-mode-hook 'lsp-deferred)

(use-package lsp-mode
  :ensure t
  :init (setq lsp-keymap-prefix "C-c C-l"
              lsp-prefer-flymake nil)
  :commands (lsp make-lsp-client lsp-register-client)
  :hook (lsp-mode . lsp-enable-which-key-integration))

(use-package lsp-ui
  :ensure t
  :init (setq lsp-ui-flycheck-enable t)
  :commands lsp-ui-mode)

;; (use-package company-lsp
;;   :ensure t
;;   :commands company-lsp)

(use-package dap-mode
  :ensure t :after lsp-mode
  :config
  (dap-mode t)
  (dap-ui-mode t))

(setq browse-url-generic-program "chrome")
(setq web-mode-markup-indent-offset 2)
(setq web-mode-css-indent-offset 2)
(setq web-mode-code-indent-offset 2)
(setq nxml-child-indent 4 nxml-attribute-indent 4)

(defun dos2unix ()
  "Not exactly but it's easier to remember"
  (interactive)
  (set-buffer-file-coding-system 'unix 't) )

(load-theme 'sanityinc-tomorrow-eighties t)

;; (desktop-save-mode 1)
(global-set-key (kbd "M-x") 'helm-M-x)
(global-set-key (kbd "C-x C-m") 'helm-M-x)
(global-set-key (kbd "M-y") 'helm-show-kill-ring)
(global-set-key (kbd "C-x b") 'helm-mini)
(global-set-key (kbd "C-x C-f") 'helm-find-files)

(global-set-key (kbd "M-x") 'helm-M-x)
(global-set-key (kbd "C-x C-m") 'helm-M-x)
(global-set-key (kbd "M-y") 'helm-show-kill-ring)
(global-set-key (kbd "C-x b") 'helm-mini)
(global-set-key (kbd "C-x C-f") 'helm-find-files)

(global-set-key (kbd "C-c h o") 'helm-occur)
(global-set-key (kbd "C-h SPC") 'helm-all-mark-rings)
(global-set-key (kbd "C-c h x") 'helm-register)

(projectile-global-mode)
(setq projectile-completion-system 'helm)
(helm-projectile-on)
(setq projectile-indexing-method 'alien)

 (with-eval-after-load 'eshell (set-language-environment "chinese-GB"))

;; (require 'quelpa-use-package)
;; (use-package alpha-org
;;   :quelpa (alpha-org :fetcher github :repo "alphapapa/alpha-org"))


(server-start)
(require 'org-protocol)

(require 'edit-server)
(edit-server-start)

(defun transform-square-brackets-to-round-ones(string-to-transform)
  "Transforms [ into ( and ] into ), other chars left unchanged."
  (concat 
  (mapcar #'(lambda (c) (if (equal c ?[) ?\( (if (equal c ?]) ?\) c))) string-to-transform))
  )

(setq org-capture-templates `(
	("p" "Protocol" entry (file+headline ,(concat org-directory "/notes.org") "Inbox")
        "* %^{Title}\n[[%:link][%(transform-square-brackets-to-round-ones \"%:description\")]]\nSource: %u, %c\n #+BEGIN_QUOTE\n%i\n#+END_QUOTE\n\n\n%?")	
	("L" "Protocol Link" entry (file+headline ,(concat org-directory "/notes.org") "Inbox")
        "* %? [[%:link][%(transform-square-brackets-to-round-ones \"%:description\")]]\n" :kill-buffer t)
))
