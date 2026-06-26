;;; doom-nord-theme.el --- Nord dark theme -*- lexical-binding: t; no-byte-compile: t; -*-
;;
;; Author: Sven Greb <development@svengreb.de> (Nord)
;; Ported by: joaofelipegalvao
;; Keywords: custom themes, faces
;;
;;; Commentary:
;;
;; Ported from the official Nord Emacs theme by Sven Greb.
;; Thanks https://github.com/nordtheme/emacs
;;
;;; Code:

(require 'doom-themes)

;;; Variables
(defgroup doom-nord-theme nil
  "Options for the `doom-nord' theme."
  :group 'doom-themes)

(defcustom doom-nord-brighter-comments nil
  "If non-nil, comments will use nord3+10% instead of nord3."
  :group 'doom-nord-theme
  :type 'boolean)

(defcustom doom-nord-brighter-modeline nil
  "If non-nil, the mode-line will use nord2 instead of nord1."
  :group 'doom-nord-theme
  :type 'boolean)

(defcustom doom-nord-padded-modeline doom-themes-padded-modeline
  "If non-nil, adds a 4px padding to the mode-line.
Can be an integer to determine the exact padding."
  :group 'doom-nord-theme
  :type '(choice integer boolean))

;;; Theme definition
(def-doom-theme doom-nord
  "Dark theme based on the official Nord palette by Sven Greb."

  ;; Nord Palette
  (
    ;; name         default    256        16
    ;; -- Polar Night --
    (nord0        '("#2E3440"  "#2E3440"  "black"       ))
    (nord1        '("#3B4252"  "#3B4252"  "black"       ))
    (nord2        '("#434C5E"  "#434C5E"  "brightblack" ))
    (nord3        '("#4C566A"  "#4C566A"  "brightblack" ))
    ;; -- Snow Storm --
    (nord4        '("#D8DEE9"  "#D8DEE9"  "white"       ))
    (nord5        '("#E5E9F0"  "#E5E9F0"  "white"       ))
    (nord6        '("#ECEFF4"  "#ECEFF4"  "brightwhite" ))
    ;; -- Frost --
    (nord7        '("#8FBCBB"  "#8FBCBB"  "cyan"        ))
    (nord8        '("#88C0D0"  "#88C0D0"  "brightcyan"  ))
    (nord9        '("#81A1C1"  "#81A1C1"  "blue"        ))
    (nord10       '("#5E81AC"  "#5E81AC"  "brightblue"  ))
    ;; -- Aurora --
    (nord11       '("#BF616A"  "#BF616A"  "red"         ))
    (nord12       '("#D08770"  "#D08770"  "brightred"   ))
    (nord13       '("#EBCB8B"  "#EBCB8B"  "yellow"      ))
    (nord14       '("#A3BE8C"  "#A3BE8C"  "green"       ))
    (nord15       '("#B48EAD"  "#B48EAD"  "magenta"     ))

    ;; Brightened comment colour (+10% as per official theme)
    (nord-comment '("#616E88"  "#616E88"  "brightblack" ))

    ;; -- Variables required by doom theme --
    (bg           nord0)
    (fg           nord4)
    (bg-alt       nord1)
    (fg-alt       nord5)

    (base0        nord0)
    (base1        nord1)
    (base2        nord2)
    (base3        nord3)
    (base4        nord4)
    (base5        nord5)
    (base6        nord6)
    (base7        nord7)
    (base8        nord8)

    (grey         nord3)
    (red          nord11)
    (orange       nord12)
    (green        nord14)
    (teal         nord7)
    (yellow       nord13)
    (blue         nord9)
    (dark-blue    nord10)
    (magenta      nord15)
    (violet       nord15)
    (cyan         nord8)
    (dark-cyan    nord7)

    ;; Face categories
    (highlight    nord8)
    (selection    nord2)
    (region       nord2)
    (vertical-bar nord2)

    (comments     (if doom-nord-brighter-comments nord-comment nord3))
    (doc-comments (if doom-nord-brighter-comments nord4 nord-comment))

    (builtin      nord9)
    (constants    nord9)
    (functions    nord8)
    (keywords     nord9)
    (methods      nord8)
    (operators    nord9)
    (type         nord7)
    (strings      nord14)
    (variables    nord4)
    (numbers      nord15)

    (error        nord11)
    (warning      nord13)
    (success      nord14)

    (vc-added     nord14)
    (vc-deleted   nord11)
    (vc-modified  nord13)

    ;; Modeline
    (modeline-bg              (if doom-nord-brighter-modeline nord2 nord1))
    (modeline-fg              nord8)
    (modeline-bg-alt          (if doom-nord-brighter-modeline nord3 nord2))
    (modeline-fg-alt          nord4)
    (modeline-bg-inactive     nord1)
    (modeline-fg-inactive     nord4)
    (modeline-bg-inactive-alt nord1)
    (modeline-fg-inactive-alt nord4)
    (modeline-pad
      (when doom-nord-padded-modeline
        (if (integerp doom-nord-padded-modeline)
            doom-nord-padded-modeline
          4))))

  (
    ;; Font lock
    ((font-lock-comment-face &override)
     :foreground comments
     :slant 'italic)
    ((font-lock-doc-face &override)
     :foreground doc-comments
     :slant 'italic)
    ((font-lock-type-face &override)          :foreground nord7)
    ((font-lock-builtin-face &override)       :foreground nord9)
    ((font-lock-function-name-face &override) :foreground nord8)
    ((font-lock-keyword-face &override)       :foreground nord9)
    ((font-lock-constant-face &override)      :foreground nord9)
    ((font-lock-variable-name-face &override) :foreground nord4)
    ((font-lock-string-face &override)        :foreground nord14)
    ((font-lock-warning-face &override)       :foreground nord13)

    ;; Fringe / cursor
    (cursor :background nord4)
    (fringe :background nord0 :foreground nord4)

    ;; Highlight line
    (hl-line :background nord1 :extend t)

    ;; Line numbers
    ((line-number &override)              :foreground nord3 :background nord0)
    ((line-number-current-line &override) :foreground nord4 :background nord0 :bold t)

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
     :foreground (if doom-nord-brighter-modeline fg nord8))

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
    (doom-modeline-bar               :background nord8)
    (doom-modeline-evil-normal-state :foreground nord14)
    (doom-modeline-evil-insert-state :foreground nord8)
    (doom-modeline-evil-visual-state :foreground nord7)
    (doom-modeline-evil-emacs-state  :foreground nord15)

    ;; Company
    (company-tooltip           :background nord2 :foreground nord4)
    (company-tooltip-selection :background nord3 :foreground nord4 :weight 'bold)
    (company-tooltip-common    :foreground nord8)
    (company-scrollbar-bg      :background nord1)
    (company-scrollbar-fg      :background nord2)

    ;; Css mode / scss-mode
    (css-proprietary-property :foreground nord12)
    (css-property             :foreground nord9)
    (css-selector             :foreground nord9)

    ;; Helm
    (helm-selection         :foreground nord0 :weight 'bold :background nord8)
    (helm-source-header     :foreground nord8 :background nord2)
    (helm-ff-directory      :foreground nord9 :weight 'bold)
    (helm-ff-file           :foreground nord4)
    (helm-match             :foreground nord8)
    (helm-grep-match        :inherit 'isearch)

    ;; Ivy
    (ivy-current-match              :background nord2 :distant-foreground fg)
    (ivy-minibuffer-match-face-1    :background nil   :foreground nord4)
    (ivy-minibuffer-match-face-2    :background nord7 :foreground nord0 :weight 'bold)
    (ivy-minibuffer-match-face-3    :background nord8 :foreground nord0 :weight 'bold)
    (ivy-minibuffer-match-face-4    :background nord9 :foreground nord0 :weight 'bold)
    (ivy-minibuffer-match-highlight :foreground nord8  :weight 'bold)
    (ivy-posframe                   :background nord1)

    ;; Search
    (lazy-highlight :background nord2 :foreground nord4)
    (isearch        :foreground nord0 :background nord8)
    (isearch-fail   :foreground nord11)

    ;; Markdown
    (markdown-markup-face                  :foreground nord9)
    (markdown-header-face                  :inherit 'bold :foreground nord8)
    ((markdown-code-face &override)        :background nord1 :foreground nord4)
    ((markdown-pre-face &override)         :background nord1 :foreground nord4)
    ((markdown-inline-code-face &override) :background nord1 :foreground nord7)

    ;; Widget
    (widget-field             :foreground nord4 :background nord2)
    (widget-single-line-field :foreground nord4 :background nord2)

    ;; Swiper
    (swiper-line-face    :background nord2)
    (swiper-match-face-1 :inherit 'ivy-minibuffer-match-face-1)
    (swiper-match-face-2 :inherit 'ivy-minibuffer-match-face-2)
    (swiper-match-face-3 :inherit 'ivy-minibuffer-match-face-3)
    (swiper-match-face-4 :inherit 'ivy-minibuffer-match-face-4)

    ;; Diff
    (diff-added   :foreground nord14)
    (diff-removed :foreground nord11)
    (diff-changed :foreground nord13)

    ;; org-mode
    (org-block            :background nord0 :extend t)
    (org-block-background :background nord0)
    (org-block-begin-line :foreground nord7 :extend t)
    (org-block-end-line   :foreground nord7 :extend t)
    (org-level-1          :foreground nord7 :weight 'extra-bold)
    (org-level-2          :foreground nord8 :weight 'bold)
    (org-level-3          :foreground nord9 :weight 'semi-bold)
    (org-level-4          :foreground nord10)
    (org-level-5          :foreground nord10)
    (org-level-6          :foreground nord10)
    (org-level-7          :foreground nord10)
    (org-level-8          :foreground nord10)

    ;; Magit
    (magit-branch                  :foreground nord7 :weight 'bold)
    (magit-section-heading         :foreground nord7 :weight 'bold)
    (magit-section-highlight       :background nord2)
    (magit-diff-context-highlight  :background nord2)
    (magit-diffstat-added          :foreground nord14)
    (magit-diffstat-removed        :foreground nord11)
    (magit-hash                    :foreground nord8)
    (magit-hunk-heading            :foreground nord9)
    (magit-hunk-heading-highlight  :foreground nord9 :background nord2)

    ;; Rainbow delimiters
    (rainbow-delimiters-depth-1-face :foreground nord7)
    (rainbow-delimiters-depth-2-face :foreground nord8)
    (rainbow-delimiters-depth-3-face :foreground nord9)
    (rainbow-delimiters-depth-4-face :foreground nord10)
    (rainbow-delimiters-depth-5-face :foreground nord12)
    (rainbow-delimiters-depth-6-face :foreground nord13)
    (rainbow-delimiters-depth-7-face :foreground nord14)
    (rainbow-delimiters-depth-8-face :foreground nord15)
    (rainbow-delimiters-unmatched-face :foreground nord11)))

(provide 'doom-nord-theme)

;;; doom-nord-theme.el ends here
