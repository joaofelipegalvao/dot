;;; doom-everforest-soft-theme.el --- Everforest Soft dark theme -*- lexical-binding: t; no-byte-compile: t; -*-
;;
;; Author: sainnhe (Everforest), neanias (Lua port)
;; Ported by: joaofelipegalvao
;; Keywords: custom themes, faces
;;
;;; Commentary:
;;
;; Ported from the official Everforest soft dark palette.
;; Original Neovim port by neanias.
;; Thanks https://github.com/sainnhe/everforest
;;       https://github.com/neanias/everforest-nvim
;;
;;; Code:

(require 'doom-themes)

;;; Variables
(defgroup doom-everforest-soft-theme nil
  "Options for the `doom-everforest-soft' theme."
  :group 'doom-themes)

(defcustom doom-everforest-soft-brighter-comments nil
  "If non-nil, comments will use grey1 instead of grey0."
  :group 'doom-everforest-soft-theme
  :type 'boolean)

(defcustom doom-everforest-soft-brighter-modeline nil
  "If non-nil, the mode-line will use bg1 instead of bg_dim."
  :group 'doom-everforest-soft-theme
  :type 'boolean)

(defcustom doom-everforest-soft-padded-modeline doom-themes-padded-modeline
  "If non-nil, adds a 4px padding to the mode-line.
Can be an integer to determine the exact padding."
  :group 'doom-everforest-soft-theme
  :type '(choice integer boolean))

;;; Theme definition
(def-doom-theme doom-everforest-soft
  "Dark theme based on the Everforest soft palette by sainnhe / neanias."

  ;; Everforest Soft Dark
  (
    ;; name              default    256        16
    ;; -- Backgrounds (soft dark) --
    (ef-bg-dim        '("#1e2326"  "#1e2326"  "black"       ))
    (ef-bg0           '("#272e33"  "#272e33"  "black"       ))
    (ef-bg1           '("#2e383c"  "#2e383c"  "black"       ))
    (ef-bg2           '("#374145"  "#374145"  "brightblack" ))
    (ef-bg3           '("#414b50"  "#414b50"  "brightblack" ))
    (ef-bg4           '("#495156"  "#495156"  "brightblack" ))
    (ef-bg5           '("#4f5b58"  "#4f5b58"  "brightblack" ))
    (ef-bg-visual     '("#4c3743"  "#4c3743"  "brightblack" ))
    (ef-bg-red        '("#493b40"  "#493b40"  "brightblack" ))
    (ef-bg-green      '("#3c4841"  "#3c4841"  "brightblack" ))
    (ef-bg-blue       '("#384b55"  "#384b55"  "brightblack" ))
    (ef-bg-yellow     '("#45443c"  "#45443c"  "brightblack" ))
    (ef-bg-purple     '("#463f48"  "#463f48"  "brightblack" ))

    ;; -- Foreground colours (shared across soft/medium/hard) --
    (ef-fg            '("#d3c6aa"  "#d3c6aa"  "white"       ))
    (ef-red           '("#e67e80"  "#e67e80"  "red"         ))
    (ef-orange        '("#e69875"  "#e69875"  "brightred"   ))
    (ef-yellow        '("#dbbc7f"  "#dbbc7f"  "yellow"      ))
    (ef-green         '("#a7c080"  "#a7c080"  "green"       ))
    (ef-aqua          '("#83c092"  "#83c092"  "cyan"        ))
    (ef-blue          '("#7fbbb3"  "#7fbbb3"  "blue"        ))
    (ef-purple        '("#d699b6"  "#d699b6"  "magenta"     ))
    (ef-grey0         '("#7a8478"  "#7a8478"  "brightblack" ))
    (ef-grey1         '("#859289"  "#859289"  "brightblack" ))
    (ef-grey2         '("#9da9a0"  "#9da9a0"  "brightblack" ))
    (ef-statusline1   '("#a7c080"  "#a7c080"  "green"       ))
    (ef-statusline2   '("#d3c6aa"  "#d3c6aa"  "white"       ))
    (ef-statusline3   '("#e67e80"  "#e67e80"  "red"         ))

    ;; -- Variables required by doom theme --
    (bg               ef-bg0)
    (fg               ef-fg)
    (bg-alt           ef-bg-dim)
    (fg-alt           ef-grey2)

    (base0            ef-bg-dim)
    (base1            ef-bg0)
    (base2            ef-bg1)
    (base3            ef-bg2)
    (base4            ef-bg3)
    (base5            ef-bg4)
    (base6            ef-bg5)
    (base7            ef-grey0)
    (base8            ef-grey1)

    (grey             ef-grey0)
    (red              ef-red)
    (orange           ef-orange)
    (green            ef-green)
    (teal             ef-aqua)
    (yellow           ef-yellow)
    (blue             ef-blue)
    (dark-blue        ef-blue)
    (magenta          ef-purple)
    (violet           ef-purple)
    (cyan             ef-aqua)
    (dark-cyan        ef-aqua)

    ;; Face categories
    (highlight        ef-green)
    (selection        ef-bg-visual)
    (region           ef-bg-visual)
    (vertical-bar     ef-bg2)

    (comments         (if doom-everforest-soft-brighter-comments ef-grey1 ef-grey0))
    (doc-comments     (if doom-everforest-soft-brighter-comments ef-grey2 ef-grey1))

    (builtin          ef-red)
    (constants        ef-orange)
    (functions        ef-green)
    (keywords         ef-red)
    (methods          ef-green)
    (operators        ef-aqua)
    (type             ef-yellow)
    (strings          ef-green)
    (variables        ef-fg)
    (numbers          ef-orange)

    (error            ef-red)
    (warning          ef-yellow)
    (success          ef-green)

    (vc-added         ef-green)
    (vc-deleted       ef-red)
    (vc-modified      ef-blue)

    ;; Modeline
    (modeline-bg              (if doom-everforest-soft-brighter-modeline ef-bg1 ef-bg-dim))
    (modeline-fg              ef-statusline2)
    (modeline-bg-alt          (if doom-everforest-soft-brighter-modeline ef-bg2 ef-bg1))
    (modeline-fg-alt          ef-grey1)
    (modeline-bg-inactive     ef-bg-dim)
    (modeline-fg-inactive     ef-grey0)
    (modeline-bg-inactive-alt ef-bg-dim)
    (modeline-fg-inactive-alt ef-grey0)
    (modeline-pad
      (when doom-everforest-soft-padded-modeline
        (if (integerp doom-everforest-soft-padded-modeline)
            doom-everforest-soft-padded-modeline
          4))))

  (
    ;; Font lock
    ((font-lock-comment-face &override)
     :slant 'italic
     :foreground comments
     :background (if doom-everforest-soft-brighter-comments (doom-blend teal bg 0.07)))
    ((font-lock-doc-face &override)
     :slant 'italic
     :foreground doc-comments)
    ((font-lock-type-face &override)          :slant 'italic)
    ((font-lock-builtin-face &override)       :slant 'italic)
    ((font-lock-function-name-face &override) :foreground functions)
    ((font-lock-keyword-face &override)       :weight 'bold)
    ((font-lock-constant-face &override)      :weight 'bold)

    ;; Fringe / cursor
    (cursor :background ef-fg)
    (fringe :background bg-alt)

    ;; Highlight line
    (hl-line :background ef-bg1 :extend t)

    ;; Line numbers
    ((line-number &override)              :foreground ef-bg4 :background bg-alt)
    ((line-number-current-line &override) :foreground ef-yellow :background bg-alt :bold t)

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
     :foreground (if doom-everforest-soft-brighter-modeline fg ef-statusline1))

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
    (doom-modeline-bar               :background ef-statusline1)
    (doom-modeline-evil-normal-state :foreground ef-green)
    (doom-modeline-evil-insert-state :foreground ef-blue)
    (doom-modeline-evil-visual-state :foreground ef-yellow)
    (doom-modeline-evil-emacs-state  :foreground ef-purple)

    ;; Company
    (company-tooltip-selection :background ef-bg2 :foreground ef-fg)

    ;; Css mode / scss-mode
    (css-proprietary-property :foreground ef-orange)
    (css-property             :foreground ef-green)
    (css-selector             :foreground ef-blue)

    ;; Helm
    (helm-selection :foreground bg :weight 'bold :background ef-blue)

    ;; Ivy
    (ivy-current-match              :background ef-bg2 :distant-foreground fg)
    (ivy-minibuffer-match-face-1    :foreground ef-blue   :background nil :weight 'bold)
    (ivy-minibuffer-match-face-2    :foreground ef-purple :background nil :weight 'bold)
    (ivy-minibuffer-match-face-3    :foreground ef-yellow :background nil :weight 'bold)
    (ivy-minibuffer-match-face-4    :foreground ef-orange :background nil :weight 'bold)
    (ivy-minibuffer-match-highlight :foreground ef-aqua   :weight 'bold)
    (ivy-posframe                   :background modeline-bg-alt)

    ;; Search
    (lazy-highlight :background ef-bg2 :foreground fg)
    (isearch        :background ef-yellow :foreground ef-bg0 :bold t)
    (isearch-fail   :foreground ef-grey0)

    ;; Markdown
    (markdown-markup-face                  :foreground ef-grey0)
    (markdown-header-face                  :inherit 'bold :foreground ef-green)
    ((markdown-code-face &override)        :background ef-bg1 :foreground ef-fg)
    ((markdown-pre-face &override)         :background ef-bg1 :foreground ef-fg)
    ((markdown-inline-code-face &override) :background ef-bg1 :foreground ef-aqua)

    ;; Widget
    (widget-field             :foreground fg :background ef-bg2)
    (widget-single-line-field :foreground fg :background ef-bg2)

    ;; Swiper
    (swiper-line-face    :background ef-bg2)
    (swiper-match-face-1 :inherit 'ivy-minibuffer-match-face-1)
    (swiper-match-face-2 :inherit 'ivy-minibuffer-match-face-2)
    (swiper-match-face-3 :inherit 'ivy-minibuffer-match-face-3)
    (swiper-match-face-4 :inherit 'ivy-minibuffer-match-face-4)

    ;; Diff — usando os bg_red/bg_green/bg_blue da paleta oficial
    (diff-added   :background ef-bg-green  :foreground ef-green)
    (diff-removed :background ef-bg-red    :foreground ef-red)
    (diff-changed :background ef-bg-blue   :foreground ef-blue)

    ;; org-mode
    (org-block            :background (doom-blend ef-green bg 0.04) :extend t)
    (org-block-background :background (doom-blend ef-green bg 0.04))
    (org-block-begin-line :background (doom-blend ef-green bg 0.08) :foreground comments :extend t)
    (org-block-end-line   :background (doom-blend ef-green bg 0.08) :foreground comments :extend t)
    (org-level-1          :foreground ef-green  :weight 'bold)
    (org-level-2          :foreground ef-blue   :weight 'bold)
    (org-level-3          :foreground ef-aqua   :weight 'bold)
    (org-level-4          :foreground ef-yellow :weight 'bold)
    (org-level-5          :foreground ef-orange)
    (org-level-6          :foreground ef-purple)
    (org-level-7          :foreground ef-red)
    (org-level-8          :foreground ef-grey2)))

(provide 'doom-everforest-soft-theme)

;;; doom-everforest-soft-theme.el ends here
