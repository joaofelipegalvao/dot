;;; doom-flexoki-light-theme.el --- Flexoki Light theme -*- lexical-binding: t; no-byte-compile: t; -*-
;;
;; Author: Steph Ango (Flexoki), Andrew Jose (flexoki-emacs-theme)
;; Ported by: joaofelipegalvao
;; Keywords: custom themes, faces
;;
;;; Commentary:
;;
;; Ported from the official Flexoki Light palette by Steph Ango.
;; Original Emacs theme by Andrew Jose (crmsnbleyd).
;; Thanks https://stephango.com/flexoki
;;       https://codeberg.org/crmsnbleyd/flexoki-emacs-theme
;;
;;; Code:

(require 'doom-themes)

;;; Variables
(defgroup doom-flexoki-light-theme nil
  "Options for the `doom-flexoki-light' theme."
  :group 'doom-themes)

(defcustom doom-flexoki-light-brighter-comments nil
  "If non-nil, comments will use 500-grey instead of lowlight."
  :group 'doom-flexoki-light-theme
  :type 'boolean)

(defcustom doom-flexoki-light-brighter-modeline nil
  "If non-nil, the mode-line will use 100-paper instead of 200."
  :group 'doom-flexoki-light-theme
  :type 'boolean)

(defcustom doom-flexoki-light-padded-modeline doom-themes-padded-modeline
  "If non-nil, adds a 4px padding to the mode-line.
Can be an integer to determine the exact padding."
  :group 'doom-flexoki-light-theme
  :type '(choice integer boolean))

;;; Theme definition
(def-doom-theme doom-flexoki-light
  "Light theme based on the official Flexoki palette by Steph Ango."

  ;; Flexoki Light
  (
    ;; name             default    256        16
    ;; -- Greyscale (paper → black) --
    (fl-paper        '("#fffcf0"  "#fffcf0"  "white"       ))
    (fl-100          '("#e6e4d9"  "#e6e4d9"  "white"       ))
    (fl-200          '("#cecdc3"  "#cecdc3"  "brightwhite" ))
    (fl-300          '("#b7b5ac"  "#b7b5ac"  "brightwhite" ))
    (fl-500          '("#878580"  "#878580"  "brightblack" ))
    (fl-600          '("#6f6e69"  "#6f6e69"  "brightblack" ))
    (fl-700          '("#575653"  "#575653"  "brightblack" ))
    (fl-800          '("#403e3c"  "#403e3c"  "black"       ))
    (fl-900          '("#232726"  "#232726"  "black"       ))
    (fl-black        '("#100f0f"  "#100f0f"  "black"       ))

    ;; -- Accent colours (light variant) --
    (fl-red          '("#af3029"  "#af3029"  "red"         ))
    (fl-orange       '("#bc5215"  "#bc5215"  "brightred"   ))
    (fl-yellow       '("#ad8301"  "#ad8301"  "yellow"      ))
    (fl-green        '("#66800b"  "#66800b"  "green"       ))
    (fl-cyan         '("#24837b"  "#24837b"  "cyan"        ))
    (fl-blue         '("#205ea6"  "#205ea6"  "blue"        ))
    (fl-purple       '("#5e409d"  "#5e409d"  "brightmagenta"))
    (fl-magenta      '("#a02f6f"  "#a02f6f"  "magenta"     ))

    ;; -- Variables required by doom theme --
    (bg              fl-paper)
    (fg              fl-black)
    (bg-alt          fl-100)
    (fg-alt          fl-700)

    (base0           fl-100)
    (base1           fl-200)
    (base2           fl-300)
    (base3           fl-500)
    (base4           fl-600)
    (base5           fl-700)
    (base6           fl-800)
    (base7           fl-900)
    (base8           fl-black)

    (grey            fl-500)
    (red             fl-red)
    (orange          fl-orange)
    (green           fl-green)
    (teal            fl-cyan)
    (yellow          fl-yellow)
    (blue            fl-blue)
    (dark-blue       fl-blue)
    (magenta         fl-magenta)
    (violet          fl-purple)
    (cyan            fl-cyan)
    (dark-cyan       fl-cyan)

    ;; Face categories
    (highlight       fl-orange)
    (selection       fl-200)
    (region          fl-200)
    (vertical-bar    fl-300)

    (comments (if doom-flexoki-light-brighter-comments fl-600 fl-500))
    (doc-comments    (if doom-flexoki-light-brighter-comments fl-600 fl-500))

    (builtin         fl-black)
    (constants       fl-orange)
    (functions       fl-cyan)
    (keywords        fl-magenta)
    (methods         fl-cyan)
    (operators       fl-cyan)
    (type            fl-green)
    (strings         fl-cyan)
    (variables       fl-blue)
    (numbers         fl-orange)

    (error           fl-red)
    (warning         fl-yellow)
    (success         fl-green)

    (vc-added        fl-green)
    (vc-deleted      fl-red)
    (vc-modified     fl-blue)

    ;; Modeline
    (modeline-bg              (if doom-flexoki-light-brighter-modeline fl-100 fl-200))
    (modeline-fg              fl-black)
    (modeline-bg-alt          (if doom-flexoki-light-brighter-modeline fl-200 fl-300))
    (modeline-fg-alt          fl-600)
    (modeline-bg-inactive     fl-100)
    (modeline-fg-inactive     fl-500)
    (modeline-bg-inactive-alt fl-100)
    (modeline-fg-inactive-alt fl-500)
    (modeline-pad
      (when doom-flexoki-light-padded-modeline
        (if (integerp doom-flexoki-light-padded-modeline)
            doom-flexoki-light-padded-modeline
          4))))

  (
    ;; Font lock
    ((font-lock-comment-face &override)
     :slant 'italic
     :foreground comments
     :background (if doom-flexoki-light-brighter-comments (doom-blend teal bg 0.05)))
    ((font-lock-doc-face &override)
     :slant 'italic
     :foreground doc-comments)
    ((font-lock-type-face &override)          :weight 'bold)
    ((font-lock-builtin-face &override)       :weight 'bold)
    ((font-lock-function-name-face &override) :foreground functions :weight 'bold)
    ((font-lock-keyword-face &override)       :weight 'bold)
    ((font-lock-constant-face &override)      :weight 'light :foreground constants)

    ;; Fringe / cursor
    (cursor :background fl-black)
    (fringe :background bg-alt)

    ;; Highlight line
    (hl-line :background fl-300 :extend t)

    ;; Line numbers
    ((line-number &override)              :foreground fl-200 :background bg-alt)
    ((line-number-current-line &override) :foreground fl-magenta :background bg-alt :bold t)

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
     :foreground (if doom-flexoki-light-brighter-modeline fg fl-purple))

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
    (doom-modeline-bar               :background fl-purple)
    (doom-modeline-evil-normal-state :foreground fl-green)
    (doom-modeline-evil-insert-state :foreground fl-blue)
    (doom-modeline-evil-visual-state :foreground fl-yellow)
    (doom-modeline-evil-emacs-state  :foreground fl-purple)

    ;; Company
    (company-tooltip-selection :background fl-200 :foreground fl-black)

    ;; Css mode / scss-mode
    (css-proprietary-property :foreground fl-orange)
    (css-property             :foreground fl-green)
    (css-selector             :foreground fl-blue)

    ;; Helm
    (helm-selection :foreground bg :weight 'bold :background fl-blue)

    ;; Ivy
    (ivy-current-match              :background fl-200 :distant-foreground fg)
    (ivy-minibuffer-match-face-1    :foreground fl-blue    :background nil :weight 'bold)
    (ivy-minibuffer-match-face-2    :foreground fl-purple  :background nil :weight 'bold)
    (ivy-minibuffer-match-face-3    :foreground fl-yellow  :background nil :weight 'bold)
    (ivy-minibuffer-match-face-4    :foreground fl-orange  :background nil :weight 'bold)
    (ivy-minibuffer-match-highlight :foreground fl-magenta :weight 'bold)
    (ivy-posframe                   :background modeline-bg-alt)

    ;; Search
    (lazy-highlight :background fl-200 :foreground fg)
    (isearch        :background fl-yellow :foreground bg :bold t)
    (isearch-fail   :foreground fl-500)

    ;; Markdown
    (markdown-markup-face                  :foreground fl-300)
    (markdown-header-face                  :inherit 'bold :foreground fl-blue)
    ((markdown-code-face &override)        :background fl-100 :foreground fl-black)
    ((markdown-pre-face &override)         :background fl-100 :foreground fl-black)
    ((markdown-inline-code-face &override) :background fl-100 :foreground fl-orange)

    ;; Widget
    (widget-field             :foreground fg :background fl-200)
    (widget-single-line-field :foreground fg :background fl-200)

    ;; Swiper
    (swiper-line-face    :background fl-200)
    (swiper-match-face-1 :inherit 'ivy-minibuffer-match-face-1)
    (swiper-match-face-2 :inherit 'ivy-minibuffer-match-face-2)
    (swiper-match-face-3 :inherit 'ivy-minibuffer-match-face-3)
    (swiper-match-face-4 :inherit 'ivy-minibuffer-match-face-4)

    ;; Diff
    (diff-added   :background "#f0f4e4" :foreground fl-green)
    (diff-removed :background "#f4e4e4" :foreground fl-red)
    (diff-changed :background "#f4f0e4" :foreground fl-blue)

    ;; org-mode
    (org-block            :background (doom-blend fl-blue bg 0.04) :extend t)
    (org-block-background :background (doom-blend fl-blue bg 0.04))
    (org-block-begin-line :background (doom-blend fl-blue bg 0.08) :foreground comments :extend t)
    (org-block-end-line   :background (doom-blend fl-blue bg 0.08) :foreground comments :extend t)
    (org-level-1          :foreground fl-blue    :weight 'bold)
    (org-level-2          :foreground fl-purple  :weight 'bold)
    (org-level-3          :foreground fl-orange  :weight 'bold)
    (org-level-4          :foreground fl-magenta :weight 'bold)
    (org-level-5          :foreground fl-cyan)
    (org-level-6          :foreground fl-green)
    (org-level-7          :foreground fl-yellow)
    (org-level-8          :foreground fl-red)))

(provide 'doom-flexoki-light-theme)

;;; doom-flexoki-light-theme.el ends here
