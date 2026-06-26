;;; doom-vantablack-theme.el --- Pure black monochrome theme -*- lexical-binding: t; no-byte-compile: t; -*-
;;
;; Author: bjarneo
;; Ported by: joaofelipegalvao
;; Keywords: custom themes, faces
;;
;;; Commentary:
;;
;; Thanks to bjarneo (https://github.com/bjarneo/vantablack.nvim)
;; Thanks to hlissner (https://github.com/doomemacs/themes)
;;
;;; Code:

(require 'doom-themes)

;;; Variables
(defgroup doom-vantablack-theme nil
  "Options for the `doom-vantablack' theme."
  :group 'doom-themes)

(defcustom doom-vantablack-brighter-comments nil
  "If non-nil, comments will use a brighter foreground (T3 instead of T2)."
  :group 'doom-vantablack-theme
  :type 'boolean)

(defcustom doom-vantablack-brighter-modeline nil
  "If non-nil, the mode-line will use a slightly lighter background."
  :group 'doom-vantablack-theme
  :type 'boolean)

(defcustom doom-vantablack-padded-modeline doom-themes-padded-modeline
  "If non-nil, adds a 4px padding to the mode-line.
Can be an integer to determine the exact padding."
  :group 'doom-vantablack-theme
  :type '(choice integer boolean))

;;; Theme definition
(def-doom-theme doom-vantablack
  "Pure black monochrome theme based on bjarneo/vantablack.nvim."

  (
    ;; name        gui         256         16
    (bg         '("#0d0d0d"  "black"     "black"      ))
    (bg-alt     '("#0d0d0d"  "black"     "black"      ))

    (base0      '("#000000"  "black"     "black"      ))
    (base1      '("#1a1a1a"  "#1a1a1a"   "brightblack"))
    (base2      '("#2a2a2a"  "#2a2a2a"   "brightblack"))
    (base3      '("#505050"  "#505050"   "brightblack"))
    (base4      '("#7a7a7a"  "#7a7a7a"   "brightblack"))
    (base5      '("#888888"  "#888888"   "brightwhite"))
    (base6      '("#9a9a9a"  "#9a9a9a"   "brightwhite"))
    (base7      '("#c8c8c8"  "#c8c8c8"   "white"      ))
    (base8      '("#e0e0e0"  "#e0e0e0"   "white"      ))

    (fg         base8)
    (fg-alt     '("#c8c8c8"  "#c8c8c8"  "white"      ))

    (grey       base4)

    (red        '("#9a9a9a"  "#9a9a9a"  "brightblack"))
    (orange     '("#a0a0a0"  "#a0a0a0"  "brightblack"))
    (green      '("#9a9a9a"  "#9a9a9a"  "brightblack"))
    (teal       '("#888888"  "#888888"  "brightblack"))
    (cyan       '("#8a8a8a"  "#8a8a8a"  "brightblack"))
    (blue       '("#b0b0b0"  "#b0b0b0"  "white"      ))
    (magenta    '("#b0b0b0"  "#b0b0b0"  "white"      ))
    (violet     '("#c8c8c8"  "#c8c8c8"  "white"      ))
    (yellow     '("#c8c8c8"  "#c8c8c8"  "white"      ))

    (dark-blue    '("#888888"  "#888888"  "brightblack"))
    (dark-cyan    '("#7a7a7a"  "#7a7a7a"  "brightblack"))
    (dark-green   '("#888888"  "#888888"  "brightblack"))
    (dark-teal    '("#7a7a7a"  "#7a7a7a"  "brightblack"))
    (dark-violet  '("#b0b0b0"  "#b0b0b0"  "white"      ))
    (dark-magenta '("#9a9a9a"  "#9a9a9a"  "brightblack"))
    (dark-red     '("#888888"  "#888888"  "brightblack"))
    (dark-orange  '("#888888"  "#888888"  "brightblack"))
    (dark-yellow  '("#b0b0b0"  "#b0b0b0"  "white"      ))

    ;; Face categories
    (highlight      fg)
    (vertical-bar   base1)
    (selection      base2)
    (region         base2)

    (comments       (if doom-vantablack-brighter-comments base5 base4))
    (doc-comments   (if doom-vantablack-brighter-comments base6 base5))

    (builtin        base8)
    (constants      base7)
    (functions      base8)
    (keywords       base7)
    (methods        base8)
    (operators      base5)
    (type           base7)
    (strings        base6)
    (variables      '("#b0b0b0"  "#b0b0b0"  "white"      ))
    (numbers        '("#a0a0a0"  "#a0a0a0"  "brightwhite"))

    (error          '("#c0c0c0"  "#c0c0c0"  "white"      ))
    (warning        base7)
    (success        base8)

    (vc-modified    '("#a0a0a0"  "#a0a0a0"  "brightwhite"))
    (vc-added       '("#a8a8a8"  "#a8a8a8"  "white"      ))
    (vc-deleted     base5)

    ;; Modeline
    (modeline-bg              (if doom-vantablack-brighter-modeline base2 base1))
    (modeline-fg              fg)
    (modeline-bg-alt          (if doom-vantablack-brighter-modeline base1 bg))
    (modeline-fg-alt          fg-alt)
    (modeline-bg-inactive     bg)
    (modeline-fg-inactive     base4)
    (modeline-bg-inactive-alt bg)
    (modeline-fg-inactive-alt base4)
    (modeline-pad
      (when doom-vantablack-padded-modeline
        (if (integerp doom-vantablack-padded-modeline)
            doom-vantablack-padded-modeline
          4))))
  (
    ;; Font lock
    ((font-lock-comment-face &override)
     :slant 'italic
     :foreground comments
     :background (if doom-vantablack-brighter-comments (doom-blend base5 bg 0.07)))
    ((font-lock-doc-face &override)
     :slant 'italic
     :foreground doc-comments)
    ((font-lock-type-face &override)          :slant 'italic)
    ((font-lock-builtin-face &override)       :slant 'italic)
    ((font-lock-function-name-face &override) :foreground functions)
    ((font-lock-keyword-face &override)       :weight 'bold)
    ((font-lock-constant-face &override)      :weight 'bold)

    ;; Fringe / cursor
    (cursor :background fg)
    (fringe :background bg)

    ;; Highlight line
    (hl-line :background base1 :extend t)

    ;; Line numbers
    ((line-number &override)              :foreground base3 :background bg-alt)
    ((line-number-current-line &override) :foreground fg    :background bg-alt :bold t)

    ;; Modeline line
    (mode-line
     :background modeline-bg
     :foreground modeline-fg
     :box (if modeline-pad `(:line-width ,modeline-pad :color ,modeline-bg)))
    (mode-line-inactive
     :background modeline-bg-inactive
     :foreground modeline-fg-inactive
     :box (if modeline-pad `(:line-width ,modeline-pad :color ,modeline-bg-inactive)))
    (mode-line-emphasis
     :foreground (if doom-vantablack-brighter-modeline fg fg-alt))

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
    (doom-modeline-bar               :background base6)
    (doom-modeline-evil-normal-state :foreground base7)
    (doom-modeline-evil-insert-state :foreground base8)
    (doom-modeline-evil-visual-state :foreground base6)
    (doom-modeline-evil-emacs-state  :foreground base5)

    ;; Company
    (company-tooltip-selection :background base3 :foreground fg)

    ;; CSS mode / scss-mode
    (css-proprietary-property :foreground base6)
    (css-property             :foreground base7)
    (css-selector             :foreground base8)

    ;; Helm
    (helm-selection :foreground bg :weight 'bold :background base6)

    ;; Ivy
    (ivy-current-match              :background base2 :distant-foreground fg)
    (ivy-minibuffer-match-face-1    :foreground base8 :background nil :weight 'bold)
    (ivy-minibuffer-match-face-2    :foreground base7 :background nil :weight 'bold)
    (ivy-minibuffer-match-face-3    :foreground base6 :background nil :weight 'bold)
    (ivy-minibuffer-match-face-4    :foreground base5 :background nil :weight 'bold)
    (ivy-minibuffer-match-highlight :foreground fg    :weight 'bold)
    (ivy-posframe                   :background modeline-bg-alt)

    ;; Search
    (lazy-highlight :background base2 :foreground fg)
    (isearch        :background base3 :foreground fg :bold t)
    (isearch-fail   :foreground base4)

    ;; Markdown
    (markdown-markup-face                  :foreground base4)
    (markdown-header-face                  :inherit 'bold :foreground base8)
    ((markdown-code-face &override)        :background base1 :foreground base6)
    ((markdown-pre-face &override)         :background base1 :foreground base6)
    ((markdown-inline-code-face &override) :background base1 :foreground base6)

    ;; Widget
    (widget-field             :foreground fg :background base2)
    (widget-single-line-field :foreground fg :background base2)

    ;; Swiper
    (swiper-line-face    :background base2)
    (swiper-match-face-1 :inherit 'ivy-minibuffer-match-face-1)
    (swiper-match-face-2 :inherit 'ivy-minibuffer-match-face-2)
    (swiper-match-face-3 :inherit 'ivy-minibuffer-match-face-3)
    (swiper-match-face-4 :inherit 'ivy-minibuffer-match-face-4)

    ;; Diff
    (diff-added   :background "#1a2a1a" :foreground base6)
    (diff-removed :background "#2a1a1a" :foreground base5)
    (diff-changed :background base1    :foreground base6)

    ;; org-mode
    (org-block            :background base1 :extend t)
    (org-block-background :background base1)
    (org-block-begin-line :background base1 :foreground comments :extend t)
    (org-block-end-line   :background base1 :foreground comments :extend t)
    (org-level-1          :foreground base8 :weight 'bold)
    (org-level-2          :foreground base7 :weight 'bold)
    (org-level-3          :foreground base6 :weight 'bold)
    (org-level-4          :foreground base5 :weight 'bold)
    (org-level-5          :foreground base8)
    (org-level-6          :foreground base7)
    (org-level-7          :foreground base6)
    (org-level-8          :foreground base5)))

(provide 'doom-vantablack-theme)

;;; doom-vantablack-theme.el ends here
