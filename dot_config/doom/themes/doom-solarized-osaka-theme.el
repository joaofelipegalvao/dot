;;; doom-solarized-osaka-theme.el --- Solarized Osaka dark theme -*- lexical-binding: t; no-byte-compile: t; -*-
;;
;; Author: craftzdog
;; Ported by: joaofelipegalvao
;; Keywords: custom themes, faces
;;
;;; Commentary:
;;
;; Thanks to craftzdog (https://github.com/craftzdog/solarized-osaka.nvim)
;; Thanks to hlissner (https://github.com/doomemacs/themes)
;;
;;; Code:

(require 'doom-themes)

;;; Variables
(defgroup doom-solarized-osaka-theme nil
  "Options for the `doom-solarized-osaka' theme."
  :group 'doom-themes)

(defcustom doom-solarized-osaka-brighter-comments nil
  "If non-nil, comments will use a brighter foreground (base00 instead of base01)."
  :group 'doom-solarized-osaka-theme
  :type 'boolean)

(defcustom doom-solarized-osaka-brighter-modeline nil
  "If non-nil, the mode-line will use a slightly lighter background."
  :group 'doom-solarized-osaka-theme
  :type 'boolean)

(defcustom doom-solarized-osaka-padded-modeline doom-themes-padded-modeline
  "If non-nil, adds a 4px padding to the mode-line.
Can be an integer to determine the exact padding."
  :group 'doom-solarized-osaka-theme
  :type '(choice integer boolean))

;;; Theme definition
(def-doom-theme doom-solarized-osaka
  "Dark theme ported from craftzdog/solarized-osaka.nvim."

  ;; Solarized Osaka Dark
  (
    ;; name          default    256        16
    (sol-base04   '("#001419"  "#001419"  "black"       ))
    (sol-base03   '("#002c38"  "#002c38"  "black"       ))
    (sol-base02   '("#063540"  "#063540"  "brightblack" ))
    (sol-base01   '("#576d74"  "#576d74"  "brightblack" ))
    (sol-base00   '("#637981"  "#637981"  "brightblack" ))
    (sol-base0    '("#9eabac"  "#9eabac"  "brightwhite" ))
    (sol-base1    '("#adb7b7"  "#adb7b7"  "white"       ))
    (sol-base2    '("#ede7d3"  "#ede7d3"  "white"       ))
    (sol-base3    '("#fdf5e2"  "#fdf5e2"  "white"       ))
    (sol-yellow   '("#b28500"  "#b28500"  "yellow"      ))
    (sol-orange   '("#c94c16"  "#c94c16"  "brightred"   ))
    (sol-red      '("#db302d"  "#db302d"  "red"         ))
    (sol-magenta  '("#d23681"  "#d23681"  "magenta"     ))
    (sol-violet   '("#6d71c4"  "#6d71c4"  "brightblue"  ))
    (sol-blue     '("#268bd3"  "#268bd3"  "blue"        ))
    (sol-cyan     '("#29a298"  "#29a298"  "cyan"        ))
    (sol-green    '("#849900"  "#849900"  "green"       ))
    (sol-dark-yellow  '("#664c00"  "#664c00"))
    (sol-dark-orange  '("#a13c10"  "#a13c10"))
    (sol-dark-red     '("#b7211f"  "#b7211f"))
    (sol-dark-magenta '("#af2668"  "#af2668"))
    (sol-dark-violet  '("#484eb6"  "#484eb6"))
    (sol-dark-blue    '("#1a6397"  "#1a6397"))
    (sol-dark-cyan    '("#1a6265"  "#1a6265"))
    (sol-dark-green   '("#586600"  "#586600"))

    ;; Variables required by doom theme
    (bg             sol-base03)
    (fg             sol-base0)
    (bg-alt         sol-base04)
    (fg-alt         sol-base1)

    (base0          sol-base04)
    (base1          sol-base03)
    (base2          sol-base02)
    (base3          '("#0d3f4a"  "#0d3f4a"  "brightblack"))
    (base4          sol-base01)
    (base5          sol-base00)
    (base6          sol-base0)
    (base7          sol-base1)
    (base8          '("#c4cccc"  "#c4cccc"  "white"      ))

    (grey           sol-base01)
    (red            sol-red)
    (orange         sol-orange)
    (green          sol-green)
    (teal           sol-cyan)
    (yellow         sol-yellow)
    (blue           sol-blue)
    (dark-blue      sol-dark-blue)
    (magenta        sol-magenta)
    (violet         sol-violet)
    (cyan           sol-cyan)
    (dark-cyan      sol-dark-cyan)

    ;; Face categories
    (highlight      sol-blue)
    (selection      sol-base02)
    (region         sol-base02)
    (vertical-bar   sol-base02)

    (comments       (if doom-solarized-osaka-brighter-comments sol-base00 sol-base01))
    (doc-comments   (if doom-solarized-osaka-brighter-comments sol-base0  sol-base00))

    (builtin        sol-cyan)
    (constants      sol-orange)
    (functions      sol-blue)
    (keywords       sol-green)
    (methods        sol-cyan)
    (operators      sol-base0)
    (type           sol-yellow)
    (strings        sol-cyan)
    (variables      sol-base1)
    (numbers        sol-orange)

    (error          sol-red)
    (warning        sol-yellow)
    (success        sol-green)

    (vc-added       sol-green)
    (vc-deleted     sol-red)
    (vc-modified    sol-yellow)

    ;; Modeline
    (modeline-bg              (if doom-solarized-osaka-brighter-modeline sol-base02 sol-base04))
    (modeline-fg              sol-base0)
    (modeline-bg-alt          (if doom-solarized-osaka-brighter-modeline base3 sol-base02))
    (modeline-fg-alt          sol-base0)
    (modeline-bg-inactive     sol-base02)
    (modeline-fg-inactive     sol-base01)
    (modeline-bg-inactive-alt sol-base02)
    (modeline-fg-inactive-alt sol-base01)
    (modeline-pad
      (when doom-solarized-osaka-padded-modeline
        (if (integerp doom-solarized-osaka-padded-modeline)
            doom-solarized-osaka-padded-modeline
          4))))

  (
   ;; Font Lock
    ((font-lock-comment-face &override)
     :slant 'italic
     :foreground comments
     :background (if doom-solarized-osaka-brighter-comments (doom-blend teal bg 0.07)))
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
    (fringe :background bg-alt)

    ;; Highlight line
    (hl-line :background base2 :extend t)

    ;; Line numbers
    ((line-number &override)              :foreground base4 :background bg-alt)
    ((line-number-current-line &override) :foreground base6 :background bg-alt :bold t)

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
     :foreground (if doom-solarized-osaka-brighter-modeline fg sol-base0))

    ;; solaire mode line
    (solaire-mode-line-face
     :inherit 'mode-line
     :background modeline-bg-alt
     :box (if modeline-pad `(:line-width ,modeline-pad :color ,modeline-bg-alt)))
    (solaire-mode-line-inactive-face
     :inherit 'mode-line-inactive
     :background modeline-bg-inactive-alt
     :box (if modeline-pad `(:line-width ,modeline-pad :color ,modeline-bg-inactive-alt)))

    ;; Doom modeline
    (doom-modeline-bar               :background sol-green)
    (doom-modeline-evil-normal-state :foreground sol-green)
    (doom-modeline-evil-insert-state :foreground sol-blue)
    (doom-modeline-evil-visual-state :foreground sol-yellow)
    (doom-modeline-evil-emacs-state  :foreground sol-violet)

    ;; Company
    (company-tooltip-selection :background sol-blue :foreground bg)

    ;; CSS mode / scss-mode
    (css-proprietary-property :foreground sol-orange)
    (css-property             :foreground sol-green)
    (css-selector             :foreground sol-cyan)

    ;; Helm
    (helm-selection :foreground bg :weight 'bold :background sol-blue)

    ;; Ivy
    (ivy-current-match              :background base2 :distant-foreground fg)
    (ivy-minibuffer-match-face-1    :foreground sol-cyan    :background nil :weight 'bold)
    (ivy-minibuffer-match-face-2    :foreground sol-violet  :background nil :weight 'bold)
    (ivy-minibuffer-match-face-3    :foreground sol-yellow  :background nil :weight 'bold)
    (ivy-minibuffer-match-face-4    :foreground sol-orange  :background nil :weight 'bold)
    (ivy-minibuffer-match-highlight :foreground sol-magenta :weight 'bold)
    (ivy-posframe                   :background modeline-bg-alt)

    ;; Search
    (lazy-highlight :background base3 :foreground fg)
    (isearch        :background sol-yellow :foreground bg :bold t)
    (isearch-fail   :foreground base4)

    ;; Markdown
    (markdown-markup-face                  :foreground base5)
    (markdown-header-face                  :inherit 'bold :foreground sol-blue)
    ((markdown-code-face &override)        :background base2 :foreground base7)
    ((markdown-pre-face &override)         :background base2 :foreground base7)
    ((markdown-inline-code-face &override) :background base2 :foreground sol-cyan)

    ;; Widget
    (widget-field             :foreground fg :background base3)
    (widget-single-line-field :foreground fg :background base3)

    ;; Swiper
    (swiper-line-face    :background base3)
    (swiper-match-face-1 :inherit 'ivy-minibuffer-match-face-1)
    (swiper-match-face-2 :inherit 'ivy-minibuffer-match-face-2)
    (swiper-match-face-3 :inherit 'ivy-minibuffer-match-face-3)
    (swiper-match-face-4 :inherit 'ivy-minibuffer-match-face-4)

    ;; Diff
    (diff-added   :background "#002c1f" :foreground sol-green)
    (diff-removed :background "#2c0a00" :foreground sol-red)
    (diff-changed :background "#1a1a00" :foreground sol-yellow)

    ;; org-mode
    (org-block            :background (doom-blend sol-cyan bg 0.04) :extend t)
    (org-block-background :background (doom-blend sol-cyan bg 0.04))
    (org-block-begin-line :background (doom-blend sol-cyan bg 0.08) :foreground comments :extend t)
    (org-block-end-line   :background (doom-blend sol-cyan bg 0.08) :foreground comments :extend t)
    (org-level-1          :foreground sol-blue    :weight 'bold)
    (org-level-2          :foreground sol-cyan    :weight 'bold)
    (org-level-3          :foreground sol-green   :weight 'bold)
    (org-level-4          :foreground sol-yellow  :weight 'bold)
    (org-level-5          :foreground sol-orange)
    (org-level-6          :foreground sol-violet)
    (org-level-7          :foreground sol-magenta)
    (org-level-8          :foreground sol-red)))

(provide 'doom-solarized-osaka-theme)

;;; doom-solarized-osaka-theme.el ends here
