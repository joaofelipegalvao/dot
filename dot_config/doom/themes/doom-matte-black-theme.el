;;; doom-matte-black-theme.el --- A dark port of the Matte Black theme -*- lexical-binding: t; no-byte-compile: t; -*-
;;
;; Author: tahayvr
;; Ported by: João (doom-emacs port)
;; Keywords: custom themes, faces
;; Homepage: https://github.com/tahayvr/matteblack.nvim
;; Package-Requires: ((emacs "25.1") (cl-lib "0.5") (doom-themes "2.2.1"))
;;
;;; Commentary:
;;
;; A low-distraction monochromatic dark theme ported from matteblack.nvim.
;; Original by tahayvr (https://github.com/tahayvr/matteblack.nvim)
;; Thanks to hlissner (https://github.com/doomemacs/themes)
;;
;;; Code:
(require 'doom-themes)

;;; Variables
(defgroup doom-matte-black-theme nil
  "Options for the `doom-matte-black' theme."
  :group 'doom-themes)

(defcustom doom-matte-black-brighter-modeline nil
  "If non-nil, more vivid colors will be used to style the mode-line."
  :group 'doom-matte-black-theme
  :type 'boolean)

(defcustom doom-matte-black-brighter-comments nil
  "If non-nil, comments will be highlighted in more vivid colors."
  :group 'doom-matte-black-theme
  :type 'boolean)

(defcustom doom-matte-black-padded-modeline doom-themes-padded-modeline
  "If non-nil, adds a 4px padding to the mode-line. Can be an integer to determine the exact padding."
  :group 'doom-matte-black-theme
  :type '(choice integer boolean))

;;; Theme definition
(def-doom-theme doom-matte-black
  "A low-distraction dark theme ported from matteblack.nvim."
  ;; name           default   256       16
  (
    ;; --- Palette (mirrors M.palette in init.lua) ---
    (bg0            '("#0D0D0D" "#0D0D0D" "black"       ))
    (bg1            '("#121212" "#121212" "black"       ))
    (bg2            '("#333333" "#333333" "brightblack" ))
    (bg3            '("#212121" "#212121" "brightblack" ))
    (bg4            '("#262626" "#262626" "brightblack" ))

    (fg0            '("#FFFFFF" "#FFFFFF" "white"       ))
    (fg1            '("#EAEAEA" "#EAEAEA" "brightwhite" ))
    (fg2            '("#BEBEBE" "#BEBEBE" "white"       ))
    (fg3            '("#8A8A8D" "#8A8A8D" "brightblack" ))
    (fg4            '("#333333" "#333333" "brightblack" ))

    (selbg          '("#262626" "#262626" "brightblack" ))
    (selfg          '("#FFFFFF" "#FFFFFF" "white"       ))

    (mb-comment     '("#8A8A8D" "#8A8A8D" "brightblack" ))

    (mb-red         '("#B91C1C" "#B91C1C" "red"         ))
    (mb-crimson     '("#DC2626" "#DC2626" "red"         ))
    (mb-orange      '("#F59E0B" "#F59E0B" "yellow"      ))
    (mb-amber       '("#D97706" "#D97706" "yellow"      ))
    (mb-yellow      '("#FBBF24" "#FBBF24" "yellow"      ))
    (mb-gold        '("#EFBF04" "#EFBF04" "yellow"      ))
    (mb-ochre       '("#BF9903" "#BF9903" "yellow"      ))

    (mb-green       '("#059669" "#059669" "green"       ))
    (mb-teal        '("#10B981" "#10B981" "green"       ))
    (mb-blue        '("#3B82F6" "#3B82F6" "blue"        ))
    (mb-purple      '("#8D20B2" "#8D20B2" "magenta"     ))
    (mb-cyan        '("#1EA7A0" "#1EA7A0" "cyan"        ))

    (mb-pink        '("#F87171" "#F87171" "red"         ))
    (mb-magenta     '("#B027DE" "#B027DE" "magenta"     ))

    (mb-gray        '("#5C6370" "#5C6370" "brightblack" ))
    (mb-gray1       '("#A3A3A3" "#A3A3A3" "white"       ))
    (mb-gray2       '("#737373" "#737373" "brightblack" ))

    ;; --- Required doom-themes variables ---
    (bg             bg1)
    (fg             fg1)

    (bg-alt         bg3)
    (fg-alt         fg2)

    ;; base0 = darkest … base8 = lightest (used for subtle UI chrome)
    (base0          bg0)
    (base1          bg1)
    (base2          bg3)
    (base3          bg4)
    (base4          bg2)
    (base5          mb-gray)
    (base6          mb-gray2)
    (base7          mb-gray1)
    (base8          fg2)

    (grey           mb-comment)
    (red            mb-crimson)
    (orange         mb-orange)
    (green          mb-green)
    (teal           mb-teal)
    (yellow         mb-yellow)
    (blue           mb-blue)
    (dark-blue      mb-blue)
    (magenta        mb-magenta)
    (violet         mb-purple)
    (cyan           mb-cyan)
    (dark-cyan      mb-cyan)

    ;; --- Required face categories ---
    (highlight      mb-orange)   ; cursor / active highlight
    (selection      bg4)
    (region         bg2)         ; visual selection  → bg2 (#333333)
    (vertical-bar   bg3)

    (comments       (if doom-matte-black-brighter-comments mb-gray1 mb-comment))
    (doc-comments   (if doom-matte-black-brighter-comments mb-gray1 mb-comment))

    ;; syntax — mirrors the Nvim set() calls
    (builtin        mb-green)    ; Statement / Keyword
    (constants      mb-amber)    ; Constant / Identifier
    (functions      mb-crimson)  ; Function
    (keywords       mb-green)    ; Keyword / Conditional / Repeat
    (methods        mb-crimson)
    (numbers        mb-gold)     ; Number / Float
    (operators      fg2)         ; Operator
    (strings        fg1)         ; String (near-white, as in original)
    (type           mb-yellow)   ; Type / StorageClass / Typedef
    (variables      mb-amber)    ; Identifier
    (error          mb-crimson)
    (success        mb-teal)
    (warning        mb-amber)
    (vc-added       mb-teal)
    (vc-deleted     mb-crimson)
    (vc-modified    mb-orange)

    ;; --- Modeline ---
    (modeline-bg              (if doom-matte-black-brighter-modeline bg4 bg3))
    (modeline-fg              fg1)
    (modeline-bg-alt          (if doom-matte-black-brighter-modeline bg2 bg4))
    (modeline-fg-alt          fg2)
    (modeline-bg-inactive     bg1)
    (modeline-fg-inactive     fg3)
    (modeline-bg-inactive-alt bg1)
    (modeline-fg-inactive-alt fg3)
    (modeline-pad
      (when doom-matte-black-padded-modeline
        (if (integerp doom-matte-black-padded-modeline) doom-matte-black-padded-modeline 4))))

  ;; --- Base theme face overrides ---
  (
    ;; Font / syntax
    ((font-lock-comment-face &override)
      :slant 'italic
      :foreground comments
      :background (if doom-matte-black-brighter-comments (doom-blend mb-gray bg1 0.08)))
    ((font-lock-type-face &override) :slant 'italic)
    ((font-lock-keyword-face &override) :weight 'bold)
    ((font-lock-constant-face &override) :weight 'bold :foreground mb-amber)
    ((font-lock-string-face &override) :foreground fg1)
    ((font-lock-function-name-face &override) :foreground mb-crimson)
    ((font-lock-variable-name-face &override) :foreground mb-amber)
    ((font-lock-builtin-face &override) :foreground mb-green :slant 'italic)
    ((font-lock-preprocessor-face &override) :foreground mb-yellow)

    ;; Cursor / highlight line
    (cursor :background mb-orange)
    (hl-line :background bg3)

    ;; Match parens
    (show-paren-match :foreground mb-orange :background bg4 :weight 'bold)

    ;; Line numbers
    ((line-number &override) :foreground bg2)
    ((line-number-current-line &override) :foreground mb-orange)

    ;; Search
    (isearch :foreground bg1 :background mb-orange)
    (lazy-highlight :foreground bg1 :background mb-gold)

    ;; Region / visual selection
    (region :background bg2 :foreground fg0)

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
      :foreground (if doom-matte-black-brighter-modeline fg1 mb-orange))

    ;; Fringe / sign column
    (fringe :background bg1 :foreground bg2)
    ((vertical-border &override) :foreground bg3)

    ;; Folding
    (fold-overlay :foreground fg2 :background bg3)

    ;; Diffs
    (diff-added   :foreground mb-teal)
    (diff-removed :foreground mb-crimson)
    (diff-changed :foreground mb-orange)

    ;; Diagnostics
    (flycheck-error   :underline `(:style wave :color ,mb-crimson))
    (flycheck-warning :underline `(:style wave :color ,mb-amber))
    (flycheck-info    :underline `(:style wave :color ,mb-blue))

    ;; Company
    (company-tooltip           :background bg3 :foreground fg2)
    (company-tooltip-selection :background bg2 :foreground fg1)
    (company-tooltip-common    :foreground mb-orange :weight 'bold)
    (company-scrollbar-bg      :background bg2)
    (company-scrollbar-fg      :background fg3)

    ;; Doom modeline
    (doom-modeline-bar                :background mb-green)
    (doom-modeline-evil-emacs-state   :foreground mb-magenta)
    (doom-modeline-evil-normal-state  :foreground mb-green)
    (doom-modeline-evil-visual-state  :foreground mb-purple)
    (doom-modeline-evil-insert-state  :foreground mb-orange)

    ;; Ivy
    (ivy-current-match              :background bg3 :distant-foreground fg1)
    (ivy-minibuffer-match-face-1    :foreground mb-green  :background nil :weight 'bold)
    (ivy-minibuffer-match-face-2    :foreground mb-blue   :background nil :weight 'bold)
    (ivy-minibuffer-match-face-3    :foreground mb-orange :background nil :weight 'bold)
    (ivy-minibuffer-match-face-4    :foreground mb-amber  :background nil :weight 'bold)
    (ivy-minibuffer-match-highlight :foreground mb-magenta :weight 'bold)
    (ivy-posframe                   :background modeline-bg-alt)

    ;; Helm
    (helm-selection :foreground bg1 :weight 'bold :background mb-orange)

    ;; Markdown
    (markdown-markup-face     :foreground fg2)
    (markdown-header-face     :inherit 'bold :foreground mb-crimson)
    ((markdown-code-face &override) :background bg3)

    ;; Org
    (org-block            :background (doom-blend mb-gold bg1 0.05) :extend t)
    (org-block-background :background (doom-blend mb-gold bg1 0.05))
    (org-block-begin-line :background (doom-blend mb-gold bg1 0.09) :foreground comments :extend t)
    (org-block-end-line   :background (doom-blend mb-gold bg1 0.09) :foreground comments :extend t)
    (org-level-1 :foreground mb-orange)
    (org-level-2 :foreground mb-teal)
    (org-level-3 :foreground mb-blue)
    (org-level-4 :foreground mb-amber)
    (org-level-5 :foreground mb-orange)
    (org-level-6 :foreground mb-teal)
    (org-level-7 :foreground mb-blue)
    (org-level-8 :foreground mb-amber)

    ;; Swiper
    (swiper-line-face       :background bg2)
    (swiper-match-face-1    :inherit 'ivy-minibuffer-match-face-1)
    (swiper-match-face-2    :inherit 'ivy-minibuffer-match-face-2)
    (swiper-match-face-3    :inherit 'ivy-minibuffer-match-face-3)
    (swiper-match-face-4    :inherit 'ivy-minibuffer-match-face-4)

    ;; Solaire mode line
    (solaire-mode-line-face
      :inherit 'mode-line
      :background modeline-bg-alt
      :box (if modeline-pad `(:line-width ,modeline-pad :color ,modeline-bg-alt)))
    (solaire-mode-line-inactive-face
      :inherit 'mode-line-inactive
      :background modeline-bg-inactive-alt
      :box (if modeline-pad `(:line-width ,modeline-pad :color ,modeline-bg-inactive-alt)))

    ;; Widget
    (widget-field             :foreground fg1 :background bg4)
    (widget-single-line-field :foreground fg1 :background bg4)

    ;; CSS / SCSS
    (css-proprietary-property :foreground mb-orange)
    (css-property             :foreground mb-green)
    (css-selector             :foreground mb-green)

    ;; LSP / Eglot hover
    (eldoc-highlight-function-argument :foreground mb-orange :weight 'bold)))

;;; doom-matte-black-theme.el ends here
