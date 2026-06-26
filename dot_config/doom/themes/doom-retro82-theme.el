;;; doom-retro82-theme.el --- A dark port of the Retro-82 theme -*- lexical-binding: t; no-byte-compile: t; -*-
;;
;; Author: OldJobobo
;; Ported by: joaofelipegalvao (doom-emacs port)
;; Keywords: custom themes, faces
;; Homepage: https://github.com/OldJobobo/retro-82.nvim
;;
;;; Commentary:
;;
;; Boot sequence initiated. CRT warming up.
;; Deep navy retrocomputing theme with warm amber and teal accents.
;; Ported from OldJobobo/retro-82.nvim (Base24 palette).
;; Thanks to hlissner (https://github.com/doomemacs/themes)
;;
;;; Code:
(require 'doom-themes)

;;; Variables
(defgroup doom-retro82-theme nil
  "Options for the `doom-retro82' theme."
  :group 'doom-themes)

(defcustom doom-retro82-brighter-modeline nil
  "If non-nil, more vivid colors will be used to style the mode-line."
  :group 'doom-retro82-theme
  :type 'boolean)

(defcustom doom-retro82-brighter-comments nil
  "If non-nil, comments will be highlighted in more vivid colors."
  :group 'doom-retro82-theme
  :type 'boolean)

(defcustom doom-retro82-padded-modeline doom-themes-padded-modeline
  "If non-nil, adds a 4px padding to the mode-line.
Can be an integer to determine the exact padding."
  :group 'doom-retro82-theme
  :type '(choice integer boolean))

;;; Theme definition
(def-doom-theme doom-retro82
    "A deep navy retrocomputing theme with warm amber and teal accents, ported from retro-82.nvim."

  ;; name              default   256       16
  (
   ;; --- Base palette (mirrors palette.lua) ---
   (r82-base00         '("#00172E" "#00172E" "black"       ))  ; bg0
   (r82-base01         '("#01204E" "#01204E" "black"       ))  ; bg_alt / panel
   (r82-base02         '("#0A3A45" "#0A3A45" "black"       ))  ; bg1 / surface
   (r82-base03         '("#134E5A" "#134E5A" "brightblack" ))  ; bg2 / surface_highlight / comment
   (r82-base04         '("#2A6A73" "#2A6A73" "brightblack" ))  ; text_muted / muted / border
   (r82-base05         '("#5F8F96" "#5F8F96" "brightblack" ))  ; fg_dim
   (r82-base06         '("#A7C9C6" "#A7C9C6" "white"       ))  ; fg0 / text / identifier
   (r82-base07         '("#FFF1DA" "#FFF1DA" "white"       ))  ; fg1 / text_bright
   (r82-base08         '("#F85525" "#F85525" "red"         ))  ; error / deleted
   (r82-base09         '("#E97B3C" "#E97B3C" "yellow"      ))  ; warning
   (r82-base0A         '("#FAA968" "#FAA968" "yellow"      ))  ; keyword / preproc / func
   (r82-base0B         '("#F6DCAC" "#F6DCAC" "yellow"      ))  ; string
   (r82-base0C         '("#8CBFB8" "#8CBFB8" "cyan"        ))  ; support / builtin / regex
   (r82-base0D         '("#3F8F8A" "#3F8F8A" "cyan"        ))
   (r82-base0E         '("#028391" "#028391" "cyan"        ))  ; statement / operator
   (r82-base0F         '("#176B73" "#176B73" "cyan"        ))  ; special / deprecated
   (r82-base10         '("#000F1F" "#000F1F" "black"       ))  ; bg3 / surface_deep / panel_deep
   (r82-base11         '("#011935" "#011935" "black"       ))  ; bg4 / surface_deeper / panel_deeper
   (r82-base12         '("#FF6B3D" "#FF6B3D" "brightred"   ))
   (r82-base13         '("#FFBE7A" "#FFBE7A" "yellow"      ))  ; modified
   (r82-base14         '("#19A7A8" "#19A7A8" "cyan"        ))  ; success / added
   (r82-base15         '("#A8D6CF" "#A8D6CF" "brightcyan"  ))  ; match / search
   (r82-base16         '("#5AA6A1" "#5AA6A1" "cyan"        ))  ; constructor / link / rename / directory
   (r82-base17         '("#2C7C88" "#2C7C88" "cyan"        ))  ; module / namespace / tag
   (r82-base18         '("#FF8A6B" "#FF8A6B" "red"         ))  ; constant / number / conflict
   (r82-base19         '("#E0B55E" "#E0B55E" "yellow"      ))
   (r82-base1A         '("#9FD9B3" "#9FD9B3" "green"       ))  ; hint
   (r82-base1B         '("#63C6BE" "#63C6BE" "cyan"        ))  ; escape
   (r82-base1C         '("#39B5D4" "#39B5D4" "brightblue"  ))  ; annotation / info
   (r82-base1D         '("#6FA6C8" "#6FA6C8" "blue"        ))  ; type
   (r82-base1E         '("#B6E3D1" "#B6E3D1" "brightcyan"  ))
   (r82-base1F         '("#FFB38F" "#FFB38F" "yellow"      ))

   ;; --- Tonal / semantic aliases (mirrors M.* assignments) ---
   ;; backgrounds
   (r82-bg0            r82-base00)   ; #00172E
   (r82-bg-alt         r82-base01)   ; #01204E
   (r82-bg1            r82-base02)   ; #0A3A45
   (r82-bg2            r82-base03)   ; #134E5A
   (r82-bg3            r82-base10)   ; #000F1F
   (r82-bg4            r82-base11)   ; #011935
   ;; foregrounds
   (r82-fg-dim         r82-base05)   ; #5F8F96
   (r82-fg0            r82-base06)   ; #A7C9C6
   (r82-fg1            r82-base07)   ; #FFF1DA
   ;; semantic
   (r82-text-muted     r82-base04)   ; #2A6A73
   (r82-comment        r82-base03)   ; #134E5A
   (r82-border         r82-base04)   ; #2A6A73
   (r82-selection      r82-base03)   ; #134E5A
   ;; syntax
   (r82-error          r82-base08)   ; #F85525
   (r82-warning        r82-base09)   ; #E97B3C
   (r82-constant       r82-base18)   ; #FF8A6B
   (r82-keyword        r82-base0A)   ; #FAA968
   (r82-string         r82-base0B)   ; #F6DCAC
   (r82-success        r82-base14)   ; #19A7A8
   (r82-support        r82-base0C)   ; #8CBFB8
   (r82-type           r82-base1D)   ; #6FA6C8
   (r82-func           r82-base0A)   ; #FAA968
   (r82-number         r82-base18)   ; #FF8A6B
   (r82-statement      r82-base0E)   ; #028391
   (r82-operator       r82-base0E)   ; #028391
   (r82-module         r82-base17)   ; #2C7C88
   (r82-builtin        r82-base0C)   ; #8CBFB8
   (r82-special        r82-base0F)   ; #176B73
   (r82-annotation     r82-base1C)   ; #39B5D4
   (r82-info           r82-base1C)   ; #39B5D4
   (r82-hint           r82-base1A)   ; #9FD9B3
   (r82-added          r82-base14)   ; #19A7A8
   (r82-modified       r82-base13)   ; #FFBE7A
   (r82-deleted        r82-base08)   ; #F85525
   (r82-match          r82-base15)   ; #A8D6CF
   (r82-link           r82-base16)   ; #5AA6A1
   (r82-constructor    r82-base16)   ; #5AA6A1
   (r82-escape         r82-base1B)   ; #63C6BE

   ;; --- Required doom-themes variables ---
   (bg                 r82-bg0)
   (fg                 r82-fg0)
   (bg-alt             r82-bg-alt)
   (fg-alt             r82-fg1)

   ;; base0 = darkest ... base8 = lightest
   (base0              r82-bg4)
   (base1              r82-bg3)
   (base2              r82-bg0)
   (base3              r82-bg-alt)
   (base4              r82-bg1)
   (base5              r82-bg2)
   (base6              r82-text-muted)
   (base7              r82-fg-dim)
   (base8              r82-fg0)

   (grey               r82-text-muted)
   (red                r82-error)
   (orange             r82-warning)
   (green              r82-success)
   (teal               r82-escape)
   (yellow             r82-keyword)
   (blue               r82-base1D)
   (dark-blue          r82-base0E)
   (magenta            r82-annotation)
   (violet             r82-base1C)
   (cyan               r82-support)
   (dark-cyan          r82-special)

   ;; --- Required face categories ---
   (highlight          r82-keyword)
   (selection          r82-selection)
   (region             r82-selection)
   (vertical-bar       r82-bg3)

   (comments           (if doom-retro82-brighter-comments r82-fg-dim r82-base04))
   (doc-comments       (if doom-retro82-brighter-comments r82-fg-dim r82-base04))

   ;; syntax
   (builtin            r82-builtin)
   (constants          r82-constant)
   (functions          r82-func)
   (keywords           r82-keyword)
   (methods            r82-func)
   (numbers            r82-number)
   (operators          r82-operator)
   (strings            r82-string)
   (type               r82-type)
   (variables          r82-fg0)
   (error              r82-error)
   (success            r82-success)
   (warning            r82-warning)

   (vc-added           r82-added)
   (vc-deleted         r82-deleted)
   (vc-modified        r82-modified)

   ;; --- Modeline ---
   (modeline-bg              (if doom-retro82-brighter-modeline r82-bg2 r82-bg-alt))
   (modeline-fg              r82-fg0)
   (modeline-bg-alt          (if doom-retro82-brighter-modeline r82-bg-alt r82-bg3))
   (modeline-fg-alt          r82-fg-dim)
   (modeline-bg-inactive     r82-bg-alt)
   (modeline-fg-inactive     r82-text-muted)
   (modeline-bg-inactive-alt r82-bg3)
   (modeline-fg-inactive-alt r82-base04)
   (modeline-pad
    (when doom-retro82-padded-modeline
      (if (integerp doom-retro82-padded-modeline) doom-retro82-padded-modeline 4))))

  ;; --- Base theme face overrides ---
  (
   ;; Syntax / font-lock
   ((font-lock-comment-face &override)
    :slant 'italic
    :foreground comments
    :background (if doom-retro82-brighter-comments (doom-blend r82-base04 r82-bg0 0.08)))
   ((font-lock-doc-face &override)
    :slant 'italic
    :foreground doc-comments)
   ((font-lock-string-face &override)        :foreground r82-string)
   ((font-lock-keyword-face &override)       :foreground r82-keyword :weight 'bold)
   ((font-lock-type-face &override)          :foreground r82-type :slant 'italic)
   ((font-lock-function-name-face &override) :foreground r82-func)
   ((font-lock-variable-name-face &override) :foreground r82-fg0)
   ((font-lock-constant-face &override)      :foreground r82-constant :weight 'bold)
   ((font-lock-builtin-face &override)       :foreground r82-builtin :slant 'italic)
   ((font-lock-preprocessor-face &override)  :foreground r82-keyword)
   ((font-lock-warning-face &override)       :foreground r82-warning)
   ((font-lock-negation-char-face &override) :foreground r82-error :weight 'bold)

   ;; Cursor / highlight line
   (cursor  :background r82-keyword)
   (hl-line :background r82-bg-alt)

   ;; Match parens
   (show-paren-match    :foreground r82-fg1 :background r82-bg2 :weight 'bold)
   (show-paren-mismatch :foreground r82-fg1 :background r82-error :weight 'bold)

   ;; Line numbers
   ((line-number &override)              :foreground r82-text-muted)
   ((line-number-current-line &override) :foreground r82-keyword :weight 'bold)

   ;; Search
   (isearch        :foreground r82-bg0 :background r82-match :weight 'bold)
   (lazy-highlight :foreground r82-bg0 :background r82-base16)
   (evil-ex-search :foreground r82-bg0 :background r82-match :weight 'bold)

   ;; Region / visual selection
   (region :background r82-selection :foreground r82-fg1)

   ;; Indent guides
   (highlight-indent-guides-character-face :foreground r82-bg2)
   (highlight-indent-guides-top-character-face :foreground r82-border)

   ;; Fringe / sign column
   (fringe          :background r82-bg3 :foreground r82-text-muted)
   ((vertical-border &override) :foreground r82-bg3)

   ;; Diffs
   (diff-added             :foreground r82-added    :background (doom-blend r82-added r82-bg0 0.10))
   (diff-removed           :foreground r82-deleted  :background (doom-blend r82-deleted r82-bg0 0.10))
   (diff-changed           :foreground r82-modified :background (doom-blend r82-modified r82-bg0 0.10))
   (diff-refine-added      :foreground r82-hint      :weight 'bold)
   (diff-refine-changed    :foreground r82-modified  :weight 'bold)
   (diff-refine-removed    :foreground r82-error     :weight 'bold)

   ;; Diagnostics (flycheck)
   (flycheck-error   :underline `(:style wave :color ,(doom-color 'red)))
   (flycheck-warning :underline `(:style wave :color ,(doom-color 'orange)))
   (flycheck-info    :underline `(:style wave :color ,(doom-color 'teal)))

   ;; Diagnostics (flymake)
   (flymake-error   :underline `(:style wave :color ,(doom-color 'red)))
   (flymake-warning :underline `(:style wave :color ,(doom-color 'orange)))
   (flymake-note    :underline `(:style wave :color ,(doom-color 'teal)))

   ;; LSP / Eglot
   (lsp-face-highlight-read  :background r82-bg2)
   (lsp-face-highlight-write :background r82-bg2 :weight 'bold)
   (lsp-ui-doc-background    :background r82-bg-alt)
   (eldoc-highlight-function-argument :foreground r82-fg1 :weight 'bold)

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
    :foreground (if doom-retro82-brighter-modeline r82-fg1 r82-keyword))
   (mode-line-highlight
    :foreground r82-annotation :weight 'bold)

   ;; Company
   (company-tooltip             :background r82-bg-alt :foreground r82-fg0)
   (company-tooltip-selection   :background r82-bg2    :foreground r82-fg1)
   (company-tooltip-common      :foreground r82-keyword :weight 'bold)
   (company-tooltip-annotation  :foreground r82-annotation)
   (company-scrollbar-bg        :background r82-bg3)
   (company-scrollbar-fg        :background r82-text-muted)
   (company-preview-common      :foreground r82-fg-dim)

   ;; Doom modeline
   (doom-modeline-bar                :background r82-statement)
   (doom-modeline-bar-inactive       :background r82-bg3)
   (doom-modeline-evil-emacs-state   :foreground r82-annotation)
   (doom-modeline-evil-normal-state  :foreground r82-success)
   (doom-modeline-evil-visual-state  :foreground r82-keyword)
   (doom-modeline-evil-insert-state  :foreground r82-escape)
   (doom-modeline-evil-replace-state :foreground r82-error)
   (doom-modeline-project-dir        :foreground r82-link)
   (doom-modeline-buffer-modified    :foreground r82-modified :weight 'bold)

   ;; Ivy
   (ivy-current-match              :background r82-bg2 :distant-foreground r82-fg1)
   (ivy-minibuffer-match-face-1    :foreground r82-success    :background nil :weight 'bold)
   (ivy-minibuffer-match-face-2    :foreground r82-keyword    :background nil :weight 'bold)
   (ivy-minibuffer-match-face-3    :foreground r82-annotation :background nil :weight 'bold)
   (ivy-minibuffer-match-face-4    :foreground r82-escape     :background nil :weight 'bold)
   (ivy-minibuffer-match-highlight :foreground r82-fg1 :weight 'bold)
   (ivy-posframe                   :background modeline-bg-alt)
   (ivy-posframe-border            :background r82-border)

   ;; Vertico / Consult
   (vertico-current               :background r82-bg2 :foreground r82-fg1)
   (consult-preview-line          :background r82-bg2)
   (consult-highlight-match       :foreground r82-keyword :weight 'bold)

   ;; Helm
   (helm-selection :foreground r82-fg1 :weight 'bold :background r82-bg2)
   (helm-match     :foreground r82-keyword :weight 'bold)
   (helm-source-header :foreground r82-statement :weight 'bold :background r82-bg3)

   ;; Markdown
   (markdown-markup-face           :foreground r82-text-muted)
   (markdown-header-face           :inherit 'bold :foreground r82-keyword)
   (markdown-link-face             :foreground r82-link :underline t)
   (markdown-bold-face             :foreground r82-fg1 :weight 'bold)
   ((markdown-code-face &override) :background r82-bg-alt)
   (markdown-pre-face              :background r82-bg-alt)

   ;; Org
   (org-block            :background (doom-blend r82-statement r82-bg0 0.07) :extend t)
   (org-block-background :background (doom-blend r82-statement r82-bg0 0.07))
   (org-block-begin-line :background (doom-blend r82-statement r82-bg0 0.12) :foreground comments :extend t)
   (org-block-end-line   :background (doom-blend r82-statement r82-bg0 0.12) :foreground comments :extend t)
   (org-level-1          :foreground r82-keyword    :weight 'bold)
   (org-level-2          :foreground r82-success)
   (org-level-3          :foreground r82-type)
   (org-level-4          :foreground r82-annotation)
   (org-level-5          :foreground r82-escape)
   (org-level-6          :foreground r82-string)
   (org-level-7          :foreground r82-constant)
   (org-level-8          :foreground r82-hint)
   (org-link             :foreground r82-link :underline t)
   (org-todo             :foreground r82-error   :weight 'bold)
   (org-done             :foreground r82-success :weight 'bold)
   (org-headline-done    :foreground r82-text-muted)
   (org-date             :foreground r82-annotation)
   (org-tag              :foreground r82-module)
   (org-special-keyword  :foreground r82-special)

   ;; Swiper
   (swiper-line-face    :background r82-selection)
   (swiper-match-face-1 :inherit 'ivy-minibuffer-match-face-1)
   (swiper-match-face-2 :inherit 'ivy-minibuffer-match-face-2)
   (swiper-match-face-3 :inherit 'ivy-minibuffer-match-face-3)
   (swiper-match-face-4 :inherit 'ivy-minibuffer-match-face-4)

   ;; Solaire
   (solaire-default-face
    :background r82-bg-alt)
   (solaire-mode-line-face
    :inherit 'mode-line
    :background modeline-bg-alt
    :box (if modeline-pad `(:line-width ,modeline-pad :color ,modeline-bg-alt)))
   (solaire-mode-line-inactive-face
    :inherit 'mode-line-inactive
    :background modeline-bg-inactive-alt
    :box (if modeline-pad `(:line-width ,modeline-pad :color ,modeline-bg-inactive-alt)))

   ;; Widget
   (widget-field             :foreground r82-fg0 :background r82-bg2)
   (widget-single-line-field :foreground r82-fg0 :background r82-bg2)

   ;; Links
   (link         :foreground r82-link :underline t)
   (link-visited :foreground r82-module :underline t)

   ;; CSS / SCSS
   (css-proprietary-property :foreground r82-constant)
   (css-property             :foreground r82-support)
   (css-selector             :foreground r82-func)

   ;; Rainbow delimiters
   (rainbow-delimiters-depth-1-face :foreground r82-keyword)
   (rainbow-delimiters-depth-2-face :foreground r82-success)
   (rainbow-delimiters-depth-3-face :foreground r82-type)
   (rainbow-delimiters-depth-4-face :foreground r82-annotation)
   (rainbow-delimiters-depth-5-face :foreground r82-escape)
   (rainbow-delimiters-depth-6-face :foreground r82-support)
   (rainbow-delimiters-depth-7-face :foreground r82-constant)

   ;; Treemacs
   (treemacs-root-face         :foreground r82-keyword   :weight 'bold)
   (treemacs-directory-face    :foreground r82-link)
   (treemacs-file-face         :foreground r82-fg0)
   (treemacs-git-modified-face :foreground r82-modified)
   (treemacs-git-added-face    :foreground r82-added)
   (treemacs-git-deleted-face  :foreground r82-deleted)
   (treemacs-git-ignored-face  :foreground r82-text-muted)
   (treemacs-git-untracked-face :foreground r82-fg-dim)

   ;; Magit
   (magit-branch-local           :foreground r82-escape)
   (magit-branch-remote          :foreground r82-success)
   (magit-tag                    :foreground r82-keyword)
   (magit-hash                   :foreground r82-fg-dim)
   (magit-section-heading        :foreground r82-keyword :weight 'bold)
   (magit-section-highlight      :background r82-bg-alt)
   (magit-diff-added             :foreground r82-added   :background (doom-blend r82-added r82-bg0 0.10))
   (magit-diff-removed           :foreground r82-deleted :background (doom-blend r82-deleted r82-bg0 0.10))
   (magit-diff-added-highlight   :foreground r82-hint    :background (doom-blend r82-added r82-bg0 0.18) :weight 'bold)
   (magit-diff-removed-highlight :foreground r82-base12  :background (doom-blend r82-deleted r82-bg0 0.18) :weight 'bold)
   (magit-diff-context-highlight :background r82-bg-alt  :foreground r82-fg-dim)
   (magit-blame-heading          :background r82-bg2 :foreground r82-fg-dim)

   ;; Git gutter
   (git-gutter:added    :foreground r82-added)
   (git-gutter:deleted  :foreground r82-deleted)
   (git-gutter:modified :foreground r82-modified)

   ;; Compilation
   (compilation-error   :foreground r82-error  :weight 'bold)
   (compilation-warning :foreground r82-warning :weight 'bold)
   (compilation-info    :foreground r82-info)
   (compilation-mode-line-exit :foreground r82-success :weight 'bold)
   (compilation-mode-line-fail :foreground r82-error   :weight 'bold)))

;;; doom-retro82-theme.el ends here
