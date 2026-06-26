;;; doom-ethereal-theme.el --- Ethereal dark theme -*- lexical-binding: t; no-byte-compile: t; -*-
;;
;; Author: Bjarne Øverli <https://github.com/bjarneo/ethereal.nvim>
;; Ported by: joaofelipegalvao
;; Keywords: custom themes, faces
;;
;;; Commentary:
;;
;; Ported from the Ethereal colorscheme for Neovim by Bjarne Øverli.
;; A deep midnight-blue dark theme with warm peachy foreground and soft accents.
;; Thanks https://github.com/bjarneo/ethereal.nvim
;;
;;; Code:

(require 'doom-themes)

;;; Variables
(defgroup doom-ethereal-theme nil
  "Options for the `doom-ethereal' theme."
  :group 'doom-themes)

(defcustom doom-ethereal-brighter-comments nil
  "If non-nil, comments will use a lighter blue-gray instead of the default muted one."
  :group 'doom-ethereal-theme
  :type 'boolean)

(defcustom doom-ethereal-brighter-modeline nil
  "If non-nil, the mode-line will use a slightly lighter background."
  :group 'doom-ethereal-theme
  :type 'boolean)

(defcustom doom-ethereal-padded-modeline doom-themes-padded-modeline
  "If non-nil, adds a 4px padding to the mode-line.
Can be an integer to determine the exact padding."
  :group 'doom-ethereal-theme
  :type '(choice integer boolean))

;;; Theme definition
(def-doom-theme doom-ethereal
  "Dark theme based on the Ethereal colorscheme for Neovim by Bjarne Øverli."

  ;; Ethereal Palette
  ;; Source: https://github.com/bjarneo/ethereal.nvim/blob/main/lua/ethereal/colors/init.lua
  (
    ;; name           default    256        16
    ;; -- Backgrounds (deep midnight navy) --
    (eth-bg          '("#060B1E"  "#060B1E"  "black"       ))  ;; bg / bg_dark / bg_dark1
    (eth-bg-popup    '("#060B1E"  "#060B1E"  "black"       ))  ;; bg_popup / bg_statusline
    (eth-black       '("#0a0f22"  "#0a0f22"  "black"       ))  ;; blended black (bg*0.8)
    (eth-bg-visual   '("#0d1833"  "#0d1833"  "brightblack" ))  ;; bg_visual (blend blue0 0.4)
    (eth-bg-search   '("#264f78"  "#264f78"  "brightblack" ))  ;; bg_search / blue0
    (eth-bg-subtle   '("#131828"  "#131828"  "brightblack" ))  ;; subtle_bg (blend fg 0.10)
    (eth-cursorline  '("#1c2035"  "#1c2035"  "brightblack" ))  ;; cursorline_bg (blend fg 0.20)

    ;; -- Blues --
    (eth-blue        '("#7d82d9"  "#7d82d9"  "blue"        ))  ;; blue / blue1 / blue2
    (eth-blue0       '("#264f78"  "#264f78"  "brightblue"  ))  ;; blue0 (search bg)
    (eth-blue5       '("#a3bfd1"  "#a3bfd1"  "cyan"        ))  ;; blue5 / cyan / teal
    (eth-blue6       '("#b4f9f8"  "#b4f9f8"  "brightcyan"  ))  ;; blue6 (regexp strings)
    (eth-blue7       '("#1e3a5f"  "#1e3a5f"  "brightblack" ))  ;; blue7 (diff change)

    ;; -- Foreground --
    (eth-fg          '("#ffcead"  "#ffcead"  "white"       ))  ;; fg (peach-cream)
    (eth-fg-dark     '("#F99957"  "#F99957"  "brightwhite" ))  ;; fg_dark / dark5 (warm amber)
    (eth-fg-gutter   '("#6d7db6"  "#6d7db6"  "brightblack" ))  ;; fg_gutter / comment / dark3 / terminal_black

    ;; -- Accents --
    (eth-green       '("#92a593"  "#92a593"  "green"       ))  ;; green / green1 / green2
    (eth-yellow      '("#E9BB4F"  "#E9BB4F"  "yellow"      ))  ;; yellow
    (eth-orange      '("#faaaa9"  "#faaaa9"  "brightred"   ))  ;; orange (soft coral)
    (eth-red         '("#ED5B5A"  "#ED5B5A"  "red"         ))  ;; red / red1
    (eth-magenta     '("#c89dc1"  "#c89dc1"  "magenta"     ))  ;; magenta / purple
    (eth-magenta2    '("#8e93de"  "#8e93de"  "brightblue"  ))  ;; magenta2 (identifier / function / variable)
    (eth-special     '("#f7dc9c"  "#f7dc9c"  "brightyellow"))  ;; special_char

    ;; -- Variables required by doom theme --
    (bg              eth-bg)
    (fg              eth-fg)
    (bg-alt          eth-black)
    (fg-alt          eth-fg-dark)

    (base0           eth-black)
    (base1           eth-bg)
    (base2           eth-bg-subtle)
    (base3           eth-cursorline)
    (base4           eth-bg-visual)
    (base5           eth-fg-gutter)
    (base6           eth-blue)
    (base7           eth-blue5)
    (base8           eth-fg)

    (grey            eth-fg-gutter)
    (red             eth-red)
    (orange          eth-orange)
    (green           eth-green)
    (teal            eth-blue5)
    (yellow          eth-yellow)
    (blue            eth-blue)
    (dark-blue       eth-blue0)
    (magenta         eth-magenta)
    (violet          eth-magenta2)
    (cyan            eth-blue5)
    (dark-cyan       eth-blue7)

    ;; Face categories
    (highlight       eth-blue)
    (selection       eth-bg-visual)
    (region          eth-bg-visual)
    (vertical-bar    eth-black)

    (comments        (if doom-ethereal-brighter-comments eth-blue eth-fg-gutter))
    (doc-comments    (if doom-ethereal-brighter-comments eth-blue5 eth-fg-gutter))

    (builtin         eth-blue5)
    (constants       eth-magenta)
    (functions       eth-magenta2)
    (keywords        eth-magenta)
    (methods         eth-magenta2)
    (operators       eth-blue5)
    (type            eth-yellow)
    (strings         eth-green)
    (variables       eth-magenta2)
    (numbers         eth-orange)

    (error           eth-red)
    (warning         eth-yellow)
    (success         eth-green)

    (vc-added        eth-green)
    (vc-deleted      eth-red)
    (vc-modified     eth-orange)

    ;; Modeline
    (modeline-bg              (if doom-ethereal-brighter-modeline eth-bg-subtle eth-black))
    (modeline-fg              eth-blue5)
    (modeline-bg-alt          (if doom-ethereal-brighter-modeline eth-cursorline eth-bg-subtle))
    (modeline-fg-alt          eth-fg)
    (modeline-bg-inactive     eth-black)
    (modeline-fg-inactive     eth-fg-gutter)
    (modeline-bg-inactive-alt eth-black)
    (modeline-fg-inactive-alt eth-fg-gutter)
    (modeline-pad
      (when doom-ethereal-padded-modeline
        (if (integerp doom-ethereal-padded-modeline)
            doom-ethereal-padded-modeline
          4))))

  (
    ;; Font lock
    ((font-lock-comment-face &override)
     :foreground comments
     :slant 'italic)
    ((font-lock-doc-face &override)
     :foreground doc-comments
     :slant 'italic)
    ((font-lock-type-face &override)          :foreground eth-yellow)
    ((font-lock-builtin-face &override)       :foreground eth-blue5)
    ((font-lock-function-name-face &override) :foreground eth-magenta2 :weight 'bold)
    ((font-lock-keyword-face &override)       :foreground eth-magenta   :weight 'bold)
    ((font-lock-constant-face &override)      :foreground eth-magenta)
    ((font-lock-variable-name-face &override) :foreground eth-magenta2)
    ((font-lock-string-face &override)        :foreground eth-green)
    ((font-lock-warning-face &override)       :foreground eth-yellow)

    ;; Fringe / cursor
    (cursor :background eth-fg)
    (fringe :background eth-bg :foreground eth-fg-gutter)

    ;; Highlight line
    (hl-line :background eth-cursorline :extend t)

    ;; Line numbers
    ((line-number &override)              :foreground eth-fg-gutter :background eth-bg)
    ((line-number-current-line &override) :foreground eth-orange    :background eth-bg :bold t)

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
     :foreground (if doom-ethereal-brighter-modeline fg eth-blue))

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
    (doom-modeline-bar               :background eth-blue)
    (doom-modeline-evil-normal-state :foreground eth-green)
    (doom-modeline-evil-insert-state :foreground eth-blue5)
    (doom-modeline-evil-visual-state :foreground eth-yellow)
    (doom-modeline-evil-emacs-state  :foreground eth-magenta)

    ;; Company
    (company-tooltip           :background eth-bg-popup :foreground eth-fg)
    (company-tooltip-selection :background eth-bg-visual :foreground eth-fg :weight 'bold)
    (company-tooltip-common    :foreground eth-blue)
    (company-scrollbar-bg      :background eth-black)
    (company-scrollbar-fg      :background eth-bg-subtle)

    ;; Css mode / scss-mode
    (css-proprietary-property :foreground eth-orange)
    (css-property             :foreground eth-blue5)
    (css-selector             :foreground eth-magenta)

    ;; Helm
    (helm-selection         :foreground eth-black :weight 'bold :background eth-blue)
    (helm-source-header     :foreground eth-blue :background eth-bg-visual)
    (helm-ff-directory      :foreground eth-magenta2 :weight 'bold)
    (helm-ff-file           :foreground eth-fg)
    (helm-match             :foreground eth-blue)
    (helm-grep-match        :inherit 'isearch)

    ;; Ivy
    (ivy-current-match              :background eth-bg-visual :distant-foreground fg)
    (ivy-minibuffer-match-face-1    :background nil           :foreground eth-fg)
    (ivy-minibuffer-match-face-2    :background eth-blue      :foreground eth-black :weight 'bold)
    (ivy-minibuffer-match-face-3    :background eth-blue5     :foreground eth-black :weight 'bold)
    (ivy-minibuffer-match-face-4    :background eth-magenta   :foreground eth-black :weight 'bold)
    (ivy-minibuffer-match-highlight :foreground eth-blue      :weight 'bold)
    (ivy-posframe                   :background eth-black)

    ;; Search
    (lazy-highlight :background eth-bg-visual :foreground eth-fg)
    (isearch        :foreground eth-black :background eth-orange :bold t)
    (isearch-fail   :foreground eth-red)

    ;; Markdown
    (markdown-markup-face                  :foreground eth-blue5)
    (markdown-header-face                  :inherit 'bold :foreground eth-blue)
    ((markdown-code-face &override)        :background eth-bg-subtle :foreground eth-fg)
    ((markdown-pre-face &override)         :background eth-bg-subtle :foreground eth-fg)
    ((markdown-inline-code-face &override) :background eth-bg-subtle :foreground eth-blue)

    ;; Widget
    (widget-field             :foreground eth-fg :background eth-bg-visual)
    (widget-single-line-field :foreground eth-fg :background eth-bg-visual)

    ;; Swiper
    (swiper-line-face    :background eth-bg-visual)
    (swiper-match-face-1 :inherit 'ivy-minibuffer-match-face-1)
    (swiper-match-face-2 :inherit 'ivy-minibuffer-match-face-2)
    (swiper-match-face-3 :inherit 'ivy-minibuffer-match-face-3)
    (swiper-match-face-4 :inherit 'ivy-minibuffer-match-face-4)

    ;; Diff
    (diff-added   :foreground eth-green)
    (diff-removed :foreground eth-red)
    (diff-changed :foreground eth-orange)

    ;; org-mode
    (org-block            :background eth-black :extend t)
    (org-block-background :background eth-black)
    (org-block-begin-line :foreground eth-fg-gutter :extend t)
    (org-block-end-line   :foreground eth-fg-gutter :extend t)
    (org-level-1          :foreground eth-red      :weight 'extra-bold)
    (org-level-2          :foreground eth-orange   :weight 'bold)
    (org-level-3          :foreground eth-yellow   :weight 'semi-bold)
    (org-level-4          :foreground eth-green)
    (org-level-5          :foreground eth-blue)
    (org-level-6          :foreground eth-magenta)
    (org-level-7          :foreground eth-blue5)
    (org-level-8          :foreground eth-magenta2)

    ;; Magit
    (magit-branch                  :foreground eth-blue5   :weight 'bold)
    (magit-section-heading         :foreground eth-blue5   :weight 'bold)
    (magit-section-highlight       :background eth-bg-visual)
    (magit-diff-context-highlight  :background eth-bg-visual)
    (magit-diffstat-added          :foreground eth-green)
    (magit-diffstat-removed        :foreground eth-red)
    (magit-hash                    :foreground eth-fg-gutter)
    (magit-hunk-heading            :foreground eth-orange)
    (magit-hunk-heading-highlight  :foreground eth-orange :background eth-bg-visual)

    ;; Rainbow delimiters
    (rainbow-delimiters-depth-1-face   :foreground eth-blue)
    (rainbow-delimiters-depth-2-face   :foreground eth-yellow)
    (rainbow-delimiters-depth-3-face   :foreground eth-green)
    (rainbow-delimiters-depth-4-face   :foreground eth-blue5)
    (rainbow-delimiters-depth-5-face   :foreground eth-magenta)
    (rainbow-delimiters-depth-6-face   :foreground eth-magenta2)
    (rainbow-delimiters-depth-7-face   :foreground eth-orange)
    (rainbow-delimiters-depth-8-face   :foreground eth-red)
    (rainbow-delimiters-unmatched-face :foreground eth-red)))

(provide 'doom-ethereal-theme)

;;; doom-ethereal-theme.el ends here
