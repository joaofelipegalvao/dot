;;; doom-catppuccin-mocha-theme.el --- Catppuccin Mocha dark theme -*- lexical-binding: t; no-byte-compile: t; -*-
;;
;; Author: Catppuccin Organization
;; Ported by: joaofelipegalvao
;; Keywords: custom themes, faces
;;
;;; Commentary:
;;
;; Ported from the official Catppuccin Mocha palette.
;; Thanks https://github.com/catppuccin/catppuccin
;;
;;; Code:

(require 'doom-themes)

;;; Variables
(defgroup doom-catppuccin-mocha-theme nil
  "Options for the `doom-catppuccin-mocha' theme."
  :group 'doom-themes)

(defcustom doom-catppuccin-mocha-brighter-comments nil
  "If non-nil, comments will use overlay1 instead of overlay0."
  :group 'doom-catppuccin-mocha-theme
  :type 'boolean)

(defcustom doom-catppuccin-mocha-brighter-modeline nil
  "If non-nil, the mode-line will use surface0 instead of crust."
  :group 'doom-catppuccin-mocha-theme
  :type 'boolean)

(defcustom doom-catppuccin-mocha-padded-modeline doom-themes-padded-modeline
  "If non-nil, adds a 4px padding to the mode-line.
Can be an integer to determine the exact padding."
  :group 'doom-catppuccin-mocha-theme
  :type '(choice integer boolean))

;;; Theme definition
(def-doom-theme doom-catppuccin-mocha
  "Dark theme based on the official Catppuccin Mocha palette."

  ;; Catppuccin Mocha
  (
    ;; name            default    256        16
    (ctp-crust      '("#11111b"  "#11111b"  "black"       ))
    (ctp-mantle     '("#181825"  "#181825"  "black"       ))
    (ctp-base       '("#1e1e2e"  "#1e1e2e"  "black"       ))
    (ctp-surface0   '("#313244"  "#313244"  "brightblack" ))
    (ctp-surface1   '("#45475a"  "#45475a"  "brightblack" ))
    (ctp-surface2   '("#585b70"  "#585b70"  "brightblack" ))
    (ctp-overlay0   '("#6c7086"  "#6c7086"  "brightblack" ))
    (ctp-overlay1   '("#7f849c"  "#7f849c"  "brightblack" ))
    (ctp-overlay2   '("#9399b2"  "#9399b2"  "brightblack" ))
    (ctp-subtext0   '("#a6adc8"  "#a6adc8"  "white"       ))
    (ctp-subtext1   '("#bac2de"  "#bac2de"  "white"       ))
    (ctp-text       '("#cdd6f4"  "#cdd6f4"  "white"       ))
    (ctp-rosewater  '("#f5e0dc"  "#f5e0dc"  "white"       ))
    (ctp-flamingo   '("#f2cdcd"  "#f2cdcd"  "white"       ))
    (ctp-pink       '("#f5c2e7"  "#f5c2e7"  "magenta"     ))
    (ctp-mauve      '("#cba6f7"  "#cba6f7"  "brightmagenta"))
    (ctp-red        '("#f38ba8"  "#f38ba8"  "red"         ))
    (ctp-maroon     '("#eba0ac"  "#eba0ac"  "brightred"   ))
    (ctp-peach      '("#fab387"  "#fab387"  "brightred"   ))
    (ctp-yellow     '("#f9e2af"  "#f9e2af"  "yellow"      ))
    (ctp-green      '("#a6e3a1"  "#a6e3a1"  "green"       ))
    (ctp-teal       '("#94e2d5"  "#94e2d5"  "cyan"        ))
    (ctp-sky        '("#89dceb"  "#89dceb"  "brightcyan"  ))
    (ctp-sapphire   '("#74c7ec"  "#74c7ec"  "brightblue"  ))
    (ctp-blue       '("#89b4fa"  "#89b4fa"  "blue"        ))
    (ctp-lavender   '("#b4befe"  "#b4befe"  "brightblue"  ))

    ;; Variables required by doom theme
    (bg             ctp-base)
    (fg             ctp-text)
    (bg-alt         ctp-mantle)
    (fg-alt         ctp-subtext1)

    (base0          ctp-crust)
    (base1          ctp-mantle)
    (base2          ctp-base)
    (base3          ctp-surface0)
    (base4          ctp-surface1)
    (base5          ctp-surface2)
    (base6          ctp-overlay0)
    (base7          ctp-overlay2)
    (base8          ctp-subtext1)

    (grey           ctp-overlay0)
    (red            ctp-red)
    (orange         ctp-peach)
    (green          ctp-green)
    (teal           ctp-teal)
    (yellow         ctp-yellow)
    (blue           ctp-blue)
    (dark-blue      ctp-sapphire)
    (magenta        ctp-pink)
    (violet         ctp-mauve)
    (cyan           ctp-sky)
    (dark-cyan      ctp-teal)

    ;; Face categories
    (highlight      ctp-rosewater)
    (selection      ctp-surface1)
    (region         ctp-surface1)
    (vertical-bar   ctp-surface0)

    (comments       (if doom-catppuccin-mocha-brighter-comments ctp-overlay1 ctp-overlay0))
    (doc-comments   (if doom-catppuccin-mocha-brighter-comments ctp-overlay2 ctp-overlay1))

    (builtin        ctp-red)
    (constants      ctp-peach)
    (functions      ctp-blue)
    (keywords       ctp-mauve)
    (methods        ctp-blue)
    (operators      ctp-sky)
    (type           ctp-yellow)
    (strings        ctp-green)
    (variables      ctp-text)
    (numbers        ctp-peach)

    (error          ctp-red)
    (warning        ctp-yellow)
    (success        ctp-green)

    (vc-added       ctp-green)
    (vc-deleted     ctp-red)
    (vc-modified    ctp-yellow)

    ;; Modeline
    (modeline-bg              (if doom-catppuccin-mocha-brighter-modeline ctp-surface0 ctp-crust))
    (modeline-fg              ctp-text)
    (modeline-bg-alt          (if doom-catppuccin-mocha-brighter-modeline ctp-mantle ctp-surface0))
    (modeline-fg-alt          ctp-subtext1)
    (modeline-bg-inactive     ctp-mantle)
    (modeline-fg-inactive     ctp-overlay0)
    (modeline-bg-inactive-alt ctp-mantle)
    (modeline-fg-inactive-alt ctp-overlay0)
    (modeline-pad
      (when doom-catppuccin-mocha-padded-modeline
        (if (integerp doom-catppuccin-mocha-padded-modeline)
            doom-catppuccin-mocha-padded-modeline
          4))))

  (
    ;; Font lock
    ((font-lock-comment-face &override)
     :slant 'italic
     :foreground comments
     :background (if doom-catppuccin-mocha-brighter-comments (doom-blend teal bg 0.07)))
    ((font-lock-doc-face &override)
     :slant 'italic
     :foreground doc-comments)
    ((font-lock-type-face &override)          :slant 'italic)
    ((font-lock-builtin-face &override)       :slant 'italic)
    ((font-lock-function-name-face &override) :foreground functions)
    ((font-lock-keyword-face &override)       :weight 'bold)
    ((font-lock-constant-face &override)      :weight 'bold)

    ;; Fringe / cursor
    (cursor :background ctp-rosewater)
    (fringe :background bg-alt)

    ;; Highlight line
    (hl-line :background ctp-surface0 :extend t)

    ;; Line numbers
    ((line-number &override)              :foreground ctp-surface1 :background bg-alt)
    ((line-number-current-line &override) :foreground ctp-lavender :background bg-alt :bold t)

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
     :foreground (if doom-catppuccin-mocha-brighter-modeline fg ctp-lavender))

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
    (doom-modeline-bar               :background ctp-mauve)
    (doom-modeline-evil-normal-state :foreground ctp-green)
    (doom-modeline-evil-insert-state :foreground ctp-blue)
    (doom-modeline-evil-visual-state :foreground ctp-yellow)
    (doom-modeline-evil-emacs-state  :foreground ctp-mauve)

    ;; Company
    (company-tooltip-selection :background ctp-surface1 :foreground ctp-text)

    ;; Css mode / scss-mode
    (css-proprietary-property :foreground ctp-peach)
    (css-property             :foreground ctp-green)
    (css-selector             :foreground ctp-blue)

    ;; Helm
    (helm-selection :foreground bg :weight 'bold :background ctp-blue)

    ;; Ivy
    (ivy-current-match              :background ctp-surface0 :distant-foreground fg)
    (ivy-minibuffer-match-face-1    :foreground ctp-blue    :background nil :weight 'bold)
    (ivy-minibuffer-match-face-2    :foreground ctp-mauve   :background nil :weight 'bold)
    (ivy-minibuffer-match-face-3    :foreground ctp-yellow  :background nil :weight 'bold)
    (ivy-minibuffer-match-face-4    :foreground ctp-peach   :background nil :weight 'bold)
    (ivy-minibuffer-match-highlight :foreground ctp-pink    :weight 'bold)
    (ivy-posframe                   :background modeline-bg-alt)

    ;; Search
    (lazy-highlight :background ctp-surface1 :foreground fg)
    (isearch        :background ctp-yellow   :foreground bg :bold t)
    (isearch-fail   :foreground ctp-overlay0)

    ;; Markdown
    (markdown-markup-face                  :foreground ctp-overlay1)
    (markdown-header-face                  :inherit 'bold :foreground ctp-blue)
    ((markdown-code-face &override)        :background ctp-surface0 :foreground ctp-text)
    ((markdown-pre-face &override)         :background ctp-surface0 :foreground ctp-text)
    ((markdown-inline-code-face &override) :background ctp-surface0 :foreground ctp-teal)

    ;; Widget
    (widget-field             :foreground fg :background ctp-surface0)
    (widget-single-line-field :foreground fg :background ctp-surface0)

    ;; Swiper
    (swiper-line-face    :background ctp-surface1)
    (swiper-match-face-1 :inherit 'ivy-minibuffer-match-face-1)
    (swiper-match-face-2 :inherit 'ivy-minibuffer-match-face-2)
    (swiper-match-face-3 :inherit 'ivy-minibuffer-match-face-3)
    (swiper-match-face-4 :inherit 'ivy-minibuffer-match-face-4)

    ;; Diff
    (diff-added   :background "#1e2e25" :foreground ctp-green)
    (diff-removed :background "#2e1e25" :foreground ctp-red)
    (diff-changed :background "#2e2a1e" :foreground ctp-yellow)

    ;; org-mode
    (org-block            :background (doom-blend ctp-blue bg 0.04) :extend t)
    (org-block-background :background (doom-blend ctp-blue bg 0.04))
    (org-block-begin-line :background (doom-blend ctp-blue bg 0.08) :foreground comments :extend t)
    (org-block-end-line   :background (doom-blend ctp-blue bg 0.08) :foreground comments :extend t)
    (org-level-1          :foreground ctp-blue    :weight 'bold)
    (org-level-2          :foreground ctp-mauve   :weight 'bold)
    (org-level-3          :foreground ctp-green   :weight 'bold)
    (org-level-4          :foreground ctp-yellow  :weight 'bold)
    (org-level-5          :foreground ctp-peach)
    (org-level-6          :foreground ctp-teal)
    (org-level-7          :foreground ctp-pink)
    (org-level-8          :foreground ctp-red)))

(provide 'doom-catppuccin-mocha-theme)

;;; doom-catppuccin-mocha-theme.el ends here
