;;; doom-hackerman-theme.el --- Hackerman dark theme -*- lexical-binding: t; no-byte-compile: t; -*-
;;
;; Author: Bjarne Øverli <https://github.com/bjarneo/hackerman.nvim>
;; Ported by: joaofelipegalvao
;; Keywords: custom themes, faces
;;
;;; Commentary:
;;
;; Ported from the Hackerman colorscheme for Neovim by Bjarne Øverli.
;; A terminal-green hacker aesthetic: near-black background, icy blue
;; foreground, and a neon-green accent palette inspired by classic
;; hacking movie terminals.
;; Thanks https://github.com/bjarneo/hackerman.nvim
;;
;;; Code:

(require 'doom-themes)

;;; Variables
(defgroup doom-hackerman-theme nil
  "Options for the `doom-hackerman' theme."
  :group 'doom-themes)

(defcustom doom-hackerman-brighter-comments nil
  "If non-nil, comments will use the muted blue-gray instead of the darker gutter tone."
  :group 'doom-hackerman-theme
  :type 'boolean)

(defcustom doom-hackerman-brighter-modeline nil
  "If non-nil, the mode-line will use lighter_bg instead of dark_bg."
  :group 'doom-hackerman-theme
  :type 'boolean)

(defcustom doom-hackerman-padded-modeline doom-themes-padded-modeline
  "If non-nil, adds a 4px padding to the mode-line.
Can be an integer to determine the exact padding."
  :group 'doom-hackerman-theme
  :type '(choice integer boolean))

;;; Theme definition
(def-doom-theme doom-hackerman
  "Dark theme based on the Hackerman colorscheme for Neovim by Bjarne Øverli."

  ;; Hackerman Palette
  ;; Source: https://github.com/bjarneo/hackerman.nvim/blob/main/colors/hackerman.lua
  (
    ;; name              default    256        16
    ;; -- Backgrounds (near-black navy) --
    (hk-darker-bg      '("#05060c"  "#05060c"  "black"       ))  ;; darker_bg
    (hk-dark-bg        '("#080911"  "#080911"  "black"       ))  ;; dark_bg
    (hk-bg             '("#0B0C16"  "#0B0C16"  "black"       ))  ;; bg / background
    (hk-lighter-bg     '("#1a1d2b"  "#1a1d2b"  "brightblack" ))  ;; lighter_bg / selection

    ;; -- Foregrounds (icy blue-white) --
    (hk-fg             '("#ddf7ff"  "#ddf7ff"  "white"       ))  ;; fg / foreground / cursor
    (hk-light-fg       '("#e5faff"  "#e5faff"  "white"       ))  ;; light_fg
    (hk-bright-fg      '("#f0fcff"  "#f0fcff"  "brightwhite" ))  ;; bright_fg
    (hk-dark-fg        '("#85E1FB"  "#85E1FB"  "cyan"        ))  ;; dark_fg (sky blue accent)
    (hk-muted          '("#6a6e95"  "#6a6e95"  "brightblack" ))  ;; muted (blue-gray for comments)

    ;; -- Neon green accent family --
    (hk-red            '("#50f872"  "#50f872"  "green"       ))  ;; red   → neon green (accent / error)
    (hk-orange         '("#85ff9d"  "#85ff9d"  "brightgreen" ))  ;; orange → bright mint
    (hk-yellow         '("#7cf8d4"  "#7cf8d4"  "cyan"        ))  ;; yellow → aqua-green
    (hk-green          '("#4fe88f"  "#4fe88f"  "green"       ))  ;; green  → emerald
    (hk-cyan           '("#7cf8f7"  "#7cf8f7"  "brightcyan"  ))  ;; cyan   → neon aqua
    (hk-blue           '("#5ec8d4"  "#5ec8d4"  "cyan"        ))  ;; blue   → teal
    (hk-purple         '("#6fd4a8"  "#6fd4a8"  "green"       ))  ;; purple → sea-green
    (hk-brown          '("#a4ffec"  "#a4ffec"  "brightcyan"  ))  ;; brown  → pale mint

    ;; -- Bright variants --
    (hk-bright-red     '("#7cff9b"  "#7cff9b"  "brightgreen" ))  ;; bright_red
    (hk-bright-yellow  '("#a4ffe6"  "#a4ffe6"  "brightcyan"  ))  ;; bright_yellow
    (hk-bright-green   '("#7cf8a8"  "#7cf8a8"  "brightgreen" ))  ;; bright_green
    (hk-bright-cyan    '("#a4faf9"  "#a4faf9"  "brightcyan"  ))  ;; bright_cyan
    (hk-bright-blue    '("#85dfe5"  "#85dfe5"  "brightcyan"  ))  ;; bright_blue
    (hk-bright-purple  '("#85e0bc"  "#85e0bc"  "brightgreen" ))  ;; bright_purple

    ;; -- Variables required by doom theme --
    (bg           hk-bg)
    (fg           hk-fg)
    (bg-alt       hk-dark-bg)
    (fg-alt       hk-dark-fg)

    (base0        hk-darker-bg)
    (base1        hk-dark-bg)
    (base2        hk-bg)
    (base3        hk-lighter-bg)
    (base4        hk-muted)
    (base5        hk-blue)
    (base6        hk-cyan)
    (base7        hk-dark-fg)
    (base8        hk-fg)

    (grey         hk-muted)
    (red          hk-red)
    (orange       hk-orange)
    (green        hk-green)
    (teal         hk-cyan)
    (yellow       hk-yellow)
    (blue         hk-blue)
    (dark-blue    hk-purple)
    (magenta      hk-purple)
    (violet       hk-bright-purple)
    (cyan         hk-cyan)
    (dark-cyan    hk-yellow)

    ;; Face categories
    (highlight    hk-red)
    (selection    hk-lighter-bg)
    (region       hk-lighter-bg)
    (vertical-bar hk-darker-bg)

    ;; hk-muted (#6a6e95) stays legible even when hl-line (#1a1d2b) is active.
    ;; Never use hk-lighter-bg here — it matches hl-line and makes comments invisible.
    (comments     (if doom-hackerman-brighter-comments hk-blue  hk-muted))
    (doc-comments (if doom-hackerman-brighter-comments hk-cyan  hk-blue))

    (builtin      hk-cyan)
    (constants    hk-brown)
    (functions    hk-green)
    (keywords     hk-red)
    (methods      hk-green)
    (operators    hk-cyan)
    (type         hk-yellow)
    (strings      hk-purple)
    (variables    hk-dark-fg)
    (numbers      hk-orange)

    (error        hk-red)
    (warning      hk-yellow)
    (success      hk-green)

    (vc-added     hk-green)
    (vc-deleted   hk-red)
    (vc-modified  hk-yellow)

    ;; Modeline
    (modeline-bg              (if doom-hackerman-brighter-modeline hk-lighter-bg hk-dark-bg))
    (modeline-fg              hk-red)
    (modeline-bg-alt          (if doom-hackerman-brighter-modeline hk-bg hk-lighter-bg))
    (modeline-fg-alt          hk-fg)
    (modeline-bg-inactive     hk-dark-bg)
    (modeline-fg-inactive     hk-muted)
    (modeline-bg-inactive-alt hk-dark-bg)
    (modeline-fg-inactive-alt hk-muted)
    (modeline-pad
      (when doom-hackerman-padded-modeline
        (if (integerp doom-hackerman-padded-modeline)
            doom-hackerman-padded-modeline
          4))))

  (
    ;; Font lock
    ((font-lock-comment-face &override)
     :foreground comments
     :slant 'italic)
    ((font-lock-doc-face &override)
     :foreground doc-comments
     :slant 'italic)
    ((font-lock-type-face &override)          :foreground hk-yellow)
    ((font-lock-builtin-face &override)       :foreground hk-cyan)
    ((font-lock-function-name-face &override) :foreground hk-green)
    ((font-lock-keyword-face &override)       :foreground hk-red)
    ((font-lock-constant-face &override)      :foreground hk-brown)
    ((font-lock-variable-name-face &override) :foreground hk-dark-fg)
    ((font-lock-string-face &override)        :foreground hk-purple)
    ((font-lock-warning-face &override)       :foreground hk-yellow)

    ;; Fringe / cursor
    (cursor :background hk-fg)
    (fringe :background hk-bg :foreground hk-muted)

    ;; Highlight line
    (hl-line :background hk-lighter-bg :extend t)

    ;; Line numbers
    ((line-number &override)              :foreground hk-muted   :background hk-bg)
    ((line-number-current-line &override) :foreground hk-red     :background hk-bg :bold t)

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
     :foreground (if doom-hackerman-brighter-modeline fg hk-cyan))

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
    (doom-modeline-bar               :background hk-red)
    (doom-modeline-evil-normal-state :foreground hk-green)
    (doom-modeline-evil-insert-state :foreground hk-cyan)
    (doom-modeline-evil-visual-state :foreground hk-yellow)
    (doom-modeline-evil-emacs-state  :foreground hk-purple)

    ;; Company
    (company-tooltip           :background hk-dark-bg    :foreground hk-fg)
    (company-tooltip-selection :background hk-lighter-bg :foreground hk-fg :weight 'bold)
    (company-tooltip-common    :foreground hk-red)
    (company-scrollbar-bg      :background hk-darker-bg)
    (company-scrollbar-fg      :background hk-dark-bg)

    ;; Css mode / scss-mode
    (css-proprietary-property :foreground hk-orange)
    (css-property             :foreground hk-cyan)
    (css-selector             :foreground hk-red)

    ;; Helm
    (helm-selection         :foreground hk-bg :weight 'bold :background hk-red)
    (helm-source-header     :foreground hk-red :background hk-lighter-bg)
    (helm-ff-directory      :foreground hk-cyan :weight 'bold)
    (helm-ff-file           :foreground hk-fg)
    (helm-match             :foreground hk-red)
    (helm-grep-match        :inherit 'isearch)

    ;; Ivy
    (ivy-current-match              :background hk-lighter-bg :distant-foreground fg)
    (ivy-minibuffer-match-face-1    :background nil           :foreground hk-fg)
    (ivy-minibuffer-match-face-2    :background hk-red        :foreground hk-bg :weight 'bold)
    (ivy-minibuffer-match-face-3    :background hk-green      :foreground hk-bg :weight 'bold)
    (ivy-minibuffer-match-face-4    :background hk-cyan       :foreground hk-bg :weight 'bold)
    (ivy-minibuffer-match-highlight :foreground hk-red        :weight 'bold)
    (ivy-posframe                   :background hk-dark-bg)

    ;; Search
    (lazy-highlight :background hk-lighter-bg :foreground hk-fg)
    (isearch        :foreground hk-bg :background hk-red :bold t)
    (isearch-fail   :foreground hk-yellow)

    ;; Markdown
    (markdown-markup-face                  :foreground hk-muted)
    (markdown-header-face                  :inherit 'bold :foreground hk-red)
    ((markdown-code-face &override)        :background hk-dark-bg :foreground hk-fg)
    ((markdown-pre-face &override)         :background hk-dark-bg :foreground hk-fg)
    ((markdown-inline-code-face &override) :background hk-dark-bg :foreground hk-green)

    ;; Widget
    (widget-field             :foreground hk-fg :background hk-lighter-bg)
    (widget-single-line-field :foreground hk-fg :background hk-lighter-bg)

    ;; Swiper
    (swiper-line-face    :background hk-lighter-bg)
    (swiper-match-face-1 :inherit 'ivy-minibuffer-match-face-1)
    (swiper-match-face-2 :inherit 'ivy-minibuffer-match-face-2)
    (swiper-match-face-3 :inherit 'ivy-minibuffer-match-face-3)
    (swiper-match-face-4 :inherit 'ivy-minibuffer-match-face-4)

    ;; Diff
    (diff-added   :foreground hk-green)
    (diff-removed :foreground hk-red)
    (diff-changed :foreground hk-yellow)

    ;; org-mode
    (org-block            :background hk-dark-bg :extend t)
    (org-block-background :background hk-dark-bg)
    (org-block-begin-line :foreground hk-muted   :extend t)
    (org-block-end-line   :foreground hk-muted   :extend t)
    (org-level-1          :foreground hk-red          :weight 'extra-bold)
    (org-level-2          :foreground hk-green         :weight 'bold)
    (org-level-3          :foreground hk-cyan          :weight 'semi-bold)
    (org-level-4          :foreground hk-yellow)
    (org-level-5          :foreground hk-purple)
    (org-level-6          :foreground hk-blue)
    (org-level-7          :foreground hk-orange)
    (org-level-8          :foreground hk-brown)

    ;; Magit
    (magit-branch                  :foreground hk-cyan    :weight 'bold)
    (magit-section-heading         :foreground hk-cyan    :weight 'bold)
    (magit-section-highlight       :background hk-lighter-bg)
    (magit-diff-context-highlight  :background hk-lighter-bg)
    (magit-diffstat-added          :foreground hk-green)
    (magit-diffstat-removed        :foreground hk-red)
    (magit-hash                    :foreground hk-muted)
    (magit-hunk-heading            :foreground hk-yellow)
    (magit-hunk-heading-highlight  :foreground hk-yellow :background hk-lighter-bg)

    ;; Rainbow delimiters
    (rainbow-delimiters-depth-1-face   :foreground hk-red)
    (rainbow-delimiters-depth-2-face   :foreground hk-green)
    (rainbow-delimiters-depth-3-face   :foreground hk-cyan)
    (rainbow-delimiters-depth-4-face   :foreground hk-yellow)
    (rainbow-delimiters-depth-5-face   :foreground hk-purple)
    (rainbow-delimiters-depth-6-face   :foreground hk-blue)
    (rainbow-delimiters-depth-7-face   :foreground hk-orange)
    (rainbow-delimiters-depth-8-face   :foreground hk-brown)
    (rainbow-delimiters-unmatched-face :foreground hk-bright-fg)))

(provide 'doom-hackerman-theme)

;;; doom-hackerman-theme.el ends here
