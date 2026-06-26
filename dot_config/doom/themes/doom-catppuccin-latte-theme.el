;;; doom-catppuccin-latte-theme.el --- Catppuccin Latte light theme -*- lexical-binding: t; no-byte-compile: t; -*-
;;
;; Author: Catppuccin Organization
;; Ported by: joaofelipegalvao
;; Keywords: custom themes, faces
;;
;;; Commentary:
;;
;; Ported from the official Catppuccin Latte palette.
;; Thanks https://github.com/catppuccin/catppuccin
;;
;;; Code:

(require 'doom-themes)

;;; Variables
(defgroup doom-catppuccin-latte-theme nil
  "Options for the `doom-catppuccin-latte' theme."
  :group 'doom-themes)

(defcustom doom-catppuccin-latte-brighter-comments nil
  "If non-nil, comments will use overlay1 instead of overlay0."
  :group 'doom-catppuccin-latte-theme
  :type 'boolean)

(defcustom doom-catppuccin-latte-brighter-modeline nil
  "If non-nil, the mode-line will use surface0 instead of crust."
  :group 'doom-catppuccin-latte-theme
  :type 'boolean)

(defcustom doom-catppuccin-latte-padded-modeline doom-themes-padded-modeline
  "If non-nil, adds a 4px padding to the mode-line.
Can be an integer to determine the exact padding."
  :group 'doom-catppuccin-latte-theme
  :type '(choice integer boolean))

;;; Theme definition
(def-doom-theme doom-catppuccin-latte
  "Light theme based on the official Catppuccin Latte palette."

  ;; Catppuccin Latte
  (
    ;; name            default    256        16
    (ctp-crust      '("#dce0e8"  "#dce0e8"  "white"       ))
    (ctp-mantle     '("#e6e9ef"  "#e6e9ef"  "white"       ))
    (ctp-base       '("#eff1f5"  "#eff1f5"  "white"       ))
    (ctp-surface0   '("#ccd0da"  "#ccd0da"  "white"       ))
    (ctp-surface1   '("#bcc0cc"  "#bcc0cc"  "brightwhite" ))
    (ctp-surface2   '("#acb0be"  "#acb0be"  "brightwhite" ))
    (ctp-overlay0   '("#9ca0b0"  "#9ca0b0"  "brightblack" ))
    (ctp-overlay1   '("#8c8fa1"  "#8c8fa1"  "brightblack" ))
    (ctp-overlay2   '("#7c7f93"  "#7c7f93"  "brightblack" ))
    (ctp-subtext0   '("#6c6f85"  "#6c6f85"  "black"       ))
    (ctp-subtext1   '("#5c5f77"  "#5c5f77"  "black"       ))
    (ctp-text       '("#4c4f69"  "#4c4f69"  "black"       ))
    (ctp-rosewater  '("#dc8a78"  "#dc8a78"  "red"         ))
    (ctp-flamingo   '("#dd7878"  "#dd7878"  "red"         ))
    (ctp-pink       '("#ea76cb"  "#ea76cb"  "magenta"     ))
    (ctp-mauve      '("#8839ef"  "#8839ef"  "brightmagenta"))
    (ctp-red        '("#d20f39"  "#d20f39"  "red"         ))
    (ctp-maroon     '("#e64553"  "#e64553"  "brightred"   ))
    (ctp-peach      '("#fe640b"  "#fe640b"  "brightred"   ))
    (ctp-yellow     '("#df8e1d"  "#df8e1d"  "yellow"      ))
    (ctp-green      '("#40a02b"  "#40a02b"  "green"       ))
    (ctp-teal       '("#179299"  "#179299"  "cyan"        ))
    (ctp-sky        '("#04a5e5"  "#04a5e5"  "brightcyan"  ))
    (ctp-sapphire   '("#209fb5"  "#209fb5"  "brightblue"  ))
    (ctp-blue       '("#1e66f5"  "#1e66f5"  "blue"        ))
    (ctp-lavender   '("#7287fd"  "#7287fd"  "brightblue"  ))

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

    (comments       (if doom-catppuccin-latte-brighter-comments ctp-overlay1 ctp-overlay0))
    (doc-comments   (if doom-catppuccin-latte-brighter-comments ctp-overlay2 ctp-overlay1))

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
    (modeline-bg              (if doom-catppuccin-latte-brighter-modeline ctp-surface0 ctp-crust))
    (modeline-fg              ctp-text)
    (modeline-bg-alt          (if doom-catppuccin-latte-brighter-modeline ctp-mantle ctp-surface0))
    (modeline-fg-alt          ctp-subtext1)
    (modeline-bg-inactive     ctp-mantle)
    (modeline-fg-inactive     ctp-overlay0)
    (modeline-bg-inactive-alt ctp-mantle)
    (modeline-fg-inactive-alt ctp-overlay0)
    (modeline-pad
      (when doom-catppuccin-latte-padded-modeline
        (if (integerp doom-catppuccin-latte-padded-modeline)
            doom-catppuccin-latte-padded-modeline
          4))))

  (
    ;; Font lock
    ((font-lock-comment-face &override)
     :slant 'italic
     :foreground comments
     :background (if doom-catppuccin-latte-brighter-comments (doom-blend teal bg 0.07)))
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
     :foreground (if doom-catppuccin-latte-brighter-modeline fg ctp-lavender))

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
    (diff-added   :background "#e6f3e6" :foreground ctp-green)
    (diff-removed :background "#f3e6e8" :foreground ctp-red)
    (diff-changed :background "#f3efe6" :foreground ctp-yellow)

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

(provide 'doom-catppuccin-latte-theme)

;;; doom-catppuccin-latte-theme.el ends here
