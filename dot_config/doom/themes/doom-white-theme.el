;;; doom-white-theme.el --- Pure white monochrome theme -*- lexical-binding: t; no-byte-compile: t; -*-
;;
;; Author: bjarneo
;; Ported by: joaofelipegalvao
;; Keywords: custom themes, faces
;;
;;; Commentary:
;;
;; Thanks to bjarneo (https://github.com/bjarneo/white.nvim)
;; Thanks to hlissner (https://github.com/doomemacs/themes)
;;
;;; Code:

(require 'doom-themes)

;;; Variables
(defgroup doom-white-theme nil
  "Options for the `doom-white' theme."
  :group 'doom-themes)

(defcustom doom-white-brighter-comments nil
  "If non-nil, comments will use a brighter foreground (T3 instead of T2)."
  :group 'doom-white-theme
  :type 'boolean)

(defcustom doom-white-brighter-modeline nil
  "If non-nil, the mode-line will use a slightly darker background."
  :group 'doom-white-theme
  :type 'boolean)

(defcustom doom-white-padded-modeline doom-themes-padded-modeline
  "If non-nil, adds a 4px padding to the mode-line.
Can be an integer to determine the exact padding."
  :group 'doom-white-theme
  :type '(choice integer boolean))

;;; Theme definition
(def-doom-theme doom-white
  "Pure white monochrome theme based on white.nvim."

  (
    ;; name        gui         256         16
    (bg         '("#ffffff"  "white"     "white"      ))
    (bg-alt     '("#f5f5f5"  "#f5f5f5"  "white"      ))

    (base0      '("#000000"  "black"     "black"      ))
    (base1      '("#1a1a1a"  "#1a1a1a"   "black"      ))
    (base2      '("#2e2e2e"  "#2e2e2e"   "black"      ))
    (base3      '("#3a3a3a"  "#3a3a3a"   "black"      ))
    (base4      '("#4a4a4a"  "#4a4a4a"   "brightblack"))
    (base5      '("#6e6e6e"  "#6e6e6e"   "brightblack"))
    (base6      '("#a0a0a0"  "#a0a0a0"   "brightwhite"))
    (base7      '("#c0c0c0"  "#c0c0c0"   "brightwhite"))
    (base8      '("#e8e8e8"  "#e8e8e8"   "white"      ))

    (fg         '("#000000"  "black"     "black"      ))
    (fg-alt     '("#1a1a1a"  "#1a1a1a"   "black"      ))

    (grey       base5)

    (red        '("#1a1a1a"  "#1a1a1a"  "black"      ))
    (orange     '("#3a3a3a"  "#3a3a3a"  "black"      ))
    (green      '("#3a3a3a"  "#3a3a3a"  "black"      ))
    (teal       '("#5a5a5a"  "#5a5a5a"  "brightblack"))
    (cyan       '("#3e3e3e"  "#3e3e3e"  "black"      ))
    (blue       '("#1a1a1a"  "#1a1a1a"  "black"      ))
    (magenta    '("#2e2e2e"  "#2e2e2e"  "black"      ))
    (violet     '("#2e2e2e"  "#2e2e2e"  "black"      ))
    (yellow     '("#1a1a1a"  "#1a1a1a"  "black"      ))

    (dark-blue    '("#1a1a1a"  "#1a1a1a"  "black"      ))
    (dark-cyan    '("#3a3a3a"  "#3a3a3a"  "black"      ))
    (dark-green   '("#2e2e2e"  "#2e2e2e"  "black"      ))
    (dark-teal    '("#4a4a4a"  "#4a4a4a"  "brightblack"))
    (dark-violet  '("#1a1a1a"  "#1a1a1a"  "black"      ))
    (dark-magenta '("#2e2e2e"  "#2e2e2e"  "black"      ))
    (dark-red     '("#1a1a1a"  "#1a1a1a"  "black"      ))
    (dark-orange  '("#2e2e2e"  "#2e2e2e"  "black"      ))
    (dark-yellow  '("#1a1a1a"  "#1a1a1a"  "black"      ))

    ;; Face categories
    (highlight      base3)
    (vertical-bar   base7)
    (selection      base3)
    (region         base7)

    (comments       (if doom-white-brighter-comments base4 base5))
    (doc-comments   (if doom-white-brighter-comments base3 base4))

    (builtin        fg)
    (constants      fg)
    (functions      fg)
    (keywords       fg)
    (methods        fg)
    (operators      base4)
    (type           base1)
    (strings        base3)
    (variables      base2)
    (numbers        base3)

    (error          fg)
    (warning        base1)
    (success        fg)

    (vc-modified    base3)
    (vc-added       base2)
    (vc-deleted     base4)

    ;; Modeline
    (modeline-bg              (if doom-white-brighter-modeline base7 base8))
    (modeline-fg              fg)
    (modeline-bg-alt          (if doom-white-brighter-modeline base8 bg-alt))
    (modeline-fg-alt          fg-alt)
    (modeline-bg-inactive     bg)
    (modeline-fg-inactive     base5)
    (modeline-bg-inactive-alt bg)
    (modeline-fg-inactive-alt base5)
    (modeline-pad
      (when doom-white-padded-modeline
        (if (integerp doom-white-padded-modeline)
            doom-white-padded-modeline
          4))))

  (
    ;; Font lock
    ((font-lock-comment-face &override)
     :slant 'italic
     :foreground comments
     :background (if doom-white-brighter-comments (doom-blend base4 bg 0.07)))
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
    (hl-line :background base8 :extend t)

    ;; Line numbers
    ((line-number &override)              :foreground base7 :background bg-alt)
    ((line-number-current-line &override) :foreground fg    :background bg-alt :bold t)

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
     :foreground (if doom-white-brighter-modeline fg fg-alt))

    ;; Solaire model line
    (solaire-mode-line-face
     :inherit 'mode-line
     :background modeline-bg-alt
     :box (if modeline-pad `(:line-width ,modeline-pad :color ,modeline-bg-alt)))
    (solaire-mode-line-inactive-face
     :inherit 'mode-line-inactive
     :background modeline-bg-inactive-alt
     :box (if modeline-pad `(:line-width ,modeline-pad :color ,modeline-bg-inactive-alt)))

    ;; Doom modeline
    (doom-modeline-bar               :background base4)
    (doom-modeline-evil-normal-state :foreground base2)
    (doom-modeline-evil-insert-state :foreground fg)
    (doom-modeline-evil-visual-state :foreground base3)
    (doom-modeline-evil-emacs-state  :foreground base4)

    ;; Company
    (company-tooltip-selection :background base7 :foreground fg)

    ;; CSS mode / scss-mode
    (css-proprietary-property :foreground base3)
    (css-property             :foreground base2)
    (css-selector             :foreground fg)

    ;; Helm
    (helm-selection :foreground bg :weight 'bold :background base3)

    ;; Ivy
    (ivy-current-match              :background base8 :distant-foreground fg)
    (ivy-minibuffer-match-face-1    :foreground fg    :background nil :weight 'bold)
    (ivy-minibuffer-match-face-2    :foreground base1 :background nil :weight 'bold)
    (ivy-minibuffer-match-face-3    :foreground base2 :background nil :weight 'bold)
    (ivy-minibuffer-match-face-4    :foreground base3 :background nil :weight 'bold)
    (ivy-minibuffer-match-highlight :foreground fg    :weight 'bold)
    (ivy-posframe                   :background modeline-bg-alt)

    ;; Search
    (lazy-highlight :background base8 :foreground fg)
    (isearch        :background base7 :foreground fg :bold t)
    (isearch-fail   :foreground base5)

    ;; Markdown
    (markdown-markup-face                  :foreground base6)
    (markdown-header-face                  :inherit 'bold :foreground fg)
    ((markdown-code-face &override)        :background "#f0f0f0" :foreground fg)
    ((markdown-pre-face &override)         :background "#f0f0f0" :foreground fg)
    ((markdown-inline-code-face &override) :background "#f0f0f0" :foreground fg)

    ;; Widget
    (widget-field             :foreground fg :background base8)
    (widget-single-line-field :foreground fg :background base8)

    ;; Swiper
    (swiper-line-face    :background base8)
    (swiper-match-face-1 :inherit 'ivy-minibuffer-match-face-1)
    (swiper-match-face-2 :inherit 'ivy-minibuffer-match-face-2)
    (swiper-match-face-3 :inherit 'ivy-minibuffer-match-face-3)
    (swiper-match-face-4 :inherit 'ivy-minibuffer-match-face-4)

    ;; Diff
    (diff-added   :background "#f0f5f0" :foreground base2)
    (diff-removed :background "#f5f0f0" :foreground base4)
    (diff-changed :background "#f0f0f5" :foreground base3)

    ;; org-mode
    (org-block            :background bg-alt :extend t)
    (org-block-background :background bg-alt)
    (org-block-begin-line :background bg-alt :foreground comments :extend t)
    (org-block-end-line   :background bg-alt :foreground comments :extend t)
    (org-level-1          :foreground fg    :weight 'bold)
    (org-level-2          :foreground base1 :weight 'bold)
    (org-level-3          :foreground base2 :weight 'bold)
    (org-level-4          :foreground base3 :weight 'bold)
    (org-level-5          :foreground fg)
    (org-level-6          :foreground base1)
    (org-level-7          :foreground base2)
    (org-level-8          :foreground base3)))

(provide 'doom-white-theme)

;;; doom-white-theme.el ends here
