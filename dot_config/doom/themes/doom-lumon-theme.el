;;; doom-lumon-theme.el --- Lumon Industries dark theme -*- lexical-binding: t; no-byte-compile: t; -*-
;;
;; Author: Bjarne Øverli <https://github.com/omacom-io/lumon.nvim>
;; Ported by: nielle
;; Keywords: custom themes, faces
;;
;;; Commentary:
;;
;; Ported from the Lumon Industries colorscheme for Neovim by Bjarne Øverli.
;; A monochromatic deep-blue palette inspired by the corporate aesthetic of
;; Lumon Industries (Severance). Cool, precise, and strangely calming.
;; Thanks https://github.com/omacom-io/lumon.nvim
;;
;;; Code:

(require 'doom-themes)

;;; Variables
(defgroup doom-lumon-theme nil
  "Options for the `doom-lumon' theme."
  :group 'doom-themes)

(defcustom doom-lumon-brighter-comments nil
  "If non-nil, comments will use dark5 (#8fb9dc) instead of the dimmer comment tone."
  :group 'doom-lumon-theme
  :type 'boolean)

(defcustom doom-lumon-brighter-modeline nil
  "If non-nil, the mode-line will use bg-highlight instead of bg-dark."
  :group 'doom-lumon-theme
  :type 'boolean)

(defcustom doom-lumon-padded-modeline doom-themes-padded-modeline
  "If non-nil, adds a 4px padding to the mode-line.
Can be an integer to determine the exact padding."
  :group 'doom-lumon-theme
  :type '(choice integer boolean))

;;; Theme definition
(def-doom-theme doom-lumon
  "Dark theme based on the Lumon Industries colorscheme for Neovim by Bjarne Øverli."

  ;; -----------------------------------------------------------------------
  ;; Lumon Palette — monochromatic deep blue
  ;; Source: lua/lumon/colors/init.lua
  ;; -----------------------------------------------------------------------
  (
    ;; name               default    256        16
    ;; -- Backgrounds --
    (lumon-bg            '("#1b2d40"  "#1b2d40"  "black"       ))  ;; bg            — main editor bg
    (lumon-bg-dark       '("#16242d"  "#16242d"  "black"       ))  ;; bg_dark       — darker bg / popups / statusline
    (lumon-bg-highlight  '("#355066"  "#355066"  "brightblack" ))  ;; bg_highlight  — cursor column / selection
    (lumon-blue7         '("#243a50"  "#243a50"  "black"       ))  ;; blue7         — diff change bg / inlay hints
    (lumon-black         '("#121d28"  "#121d28"  "black"       ))  ;; black (blended) — colorcolumn / tab fill / border

    ;; -- Foregrounds --
    (lumon-fg            '("#c7d2de"  "#c7d2de"  "brightwhite" ))  ;; fg            — main text
    (lumon-fg-gutter     '("#355066"  "#355066"  "brightblack" ))  ;; fg_gutter     — line numbers / sign column
    (lumon-dark3         '("#355066"  "#355066"  "brightblack" ))  ;; dark3         — non-text / ignored
    (lumon-dark5         '("#8fb9dc"  "#8fb9dc"  "blue"        ))  ;; dark5         — conceal / qf line nr

    ;; -- Blues (accent spectrum) --
    (lumon-blue          '("#92c7e7"  "#92c7e7"  "blue"        ))  ;; blue          — functions / directories / statements
    (lumon-blue5         '("#b5deef"  "#b5deef"  "brightblue"  ))  ;; blue5/cyan    — cyan / teal / special chars
    (lumon-blue0         '("#355066"  "#355066"  "brightblack" ))  ;; blue0         — search bg / visual bg base

    ;; -- Syntax colors --
    (lumon-green         '("#79abd2"  "#79abd2"  "cyan"        ))  ;; green         — strings / git add
    (lumon-yellow        '("#86b6da"  "#86b6da"  "blue"        ))  ;; yellow        — types / labels / warning
    (lumon-orange        '("#8fb9dc"  "#8fb9dc"  "blue"        ))  ;; orange        — numbers / cursorlineNr / incSearch
    (lumon-red           '("#6e9fca"  "#6e9fca"  "blue"        ))  ;; red           — tags / debug / git delete
    (lumon-purple        '("#9fcfe9"  "#9fcfe9"  "brightblue"  ))  ;; purple        — constants / keywords / conditionals
    (lumon-magenta       '("#b3d7ec"  "#b3d7ec"  "brightblue"  ))  ;; magenta       — html h1
    (lumon-magenta2      '("#9fcfe9"  "#9fcfe9"  "brightblue"  ))  ;; magenta2      — identifiers / functions / exceptions
    (lumon-comment       '("#355066"  "#355066"  "brightblack" ))  ;; comment       — comments (dim blue-grey)
    (lumon-special-char  '("#b5deef"  "#b5deef"  "brightblue"  ))  ;; special_char  — special characters

    ;; -- Variables required by doom themes --
    (bg           lumon-bg)
    (fg           lumon-fg)
    (bg-alt       lumon-bg-dark)
    (fg-alt       '("#c7d2de"  "#c7d2de"  "brightwhite"))

    (base0        lumon-black)
    (base1        lumon-bg-dark)
    (base2        lumon-blue7)
    (base3        lumon-bg)
    (base4        lumon-bg-highlight)
    (base5        lumon-blue0)
    (base6        lumon-dark5)
    (base7        lumon-blue5)
    (base8        lumon-fg)

    (grey         lumon-fg-gutter)
    (red          lumon-red)
    (orange       lumon-orange)
    (green        lumon-green)
    (teal         lumon-blue5)
    (yellow       lumon-yellow)
    (blue         lumon-blue)
    (dark-blue    lumon-blue0)
    (magenta      lumon-magenta2)
    (violet       lumon-purple)
    (cyan         lumon-blue5)
    (dark-cyan    lumon-green)

    ;; Face categories
    (highlight    lumon-bg-highlight)
    (selection    lumon-bg-highlight)
    (region       lumon-bg-highlight)
    (vertical-bar lumon-black)

    (comments     (if doom-lumon-brighter-comments lumon-dark5 lumon-comment))
    (doc-comments (if doom-lumon-brighter-comments lumon-fg lumon-dark5))

    (builtin      lumon-blue)
    (constants    lumon-purple)
    (functions    lumon-magenta2)
    (keywords     lumon-purple)
    (methods      lumon-magenta2)
    (operators    lumon-fg)
    (type         lumon-yellow)
    (strings      lumon-green)
    (variables    lumon-magenta2)
    (numbers      lumon-orange)

    (error        lumon-red)
    (warning      lumon-yellow)
    (success      lumon-green)

    (vc-added     lumon-green)
    (vc-deleted   lumon-red)
    (vc-modified  lumon-orange)

    ;; Modeline
    (modeline-bg              (if doom-lumon-brighter-modeline lumon-bg-highlight lumon-bg-dark))
    (modeline-fg              lumon-fg)
    (modeline-bg-alt          (if doom-lumon-brighter-modeline lumon-blue0 lumon-blue7))
    (modeline-fg-alt          lumon-fg)
    (modeline-bg-inactive     lumon-bg-dark)
    (modeline-fg-inactive     lumon-fg-gutter)
    (modeline-bg-inactive-alt lumon-bg-dark)
    (modeline-fg-inactive-alt lumon-fg-gutter)
    (modeline-pad
      (when doom-lumon-padded-modeline
        (if (integerp doom-lumon-padded-modeline)
            doom-lumon-padded-modeline
          4))))

  (
    ;; Font lock
    ((font-lock-comment-face &override)
     :foreground comments
     :slant 'italic)
    ((font-lock-doc-face &override)
     :foreground doc-comments
     :slant 'italic)
    ((font-lock-type-face &override)          :foreground lumon-yellow  :weight 'bold)
    ((font-lock-builtin-face &override)       :foreground lumon-blue)
    ((font-lock-function-name-face &override) :foreground lumon-magenta2 :weight 'bold)
    ((font-lock-keyword-face &override)       :foreground lumon-purple   :weight 'bold :slant 'italic)
    ((font-lock-constant-face &override)      :foreground lumon-purple)
    ((font-lock-variable-name-face &override) :foreground lumon-magenta2)
    ((font-lock-string-face &override)        :foreground lumon-green)
    ((font-lock-warning-face &override)       :foreground lumon-yellow)
    ((font-lock-preprocessor-face &override)  :foreground lumon-blue5)

    ;; Fringe / cursor
    (cursor :background lumon-fg)
    (fringe :background lumon-bg :foreground lumon-fg-gutter)

    ;; Highlight line
    (hl-line :background lumon-bg-highlight :extend t)

    ;; Line numbers
    ((line-number &override)
     :foreground lumon-fg-gutter
     :background lumon-bg)
    ((line-number-current-line &override)
     :foreground lumon-orange
     :background lumon-bg
     :bold t)

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
     :foreground (if doom-lumon-brighter-modeline fg lumon-blue))

    ;; Solaire mode line
    (solaire-mode-line-face
     :inherit 'mode-line
     :background modeline-bg-alt
     :box (if modeline-pad `(:line-width ,modeline-pad :color ,modeline-bg-alt)))
    (solaire-mode-line-inactive-face
     :inherit 'mode-line-inactive
     :background modeline-bg-inactive-alt
     :box (if modeline-pad `(:line-width ,modeline-pad :color ,modeline-bg-inactive-alt)))

    ;; Doom modeline
    (doom-modeline-bar               :background lumon-blue)
    (doom-modeline-evil-normal-state :foreground lumon-green)
    (doom-modeline-evil-insert-state :foreground lumon-blue)
    (doom-modeline-evil-visual-state :foreground lumon-orange)
    (doom-modeline-evil-emacs-state  :foreground lumon-purple)

    ;; Company
    (company-tooltip           :background lumon-bg-dark :foreground lumon-fg)
    (company-tooltip-selection :background lumon-bg-highlight :foreground lumon-fg :weight 'bold)
    (company-tooltip-common    :foreground lumon-blue)
    (company-scrollbar-bg      :background lumon-bg-dark)
    (company-scrollbar-fg      :background lumon-fg-gutter)

    ;; Css mode / scss-mode
    (css-proprietary-property :foreground lumon-orange)
    (css-property             :foreground lumon-yellow)
    (css-selector             :foreground lumon-blue)

    ;; Helm
    (helm-selection         :foreground lumon-black :weight 'bold :background lumon-blue)
    (helm-source-header     :foreground lumon-blue  :background lumon-bg-highlight)
    (helm-ff-directory      :foreground lumon-purple :weight 'bold)
    (helm-ff-file           :foreground lumon-fg)
    (helm-match             :foreground lumon-blue)
    (helm-grep-match        :inherit 'isearch)

    ;; Ivy
    (ivy-current-match              :background lumon-bg-highlight :distant-foreground fg)
    (ivy-minibuffer-match-face-1    :background nil                :foreground lumon-dark5)
    (ivy-minibuffer-match-face-2    :background lumon-blue         :foreground lumon-black :weight 'bold)
    (ivy-minibuffer-match-face-3    :background lumon-green        :foreground lumon-black :weight 'bold)
    (ivy-minibuffer-match-face-4    :background lumon-orange       :foreground lumon-black :weight 'bold)
    (ivy-minibuffer-match-highlight :foreground lumon-blue         :weight 'bold)
    (ivy-posframe                   :background lumon-bg-dark)

    ;; Search
    (lazy-highlight :background lumon-bg-highlight :foreground lumon-fg)
    (isearch        :foreground lumon-black        :background lumon-orange :bold t)
    (isearch-fail   :foreground lumon-red)

    ;; Markdown
    (markdown-markup-face                  :foreground lumon-blue5)
    (markdown-header-face                  :inherit 'bold :foreground lumon-blue)
    ((markdown-code-face &override)        :background lumon-bg-dark :foreground lumon-green)
    ((markdown-pre-face &override)         :background lumon-bg-dark :foreground lumon-green)
    ((markdown-inline-code-face &override) :background lumon-bg-dark :foreground lumon-green)

    ;; Widget
    (widget-field             :foreground lumon-fg :background lumon-bg-highlight)
    (widget-single-line-field :foreground lumon-fg :background lumon-bg-highlight)

    ;; Swiper
    (swiper-line-face    :background lumon-bg-highlight)
    (swiper-match-face-1 :inherit 'ivy-minibuffer-match-face-1)
    (swiper-match-face-2 :inherit 'ivy-minibuffer-match-face-2)
    (swiper-match-face-3 :inherit 'ivy-minibuffer-match-face-3)
    (swiper-match-face-4 :inherit 'ivy-minibuffer-match-face-4)

    ;; Diff
    (diff-added   :foreground lumon-green  :background lumon-blue7)
    (diff-removed :foreground lumon-red    :background lumon-blue7)
    (diff-changed :foreground lumon-orange :background lumon-blue7)

    ;; org-mode
    (org-block            :background lumon-bg-dark :extend t)
    (org-block-background :background lumon-bg-dark)
    (org-block-begin-line :foreground lumon-fg-gutter :extend t)
    (org-block-end-line   :foreground lumon-fg-gutter :extend t)
    (org-level-1          :foreground lumon-blue      :weight 'extra-bold)
    (org-level-2          :foreground lumon-purple     :weight 'bold)
    (org-level-3          :foreground lumon-magenta2   :weight 'semi-bold)
    (org-level-4          :foreground lumon-green)
    (org-level-5          :foreground lumon-blue5)
    (org-level-6          :foreground lumon-yellow)
    (org-level-7          :foreground lumon-orange)
    (org-level-8          :foreground lumon-dark5)

    ;; Magit
    (magit-branch                  :foreground lumon-blue     :weight 'bold)
    (magit-section-heading         :foreground lumon-blue     :weight 'bold)
    (magit-section-highlight       :background lumon-bg-highlight)
    (magit-diff-context-highlight  :background lumon-bg-highlight)
    (magit-diffstat-added          :foreground lumon-green)
    (magit-diffstat-removed        :foreground lumon-red)
    (magit-hash                    :foreground lumon-dark5)
    (magit-hunk-heading            :foreground lumon-orange)
    (magit-hunk-heading-highlight  :foreground lumon-orange :background lumon-bg-highlight)

    ;; Rainbow delimiters — follow the rainbow table from colors/init.lua
    (rainbow-delimiters-depth-1-face   :foreground lumon-blue)
    (rainbow-delimiters-depth-2-face   :foreground lumon-yellow)
    (rainbow-delimiters-depth-3-face   :foreground lumon-green)
    (rainbow-delimiters-depth-4-face   :foreground lumon-blue5)
    (rainbow-delimiters-depth-5-face   :foreground lumon-magenta)
    (rainbow-delimiters-depth-6-face   :foreground lumon-purple)
    (rainbow-delimiters-depth-7-face   :foreground lumon-orange)
    (rainbow-delimiters-depth-8-face   :foreground lumon-red)
    (rainbow-delimiters-unmatched-face :foreground lumon-red)))

(provide 'doom-lumon-theme)

;;; doom-lumon-theme.el ends here
