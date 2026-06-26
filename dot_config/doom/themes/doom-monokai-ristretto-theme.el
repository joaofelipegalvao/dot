;;; doom-monokai-ristretto-theme.el --- Monokai Pro Ristretto dark theme -*- lexical-binding: t; no-byte-compile: t; -*-
;;
;; Author: Wimer Hazenberg <monokai@wimer.io> (Monokai Pro)
;; Ported by: joaofelipegalvao
;; Keywords: custom themes, faces
;;
;;; Commentary:
;;
;; Ported from the Monokai Pro Ristretto filter (gthelding/monokai-pro.nvim).
;; A warm espresso-inspired dark theme with red/brown tones.
;; Thanks https://github.com/gthelding/monokai-pro.nvim
;;
;;; Code:

(require 'doom-themes)

;;; Variables
(defgroup doom-monokai-ristretto-theme nil
  "Options for the `doom-monokai-ristretto' theme."
  :group 'doom-themes)

(defcustom doom-monokai-ristretto-brighter-comments nil
  "If non-nil, comments will be slightly brighter (dimmed2 instead of dimmed3)."
  :group 'doom-monokai-ristretto-theme
  :type 'boolean)

(defcustom doom-monokai-ristretto-brighter-modeline nil
  "If non-nil, the mode-line will use dark1 instead of dark2."
  :group 'doom-monokai-ristretto-theme
  :type 'boolean)

(defcustom doom-monokai-ristretto-padded-modeline doom-themes-padded-modeline
  "If non-nil, adds a 4px padding to the mode-line.
Can be an integer to determine the exact padding."
  :group 'doom-monokai-ristretto-theme
  :type '(choice integer boolean))

;;; Theme definition
(def-doom-theme doom-monokai-ristretto
  "Dark theme based on the Monokai Pro Ristretto filter by Wimer Hazenberg."

  ;; Monokai Pro Ristretto Palette
  (
    ;; name           default    256        16
    ;; -- Backgrounds (Espresso scale) --
    (dark2         '("#1a1313"  "#1a1313"  "black"       ))  ;; deepest bg
    (dark1         '("#261b1b"  "#261b1b"  "black"       ))  ;; editor bg
    (background    '("#2c1f1f"  "#2c1f1f"  "black"       ))  ;; main bg
    (dark3         '("#3d2b2b"  "#3d2b2b"  "brightblack" ))  ;; selection / gutter bg
    (dark4         '("#4f3838"  "#4f3838"  "brightblack" ))  ;; lighter surfaces

    ;; -- Dimmed (warm grays) --
    (dimmed5       '("#403030"  "#403030"  "brightblack" ))
    (dimmed4       '("#5b4848"  "#5b4848"  "brightblack" ))
    (dimmed3       '("#727072"  "#727072"  "brightblack" ))  ;; comments (default)
    (dimmed2       '("#948a8b"  "#948a8b"  "brightblack" ))  ;; comments (bright)
    (dimmed1       '("#c1b5b5"  "#c1b5b5"  "white"       ))

    ;; -- Text --
    (text          '("#f2e6e6"  "#f2e6e6"  "white"       ))

    ;; -- Accents --
    (accent1       '("#fd6883"  "#fd6883"  "red"         ))  ;; red
    (accent2       '("#f38d70"  "#f38d70"  "brightred"   ))  ;; orange / terracotta
    (accent3       '("#f9cc6c"  "#f9cc6c"  "yellow"      ))  ;; yellow gold
    (accent4       '("#adda78"  "#adda78"  "green"       ))  ;; green
    (accent5       '("#85dacc"  "#85dacc"  "cyan"        ))  ;; cyan
    (accent6       '("#a8a9eb"  "#a8a9eb"  "magenta"     ))  ;; lilac / violet

    ;; -- Variables required by doom theme --
    (bg            background)
    (fg            text)
    (bg-alt        dark1)
    (fg-alt        dimmed1)

    (base0         dark2)
    (base1         dark1)
    (base2         background)
    (base3         dark3)
    (base4         dark4)
    (base5         dimmed4)
    (base6         dimmed3)
    (base7         dimmed2)
    (base8         dimmed1)

    (grey          dimmed3)
    (red           accent1)
    (orange        accent2)
    (green         accent4)
    (teal          accent5)
    (yellow        accent3)
    (blue          accent6)
    (dark-blue     accent6)
    (magenta       accent6)
    (violet        accent6)
    (cyan          accent5)
    (dark-cyan     accent5)

    ;; Face categories
    (highlight     accent5)
    (selection     dark3)
    (region        dark3)
    (vertical-bar  dark3)

    (comments      (if doom-monokai-ristretto-brighter-comments dimmed2 dimmed3))
    (doc-comments  (if doom-monokai-ristretto-brighter-comments dimmed1 dimmed2))

    (builtin       accent2)
    (constants     accent6)
    (functions     accent4)
    (keywords      accent1)
    (methods       accent4)
    (operators     accent5)
    (type          accent5)
    (strings       accent4)
    (variables     text)
    (numbers       accent3)

    (error         accent1)
    (warning       accent3)
    (success       accent4)

    (vc-added      accent4)
    (vc-deleted    accent1)
    (vc-modified   accent3)

    ;; Modeline
    (modeline-bg              (if doom-monokai-ristretto-brighter-modeline dark1 dark2))
    (modeline-fg              accent5)
    (modeline-bg-alt          (if doom-monokai-ristretto-brighter-modeline dark3 dark1))
    (modeline-fg-alt          text)
    (modeline-bg-inactive     dark1)
    (modeline-fg-inactive     dimmed3)
    (modeline-bg-inactive-alt dark1)
    (modeline-fg-inactive-alt dimmed3)
    (modeline-pad
      (when doom-monokai-ristretto-padded-modeline
        (if (integerp doom-monokai-ristretto-padded-modeline)
            doom-monokai-ristretto-padded-modeline
          4))))

  (
    ;; Font lock
    ((font-lock-comment-face &override)
     :foreground comments
     :slant 'italic)
    ((font-lock-doc-face &override)
     :foreground doc-comments
     :slant 'italic)
    ((font-lock-type-face &override)          :foreground accent5)
    ((font-lock-builtin-face &override)       :foreground accent2)
    ((font-lock-function-name-face &override) :foreground accent4)
    ((font-lock-keyword-face &override)       :foreground accent1)
    ((font-lock-constant-face &override)      :foreground accent6)
    ((font-lock-variable-name-face &override) :foreground text)
    ((font-lock-string-face &override)        :foreground accent4)
    ((font-lock-warning-face &override)       :foreground accent3)

    ;; Fringe / cursor
    (cursor :background text)
    (fringe :background background :foreground dimmed3)

    ;; Highlight line
    (hl-line :background dark1 :extend t)

    ;; Line numbers
    ((line-number &override)              :foreground dimmed4 :background background)
    ((line-number-current-line &override) :foreground dimmed1 :background background :bold t)

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
     :foreground (if doom-monokai-ristretto-brighter-modeline fg accent5))

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
    (doom-modeline-bar               :background accent5)
    (doom-modeline-evil-normal-state :foreground accent4)
    (doom-modeline-evil-insert-state :foreground accent5)
    (doom-modeline-evil-visual-state :foreground accent3)
    (doom-modeline-evil-emacs-state  :foreground accent6)

    ;; Company
    (company-tooltip           :background dark3 :foreground text)
    (company-tooltip-selection :background dark4 :foreground text :weight 'bold)
    (company-tooltip-common    :foreground accent5)
    (company-scrollbar-bg      :background dark1)
    (company-scrollbar-fg      :background dark3)

    ;; Css mode / scss-mode
    (css-proprietary-property :foreground accent2)
    (css-property             :foreground accent5)
    (css-selector             :foreground accent1)

    ;; Helm
    (helm-selection         :foreground dark2 :weight 'bold :background accent5)
    (helm-source-header     :foreground accent5 :background dark3)
    (helm-ff-directory      :foreground accent6 :weight 'bold)
    (helm-ff-file           :foreground text)
    (helm-match             :foreground accent5)
    (helm-grep-match        :inherit 'isearch)

    ;; Ivy
    (ivy-current-match              :background dark3 :distant-foreground fg)
    (ivy-minibuffer-match-face-1    :background nil   :foreground text)
    (ivy-minibuffer-match-face-2    :background accent5 :foreground dark2 :weight 'bold)
    (ivy-minibuffer-match-face-3    :background accent4 :foreground dark2 :weight 'bold)
    (ivy-minibuffer-match-face-4    :background accent3 :foreground dark2 :weight 'bold)
    (ivy-minibuffer-match-highlight :foreground accent5 :weight 'bold)
    (ivy-posframe                   :background dark1)

    ;; Search
    (lazy-highlight :background dark3 :foreground text)
    (isearch        :foreground dark2 :background accent5)
    (isearch-fail   :foreground accent1)

    ;; Markdown
    (markdown-markup-face                  :foreground accent6)
    (markdown-header-face                  :inherit 'bold :foreground accent5)
    ((markdown-code-face &override)        :background dark1 :foreground text)
    ((markdown-pre-face &override)         :background dark1 :foreground text)
    ((markdown-inline-code-face &override) :background dark1 :foreground accent5)

    ;; Widget
    (widget-field             :foreground text :background dark3)
    (widget-single-line-field :foreground text :background dark3)

    ;; Swiper
    (swiper-line-face    :background dark3)
    (swiper-match-face-1 :inherit 'ivy-minibuffer-match-face-1)
    (swiper-match-face-2 :inherit 'ivy-minibuffer-match-face-2)
    (swiper-match-face-3 :inherit 'ivy-minibuffer-match-face-3)
    (swiper-match-face-4 :inherit 'ivy-minibuffer-match-face-4)

    ;; Diff
    (diff-added   :foreground accent4)
    (diff-removed :foreground accent1)
    (diff-changed :foreground accent3)

    ;; org-mode
    (org-block            :background dark1 :extend t)
    (org-block-background :background dark1)
    (org-block-begin-line :foreground dimmed3 :extend t)
    (org-block-end-line   :foreground dimmed3 :extend t)
    (org-level-1          :foreground accent1 :weight 'extra-bold)
    (org-level-2          :foreground accent2 :weight 'bold)
    (org-level-3          :foreground accent3 :weight 'semi-bold)
    (org-level-4          :foreground accent4)
    (org-level-5          :foreground accent5)
    (org-level-6          :foreground accent6)
    (org-level-7          :foreground dimmed1)
    (org-level-8          :foreground dimmed2)

    ;; Magit
    (magit-branch                  :foreground accent5 :weight 'bold)
    (magit-section-heading         :foreground accent5 :weight 'bold)
    (magit-section-highlight       :background dark3)
    (magit-diff-context-highlight  :background dark3)
    (magit-diffstat-added          :foreground accent4)
    (magit-diffstat-removed        :foreground accent1)
    (magit-hash                    :foreground dimmed2)
    (magit-hunk-heading            :foreground accent2)
    (magit-hunk-heading-highlight  :foreground accent2 :background dark3)

    ;; Rainbow delimiters
    (rainbow-delimiters-depth-1-face   :foreground accent1)
    (rainbow-delimiters-depth-2-face   :foreground accent2)
    (rainbow-delimiters-depth-3-face   :foreground accent3)
    (rainbow-delimiters-depth-4-face   :foreground accent4)
    (rainbow-delimiters-depth-5-face   :foreground accent5)
    (rainbow-delimiters-depth-6-face   :foreground accent6)
    (rainbow-delimiters-depth-7-face   :foreground dimmed1)
    (rainbow-delimiters-depth-8-face   :foreground dimmed2)
    (rainbow-delimiters-unmatched-face :foreground accent1)))

(provide 'doom-monokai-ristretto-theme)

;;; doom-monokai-ristretto-theme.el ends here
