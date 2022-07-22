;;; $DOOMDIR/config.el -*- lexical-binding: t; -*-

;; Place your private configuration here! Remember, you do not need to run 'doom
;; sync' after modifying this file!

;; Some functionality uses this to identify you, e.g. GPG configuration, email
;; clients, file templates and snippets.
(setq user-full-name "Tiago Rodrigues"
      user-mail-address "tiagopbr.2001@gmail.com")

;; Doom exposes five (optional) variables for controlling fonts in Doom. Here
;; are the three important ones:
;;
;; + `doom-font'
;; + `doom-variable-pitch-font'
;; + `doom-big-font' -- used for `doom-big-font-mode'; use this for
;;   presentations or streaming.
;;
;; They all accept either a font-spec, font string ("Input Mono-12"), or xlfd
;; font string. You generally only need these two:
;; (setq doom-font (font-spec :family "monospace" :size 12 :weight 'semi-light)
;;       doom-variable-pitch-font (font-spec :family "sans" :size 13))
(setq doom-font (font-spec :family "Iosevka Slab" :size 16)
      doom-variable-pitch-font (font-spec :family "Iosevka Slab")
      doom-unicode-font (font-spec :family "Iosevka Slab"))
      ;; doom-big-font (font-spec :family "Fira Mono" :size 19)
;; There are two ways to load a theme. Both assume the theme is installed and
;; available. You can either set `doom-theme' or manually load a theme with the
;; `load-theme' function. This is the default:

(setq doom-theme 'doom-tomorrow-night)

;; If you use `org' and don't want your org files in the default location below,
;; change `org-directory'. It must be set before org loads!
(setq org-directory "~/Desktop/4.Archives/RoamNotes")

;; This determines the style of line numbers in effect. If set to `nil', line
;; numbers are disabled. For relative line numbers, set this to `relative'.
(setq display-line-numbers-type 'relative)


;; Here are some additional functions/macros that could help you configure Doom:
;;
;; - `load!' for loading external *.el files relative to this one
;; - `use-package!' for configuring packages
;; - `after!' for running code after a package has loaded
;; - `add-load-path!' for adding directories to the `load-path', relative to
;;   this file. Emacs searches the `load-path' when you load packages with
;;   `require' or `use-package'.
;; - `map!' for binding new keys
;;
;; To get information about any of these functions/macros, move the cursor over
;; the highlighted symbol at press 'K' (non-evil users must press 'C-c c k').
;; This will open documentation for it, including demos of how they are used.
;;
;; You can also try 'gd' (or 'C-c c d') to jump to their definition and see how
;; they are implemented.
;;



;; ORG Mode configuration part of the config file
(defun efs/org-mode-setup ()
  (org-indent-mode)
  (variable-pitch-mode 1)
  (auto-fill-mode 0)
  (text-scale-increase 1.35)
  (visual-line-mode 1)
  (setq evil-auto-indent nil))

(defun efs/org-font-setup ()
  ;; Replace list hyphen with dot
  ;; Set faces for heading levels
  (dolist (face '((org-level-1 . 1.55)
                  (org-level-2 . 1.4)
                  (org-level-3 . 1.35)
                  (org-level-4 . 1.3)
                  (org-level-5 . 1.2)
                  (org-level-6 . 1.2)
                  (org-level-7 . 1.2)
                  (org-level-8 . 1.2)))
    (set-face-attribute (car face) nil :font "Iosevka Slab" :weight 'regular :height (cdr face)))

  ;; Ensure that anything that should be fixed-pitch in Org files appears that way
  (set-face-attribute 'org-block nil :foreground nil :inherit 'fixed-pitch)
  (set-face-attribute 'org-code nil   :inherit '(shadow fixed-pitch))
  (set-face-attribute 'org-table nil   :inherit '(shadow fixed-pitch))
  (set-face-attribute 'org-verbatim nil :inherit '(shadow fixed-pitch))
  (set-face-attribute 'org-special-keyword nil :inherit '(font-lock-comment-face fixed-pitch))
  (set-face-attribute 'org-meta-line nil :inherit '(font-lock-comment-face fixed-pitch))
  (set-face-attribute 'org-checkbox nil :inherit 'fixed-pitch))

(use-package org
  :hook (org-mode . efs/org-mode-setup)
  :config
  (setq org-ellipsis " ▾"
        org-hide-emphasis-markers t)
  (efs/org-font-setup))


(use-package org-roam
  :ensure t
  :init
  (setq org-roam-v2-ack t)
  :custom
  (org-roam-directory "~/Desktop/4.Archives/RoamNotes")
  (org-roam-complete-everywhere t)
  (org-roam-capture-templates
   '(("d" "default" plain
      "%?"
      :if-new (file+head "%<%Y%m%d%H%M%S>-${slug}.org" "#+title: ${title}\n#+author: Tiago Rodrigues\n")
      :unnarrowed t)
     ("u" "University" plain
      "\n* ${title}\n\n%?"
      :if-new (file+head "%<%Y%m%d%H%M%S>-${slug}.org" "#+title: ${title}\n#+filetags: %^{Class|Other|FSI|LBAW|LTW|PFL|RC}\n#+author:  Tiago Rodrigues")
      :unnarrowed t)))
  (org-roam-dailies-directory "Journal/")
  (org-roam-dailies-capture-templates
   '(("d" "default" entry
      "* %<%B %e, %Y>\n %?"
      :target (file+head "%<%Y-%m-%d>.org" "#+title: %<%Y-%m-%d> \n"))))
  :config
    (org-roam-setup))

; Some functions defined for making org roam snappier and easier to use
(defun org-roam-node-insert-immediate (arg &rest args)
  (interactive "P")
  (let ((args (cons arg args))
        (org-roam-capture-templates (list (append (car org-roam-capture-templates)
                                                  '(:immediate-finish t)))))
     (apply #'org-roam-node-insert args)))

; Some useful keybinds for org roam usage

(map! :leader
      (:prefix-map ("n" . "node")
       :desc "Find node" "f" #'org-roam-node-find
       :desc "Insert node at point" "i" #'org-roam-node-insert
       :desc "Insert node at point immediately" "I" #'org-roam-node-insert-immediate
       :desc "View Normal and Backlinks" "l" #'org-roam-buffer-toggle
       (:prefix-map ("d" . "daily")
       :desc "Daily note for today" "t" #'org-roam-dailies-capture-today
       :desc "Daily note for tomorrow" "T" #'org-roam-dailies-capture-tomorrow
       :desc "Daily note for date" "d" #'org-roam-dailies-capture-date
       (:prefix ("g" . "goto")
        :desc "Go to today's note" "t" #'org-roam-dailies-goto-today
        :desc "Go to tomorrow's note" "T" #'org-roam-dailies-goto-tomorrow
        :desc "Go to note in 'date'" "d" #'org-roam-dailies-goto-date))))

(setq undo-limit 80000000)
(global-subword-mode t)

(add-hook 'web-mode-hook 'prettier-js-mode)
(add-hook 'typescript-mode-hook 'prettier-js-mode)
(add-hook 'rjsx-mode-hook 'prettier-js-mode)
(use-package! lsp-tailwindcss)
(setq lsp-clients-angular-language-server-command
  '("node"
    "/usr/lib/node_modules/@angular/language-server"
    "--ngProbeLocations"
    "/usr/lib/node_modules"
    "--tsProbeLocations"
    "/usr/lib/node_modules"
    "--stdio"))


(add-hook 'org-mode-hook #'org-modern-mode)
(add-hook 'org-agenda-finalize-hook #'org-modern-agenda)

(setq scroll-margin 8)
