;;; doom-bamboo-theme.el --- A dark port of the Bamboo (vulgaris) theme -*- lexical-binding: t; no-byte-compile: t; -*-
;;
;; Author: ribru17
;; Ported by: joaofelipegalvao (doom-emacs port)
;; Keywords: custom themes, faces
;; Homepage: https://github.com/ribru17/bamboo.nvim
;;
;;; Commentary:
;;
;; Bamboo grows in the dark before it reaches the light.
;; Warm, earthy dark theme with natural greens and soft yellows.
;; Ported from ribru17/bamboo.nvim (vulgaris variant).
;; Thanks to hlissner (https://github.com/doomemacs/themes)
;;
;;; Code:
(require 'doom-themes)

;;; Variables
(defgroup doom-bamboo-theme nil
  "Options for the `doom-bamboo' theme."
  :group 'doom-themes)

(defcustom doom-bamboo-brighter-modeline nil
  "If non-nil, more vivid colors will be used to style the mode-line."
  :group 'doom-bamboo-theme
  :type 'boolean)

(defcustom doom-bamboo-brighter-comments nil
  "If non-nil, comments will be highlighted in more vivid colors."
  :group 'doom-bamboo-theme
  :type 'boolean)

(defcustom doom-bamboo-padded-modeline doom-themes-padded-modeline
  "If non-nil, adds a 4px padding to the mode-line.
Can be an integer to determine the exact padding."
  :group 'doom-bamboo-theme
  :type '(choice integer boolean))

;;; Theme definition
(def-doom-theme doom-bamboo
    "A warm earthy dark theme inspired by bamboo forests, ported from bamboo.nvim (vulgaris)."

  ;; name              default   256       16
  (
   ;; --- Palette (mirrors bamboo/palette.lua vulgaris) ---
   (bam-contrast       '("#111210" "#111210" "black"       ))
   (bam-bg0            '("#252623" "#252623" "black"       ))
   (bam-bg1            '("#2f312c" "#2f312c" "black"       ))
   (bam-bg2            '("#383b35" "#383b35" "brightblack" ))
   (bam-bg3            '("#3a3d37" "#3a3d37" "brightblack" ))
   (bam-bg-d           '("#1c1e1b" "#1c1e1b" "black"       ))
   (bam-fg             '("#f1e9d2" "#f1e9d2" "white"       ))
   (bam-purple         '("#aaaaff" "#aaaaff" "magenta"     ))
   (bam-bright-purple  '("#df73ff" "#df73ff" "brightmagenta"))
   (bam-green          '("#8fb573" "#8fb573" "green"       ))
   (bam-orange         '("#ff9966" "#ff9966" "red"         ))
   (bam-blue           '("#57a5e5" "#57a5e5" "blue"        ))
   (bam-light-blue     '("#96c7ef" "#96c7ef" "brightblue"  ))
   (bam-yellow         '("#dbb651" "#dbb651" "yellow"      ))
   (bam-cyan           '("#70c2be" "#70c2be" "cyan"        ))
   (bam-red            '("#e75a7c" "#e75a7c" "red"         ))
   (bam-coral          '("#f08080" "#f08080" "brightred"   ))
   (bam-grey           '("#5b5e5a" "#5b5e5a" "brightblack" ))
   (bam-light-grey     '("#838781" "#838781" "brightblack" ))
   (bam-bg-blue        '("#68aee8" "#68aee8" "blue"        ))
   (bam-bg-yellow      '("#e2c792" "#e2c792" "yellow"      ))
   ;; diff colors
   (bam-diff-add       '("#40531b" "#40531b" "green"       ))
   (bam-diff-delete    '("#893f45" "#893f45" "red"         ))
   (bam-diff-change    '("#2a3a57" "#2a3a57" "blue"        ))
   (bam-diff-text      '("#3a4a67" "#3a4a67" "brightblue"  ))

   ;; --- Required doom-themes variables ---
   (bg                 bam-bg0)
   (fg                 bam-fg)
   (bg-alt             bam-bg1)
   (fg-alt             bam-bg-yellow)

   ;; base0 = darkest ... base8 = lightest
   (base0              bam-contrast)
   (base1              bam-bg-d)
   (base2              bam-bg0)
   (base3              bam-bg1)
   (base4              bam-bg2)
   (base5              bam-bg3)
   (base6              bam-grey)
   (base7              bam-light-grey)
   (base8              bam-fg)

   (grey               bam-grey)
   (red                bam-red)
   (orange             bam-orange)
   (green              bam-green)
   (teal               bam-cyan)
   (yellow             bam-yellow)
   (blue               bam-blue)
   (dark-blue          '("#3d7ab5" "#3d7ab5" "blue"        ))
   (magenta            bam-purple)
   (violet             bam-bright-purple)
   (cyan               bam-cyan)
   (dark-cyan          '("#4d9a96" "#4d9a96" "cyan"        ))

   ;; --- Required face categories ---
   (highlight          bam-yellow)
   (selection          bam-bg2)
   (region             bam-bg2)
   (vertical-bar       bam-bg-d)

   (comments           (if doom-bamboo-brighter-comments bam-light-grey bam-grey))
   (doc-comments       (if doom-bamboo-brighter-comments bam-light-grey bam-grey))

   ;; syntax
   (builtin            bam-cyan)
   (constants          bam-coral)
   (functions          bam-blue)
   (keywords           bam-green)
   (methods            bam-blue)
   (numbers            bam-coral)
   (operators          bam-fg)
   (strings            bam-bg-yellow)
   (type               bam-cyan)
   (variables          bam-fg)
   (error              bam-red)
   (success            bam-green)
   (warning            bam-yellow)

   (vc-added           bam-diff-add)
   (vc-deleted         bam-diff-delete)
   (vc-modified        bam-diff-change)

   ;; --- Modeline ---
   (modeline-bg              (if doom-bamboo-brighter-modeline bam-bg2 bam-bg1))
   (modeline-fg              bam-fg)
   (modeline-bg-alt          (if doom-bamboo-brighter-modeline bam-bg1 bam-bg-d))
   (modeline-fg-alt          bam-light-grey)
   (modeline-bg-inactive     bam-bg1)
   (modeline-fg-inactive     bam-grey)
   (modeline-bg-inactive-alt bam-bg-d)
   (modeline-fg-inactive-alt bam-grey)
   (modeline-pad
    (when doom-bamboo-padded-modeline
      (if (integerp doom-bamboo-padded-modeline) doom-bamboo-padded-modeline 4))))

  ;; --- Base theme face overrides ---
  (
   ;; Syntax / font-lock
   ((font-lock-comment-face &override)
    :slant 'italic
    :foreground comments
    :background (if doom-bamboo-brighter-comments (doom-blend bam-grey bam-bg0 0.06)))
   ((font-lock-string-face &override)        :foreground bam-bg-yellow)
   ((font-lock-keyword-face &override)       :foreground bam-green :weight 'bold)
   ((font-lock-type-face &override)          :foreground bam-cyan :slant 'italic)
   ((font-lock-function-name-face &override) :foreground bam-blue)
   ((font-lock-variable-name-face &override) :foreground bam-fg)
   ((font-lock-constant-face &override)      :foreground bam-coral :weight 'bold)
   ((font-lock-builtin-face &override)       :foreground bam-cyan :slant 'italic)
   ((font-lock-preprocessor-face &override)  :foreground bam-orange)
   ((font-lock-warning-face &override)       :foreground bam-red)

   ;; Cursor / highlight line
   (cursor  :background bam-yellow)
   (hl-line :background bam-bg1)

   ;; Match parens
   (show-paren-match :foreground bam-bg-yellow :background bam-bg3 :weight 'bold)

   ;; Line numbers
   ((line-number &override)              :foreground bam-grey)
   ((line-number-current-line &override) :foreground bam-yellow)

   ;; Search
   (isearch        :foreground bam-contrast :background bam-yellow)
   (lazy-highlight :foreground bam-contrast :background bam-bg-yellow)

   ;; Region / visual selection
   (region :background bam-bg2 :foreground bam-fg)

   ;; Indent guides
   (highlight-indent-guides-character-face :foreground bam-bg2)

   ;; Fringe / sign column
   (fringe          :background bam-bg-d :foreground bam-grey)
   ((vertical-border &override) :foreground bam-bg-d)

   ;; Diffs
   (diff-added   :foreground bam-green  :background bam-diff-add)
   (diff-removed :foreground bam-red    :background bam-diff-delete)
   (diff-changed :foreground bam-blue   :background bam-diff-change)
   (diff-refine-added   :foreground bam-green :background bam-diff-add    :weight 'bold)
   (diff-refine-changed :foreground bam-light-blue :background bam-diff-text :weight 'bold)

   ;; Diagnostics
   (flycheck-error   :underline `(:style wave :color ,(doom-color 'red)))
   (flycheck-warning :underline `(:style wave :color ,(doom-color 'orange)))
   (flycheck-info    :underline `(:style wave :color ,(doom-color 'cyan)))

   ;; LSP / Eglot
   (lsp-face-highlight-read  :background bam-bg3)
   (lsp-face-highlight-write :background bam-bg3 :weight 'bold)
   (eldoc-highlight-function-argument :foreground bam-bg-yellow :weight 'bold)

   ;; Mode line
   (mode-line
    :background modeline-bg
    :foreground modeline-fg
    :box (if modeline-pad `(:line-width ,modeline-pad :color ,modeline-bg)))
   (mode-line-inactive
    :background modeline-bg-inactive
    :foreground modeline-fg-inactive
    :box (if modeline-pad `(:line-width ,modeline-pad :color ,modeline-bg-inactive)))
   (mode-line-emphasis
    :foreground (if doom-bamboo-brighter-modeline bam-fg bam-yellow))

   ;; Company
   (company-tooltip           :background bam-bg1 :foreground bam-fg)
   (company-tooltip-selection :background bam-bg2 :foreground bam-fg)
   (company-tooltip-common    :foreground bam-yellow :weight 'bold)
   (company-scrollbar-bg      :background bam-bg-d)
   (company-scrollbar-fg      :background bam-grey)

   ;; Doom modeline
   (doom-modeline-bar                :background bam-green)
   (doom-modeline-evil-emacs-state   :foreground bam-purple)
   (doom-modeline-evil-normal-state  :foreground bam-green)
   (doom-modeline-evil-visual-state  :foreground bam-yellow)
   (doom-modeline-evil-insert-state  :foreground bam-blue)

   ;; Ivy
   (ivy-current-match              :background bam-bg2 :distant-foreground bam-fg)
   (ivy-minibuffer-match-face-1    :foreground bam-green      :background nil :weight 'bold)
   (ivy-minibuffer-match-face-2    :foreground bam-cyan       :background nil :weight 'bold)
   (ivy-minibuffer-match-face-3    :foreground bam-yellow     :background nil :weight 'bold)
   (ivy-minibuffer-match-face-4    :foreground bam-orange     :background nil :weight 'bold)
   (ivy-minibuffer-match-highlight :foreground bam-bg-yellow :weight 'bold)
   (ivy-posframe                   :background modeline-bg-alt)

   ;; Helm
   (helm-selection :foreground bam-contrast :weight 'bold :background bam-green)

   ;; Markdown
   (markdown-markup-face           :foreground bam-grey)
   (markdown-header-face           :inherit 'bold :foreground bam-yellow)
   ((markdown-code-face &override) :background bam-bg1)

   ;; Org
   (org-block            :background (doom-blend bam-green bam-bg0 0.06) :extend t)
   (org-block-background :background (doom-blend bam-green bam-bg0 0.06))
   (org-block-begin-line :background (doom-blend bam-green bam-bg0 0.10) :foreground comments :extend t)
   (org-block-end-line   :background (doom-blend bam-green bam-bg0 0.10) :foreground comments :extend t)
   (org-level-1 :foreground bam-yellow)
   (org-level-2 :foreground bam-green)
   (org-level-3 :foreground bam-cyan)
   (org-level-4 :foreground bam-blue)
   (org-level-5 :foreground bam-orange)
   (org-level-6 :foreground bam-purple)
   (org-level-7 :foreground bam-coral)
   (org-level-8 :foreground bam-light-blue)

   ;; Swiper
   (swiper-line-face    :background bam-bg2)
   (swiper-match-face-1 :inherit 'ivy-minibuffer-match-face-1)
   (swiper-match-face-2 :inherit 'ivy-minibuffer-match-face-2)
   (swiper-match-face-3 :inherit 'ivy-minibuffer-match-face-3)
   (swiper-match-face-4 :inherit 'ivy-minibuffer-match-face-4)

   ;; Solaire
   (solaire-mode-line-face
    :inherit 'mode-line
    :background modeline-bg-alt
    :box (if modeline-pad `(:line-width ,modeline-pad :color ,modeline-bg-alt)))
   (solaire-mode-line-inactive-face
    :inherit 'mode-line-inactive
    :background modeline-bg-inactive-alt
    :box (if modeline-pad `(:line-width ,modeline-pad :color ,modeline-bg-inactive-alt)))

   ;; Widget
   (widget-field             :foreground bam-fg :background bam-bg2)
   (widget-single-line-field :foreground bam-fg :background bam-bg2)

   ;; CSS / SCSS
   (css-proprietary-property :foreground bam-orange)
   (css-property             :foreground bam-cyan)
   (css-selector             :foreground bam-green)

   ;; Rainbow delimiters
   (rainbow-delimiters-depth-1-face :foreground bam-yellow)
   (rainbow-delimiters-depth-2-face :foreground bam-green)
   (rainbow-delimiters-depth-3-face :foreground bam-cyan)
   (rainbow-delimiters-depth-4-face :foreground bam-blue)
   (rainbow-delimiters-depth-5-face :foreground bam-purple)
   (rainbow-delimiters-depth-6-face :foreground bam-orange)
   (rainbow-delimiters-depth-7-face :foreground bam-coral)

   ;; Treemacs
   (treemacs-root-face        :foreground bam-green  :weight 'bold)
   (treemacs-directory-face   :foreground bam-blue)
   (treemacs-file-face        :foreground bam-fg)
   (treemacs-git-modified-face :foreground bam-yellow)
   (treemacs-git-added-face   :foreground bam-green)
   (treemacs-git-deleted-face :foreground bam-red)
   (treemacs-git-ignored-face :foreground bam-grey)

   ;; Magit
   (magit-branch-local        :foreground bam-cyan)
   (magit-branch-remote       :foreground bam-green)
   (magit-diff-added          :foreground bam-green  :background bam-diff-add)
   (magit-diff-removed        :foreground bam-red    :background bam-diff-delete)
   (magit-diff-added-highlight   :foreground bam-green  :background bam-diff-add    :weight 'bold)
   (magit-diff-removed-highlight :foreground bam-red    :background bam-diff-delete :weight 'bold)
   (magit-section-heading     :foreground bam-yellow :weight 'bold)
   (magit-section-highlight   :background bam-bg1)))

;;; doom-bamboo-theme.el ends here
