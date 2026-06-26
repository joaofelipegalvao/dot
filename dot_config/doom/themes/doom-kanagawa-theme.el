;;; doom-kanagawa-theme.el --- Kanagawa Wave dark theme -*- lexical-binding: t; no-byte-compile: t; -*-
;;
;; Author: Tommaso Laurenzi <https://github.com/rebelot/kanagawa.nvim>
;; Ported by: joaofelipegalvao
;; Keywords: custom themes, faces
;;
;;; Commentary:
;;
;; Ported from the Kanagawa colorscheme for Neovim by Tommaso Laurenzi.
;; Inspired by the colors of the famous painting by Katsushika Hokusai.
;; This port implements the "Wave" variant (default dark theme).
;; Thanks https://github.com/rebelot/kanagawa.nvim
;;
;;; Code:

(require 'doom-themes)

;;; Variables
(defgroup doom-kanagawa-theme nil
  "Options for the `doom-kanagawa' theme."
  :group 'doom-themes)

(defcustom doom-kanagawa-brighter-comments nil
  "If non-nil, comments will use fujiGray (#727169) instead of the dimmer tone."
  :group 'doom-kanagawa-theme
  :type 'boolean)

(defcustom doom-kanagawa-brighter-modeline nil
  "If non-nil, the mode-line will use sumiInk4 instead of sumiInk1."
  :group 'doom-kanagawa-theme
  :type 'boolean)

(defcustom doom-kanagawa-padded-modeline doom-themes-padded-modeline
  "If non-nil, adds a 4px padding to the mode-line.
Can be an integer to determine the exact padding."
  :group 'doom-kanagawa-theme
  :type '(choice integer boolean))

;;; Theme definition
(def-doom-theme doom-kanagawa
  "Dark theme based on the Kanagawa Wave colorscheme for Neovim by Tommaso Laurenzi."

  ;; -----------------------------------------------------------------------
  ;; Kanagawa Palette — Wave variant
  ;; Source: lua/kanagawa/colors.lua + lua/kanagawa/themes.lua
  ;; -----------------------------------------------------------------------
  (
    ;; name               default    256        16
    ;; -- Bg Shades (Sumi Ink) --
    (sumi-ink0           '("#16161D"  "#16161D"  "black"       ))  ;; sumiInk0 — deepest bg / float bg
    (sumi-ink1           '("#181820"  "#181820"  "black"       ))  ;; sumiInk1 — bg_dim / bg_m2 / popup bg
    (sumi-ink2           '("#1a1a22"  "#1a1a22"  "black"       ))  ;; sumiInk2 — bg_m1
    (sumi-ink3           '("#1F1F28"  "#1F1F28"  "black"       ))  ;; sumiInk3 — bg (main editor bg)
    (sumi-ink4           '("#2A2A37"  "#2A2A37"  "brightblack" ))  ;; sumiInk4 — bg_p1 / bg_gutter
    (sumi-ink5           '("#363646"  "#363646"  "brightblack" ))  ;; sumiInk5 — bg_p2 / cursorline
    (sumi-ink6           '("#54546D"  "#54546D"  "brightblack" ))  ;; sumiInk6 — nontext / whitespace

    ;; -- Popup and Floats (Wave Blue) --
    (wave-blue1          '("#223249"  "#223249"  "brightblack" ))  ;; waveBlue1 — pmenu bg / visual
    (wave-blue2          '("#2D4F67"  "#2D4F67"  "brightblue"  ))  ;; waveBlue2 — search bg / pmenu sel

    ;; -- Diff and Git --
    (winter-green        '("#2B3328"  "#2B3328"  "black"       ))  ;; winterGreen  — diff add bg
    (winter-yellow       '("#49443C"  "#49443C"  "black"       ))  ;; winterYellow — diff text bg
    (winter-red          '("#43242B"  "#43242B"  "black"       ))  ;; winterRed    — diff delete bg
    (winter-blue         '("#252535"  "#252535"  "black"       ))  ;; winterBlue   — diff change bg
    (autumn-green        '("#76946A"  "#76946A"  "green"       ))  ;; autumnGreen  — vcs added
    (autumn-red          '("#C34043"  "#C34043"  "red"         ))  ;; autumnRed    — vcs removed
    (autumn-yellow       '("#DCA561"  "#DCA561"  "yellow"      ))  ;; autumnYellow — vcs changed

    ;; -- Diagnostics --
    (samurai-red         '("#E82424"  "#E82424"  "red"         ))  ;; samuraiRed   — error
    (ronin-yellow        '("#FF9E3B"  "#FF9E3B"  "yellow"      ))  ;; roninYellow  — warning / CursorLineNr
    (wave-aqua1          '("#6A9589"  "#6A9589"  "cyan"        ))  ;; waveAqua1    — hint / diag
    (dragon-blue         '("#658594"  "#658594"  "blue"        ))  ;; dragonBlue   — info

    ;; -- Fg and Comments --
    (old-white           '("#C8C093"  "#C8C093"  "white"       ))  ;; oldWhite  — fg_dim
    (fuji-white          '("#DCD7BA"  "#DCD7BA"  "brightwhite" ))  ;; fujiWhite — fg (main text)
    (fuji-gray           '("#727169"  "#727169"  "brightblack" ))  ;; fujiGray  — comments

    ;; -- Syntax Colors --
    (oni-violet          '("#957FB8"  "#957FB8"  "magenta"     ))  ;; oniViolet    — keywords / statements
    (oni-violet2         '("#b8b4d0"  "#b8b4d0"  "brightmagenta"))  ;; oniViolet2   — parameters
    (crystal-blue        '("#7E9CD8"  "#7E9CD8"  "blue"        ))  ;; crystalBlue  — functions
    (spring-violet1      '("#938AA9"  "#938AA9"  "magenta"     ))  ;; springViolet1 — special / fold
    (spring-violet2      '("#9CABCA"  "#9CABCA"  "brightblue"  ))  ;; springViolet2 — punctuation
    (spring-blue         '("#7FB4CA"  "#7FB4CA"  "brightblue"  ))  ;; springBlue    — special1
    (wave-aqua2          '("#7AA89F"  "#7AA89F"  "cyan"        ))  ;; waveAqua2     — types
    (spring-green        '("#98BB6C"  "#98BB6C"  "green"       ))  ;; springGreen   — strings
    (boat-yellow1        '("#938056"  "#938056"  "yellow"      ))  ;; boatYellow1   — (unused / darker)
    (boat-yellow2        '("#C0A36E"  "#C0A36E"  "yellow"      ))  ;; boatYellow2   — operators / regex
    (carp-yellow         '("#E6C384"  "#E6C384"  "brightyellow"))  ;; carpYellow    — identifiers
    (sakura-pink         '("#D27E99"  "#D27E99"  "red"         ))  ;; sakuraPink    — numbers
    (wave-red            '("#E46876"  "#E46876"  "brightred"   ))  ;; waveRed       — preproc / special2
    (peach-red           '("#FF5D62"  "#FF5D62"  "red"         ))  ;; peachRed      — special3
    (surimi-orange       '("#FFA066"  "#FFA066"  "brightyellow"))  ;; surimiOrange  — constants
    (katana-gray         '("#717C7C"  "#717C7C"  "brightblack" ))  ;; katanaGray    — deprecated

    ;; -- Variables required by doom theme --
    (bg           sumi-ink3)
    (fg           fuji-white)
    (bg-alt       sumi-ink1)
    (fg-alt       old-white)

    (base0        sumi-ink0)
    (base1        sumi-ink1)
    (base2        sumi-ink2)
    (base3        sumi-ink3)
    (base4        sumi-ink4)
    (base5        sumi-ink5)
    (base6        sumi-ink6)
    (base7        spring-violet2)
    (base8        fuji-white)

    (grey         fuji-gray)
    (red          samurai-red)
    (orange       surimi-orange)
    (green        spring-green)
    (teal         wave-aqua1)
    (yellow       carp-yellow)
    (blue         crystal-blue)
    (dark-blue    wave-blue2)
    (magenta      oni-violet)
    (violet       spring-violet1)
    (cyan         wave-aqua2)
    (dark-cyan    wave-aqua1)

    ;; Face categories
    (highlight    wave-blue2)
    (selection    wave-blue1)
    (region       wave-blue1)
    (vertical-bar sumi-ink0)

    (comments     (if doom-kanagawa-brighter-comments fuji-gray sumi-ink6))
    (doc-comments (if doom-kanagawa-brighter-comments old-white  fuji-gray))

    (builtin      spring-blue)
    (constants    surimi-orange)
    (functions    crystal-blue)
    (keywords     oni-violet)
    (methods      crystal-blue)
    (operators    boat-yellow2)
    (type         wave-aqua2)
    (strings      spring-green)
    (variables    carp-yellow)
    (numbers      sakura-pink)

    (error        samurai-red)
    (warning      ronin-yellow)
    (success      spring-green)

    (vc-added     autumn-green)
    (vc-deleted   autumn-red)
    (vc-modified  autumn-yellow)

    ;; Modeline
    (modeline-bg              (if doom-kanagawa-brighter-modeline sumi-ink4 sumi-ink1))
    (modeline-fg              old-white)
    (modeline-bg-alt          (if doom-kanagawa-brighter-modeline sumi-ink5 sumi-ink2))
    (modeline-fg-alt          fuji-white)
    (modeline-bg-inactive     sumi-ink1)
    (modeline-fg-inactive     sumi-ink6)
    (modeline-bg-inactive-alt sumi-ink1)
    (modeline-fg-inactive-alt sumi-ink6)
    (modeline-pad
      (when doom-kanagawa-padded-modeline
        (if (integerp doom-kanagawa-padded-modeline)
            doom-kanagawa-padded-modeline
          4))))

  (
    ;; Font lock
    ((font-lock-comment-face &override)
     :foreground comments
     :slant 'italic)
    ((font-lock-doc-face &override)
     :foreground doc-comments
     :slant 'italic)
    ((font-lock-type-face &override)          :foreground wave-aqua2)
    ((font-lock-builtin-face &override)       :foreground spring-blue)
    ((font-lock-function-name-face &override) :foreground crystal-blue)
    ((font-lock-keyword-face &override)       :foreground oni-violet   :slant 'italic)
    ((font-lock-constant-face &override)      :foreground surimi-orange)
    ((font-lock-variable-name-face &override) :foreground carp-yellow)
    ((font-lock-string-face &override)        :foreground spring-green)
    ((font-lock-warning-face &override)       :foreground ronin-yellow)
    ((font-lock-preprocessor-face &override)  :foreground wave-red)

    ;; Fringe / cursor
    (cursor :background fuji-white)
    (fringe :background sumi-ink3 :foreground sumi-ink6)

    ;; Highlight line
    (hl-line :background sumi-ink5 :extend t)

    ;; Line numbers
    ((line-number &override)
     :foreground sumi-ink6
     :background sumi-ink4)
    ((line-number-current-line &override)
     :foreground ronin-yellow
     :background sumi-ink4
     :bold t)

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
     :foreground (if doom-kanagawa-brighter-modeline fg crystal-blue))

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
    (doom-modeline-bar               :background crystal-blue)
    (doom-modeline-evil-normal-state :foreground spring-green)
    (doom-modeline-evil-insert-state :foreground crystal-blue)
    (doom-modeline-evil-visual-state :foreground carp-yellow)
    (doom-modeline-evil-emacs-state  :foreground oni-violet)

    ;; Company
    (company-tooltip           :background wave-blue1 :foreground fuji-white)
    (company-tooltip-selection :background wave-blue2 :foreground fuji-white :weight 'bold)
    (company-tooltip-common    :foreground crystal-blue)
    (company-scrollbar-bg      :background wave-blue1)
    (company-scrollbar-fg      :background wave-blue2)

    ;; Css mode / scss-mode
    (css-proprietary-property :foreground surimi-orange)
    (css-property             :foreground wave-aqua2)
    (css-selector             :foreground oni-violet)

    ;; Helm
    (helm-selection         :foreground sumi-ink0 :weight 'bold :background crystal-blue)
    (helm-source-header     :foreground crystal-blue :background sumi-ink4)
    (helm-ff-directory      :foreground oni-violet :weight 'bold)
    (helm-ff-file           :foreground fuji-white)
    (helm-match             :foreground crystal-blue)
    (helm-grep-match        :inherit 'isearch)

    ;; Ivy
    (ivy-current-match              :background wave-blue1 :distant-foreground fg)
    (ivy-minibuffer-match-face-1    :background nil        :foreground old-white)
    (ivy-minibuffer-match-face-2    :background crystal-blue :foreground sumi-ink0 :weight 'bold)
    (ivy-minibuffer-match-face-3    :background spring-green :foreground sumi-ink0 :weight 'bold)
    (ivy-minibuffer-match-face-4    :background carp-yellow  :foreground sumi-ink0 :weight 'bold)
    (ivy-minibuffer-match-highlight :foreground crystal-blue :weight 'bold)
    (ivy-posframe                   :background sumi-ink1)

    ;; Search
    (lazy-highlight :background wave-blue1 :foreground fuji-white)
    (isearch        :foreground sumi-ink0  :background ronin-yellow :bold t)
    (isearch-fail   :foreground samurai-red)

    ;; Markdown
    (markdown-markup-face                  :foreground spring-violet2)
    (markdown-header-face                  :inherit 'bold :foreground crystal-blue)
    ((markdown-code-face &override)        :background sumi-ink1 :foreground spring-green)
    ((markdown-pre-face &override)         :background sumi-ink1 :foreground spring-green)
    ((markdown-inline-code-face &override) :background sumi-ink1 :foreground spring-green)

    ;; Widget
    (widget-field             :foreground fuji-white :background sumi-ink4)
    (widget-single-line-field :foreground fuji-white :background sumi-ink4)

    ;; Swiper
    (swiper-line-face    :background wave-blue1)
    (swiper-match-face-1 :inherit 'ivy-minibuffer-match-face-1)
    (swiper-match-face-2 :inherit 'ivy-minibuffer-match-face-2)
    (swiper-match-face-3 :inherit 'ivy-minibuffer-match-face-3)
    (swiper-match-face-4 :inherit 'ivy-minibuffer-match-face-4)

    ;; Diff
    (diff-added   :foreground autumn-green  :background winter-green)
    (diff-removed :foreground autumn-red    :background winter-red)
    (diff-changed :foreground autumn-yellow :background winter-blue)

    ;; org-mode
    ;; Org headings follow the markdown heading color hierarchy
    (org-block            :background sumi-ink1 :extend t)
    (org-block-background :background sumi-ink1)
    (org-block-begin-line :foreground sumi-ink6 :extend t)
    (org-block-end-line   :foreground sumi-ink6 :extend t)
    (org-level-1          :foreground wave-red      :weight 'extra-bold)
    (org-level-2          :foreground surimi-orange  :weight 'bold)
    (org-level-3          :foreground carp-yellow    :weight 'semi-bold)
    (org-level-4          :foreground spring-green)
    (org-level-5          :foreground wave-aqua2)
    (org-level-6          :foreground crystal-blue)
    (org-level-7          :foreground oni-violet)
    (org-level-8          :foreground spring-violet1)

    ;; Magit
    (magit-branch                  :foreground spring-blue   :weight 'bold)
    (magit-section-heading         :foreground spring-blue   :weight 'bold)
    (magit-section-highlight       :background sumi-ink4)
    (magit-diff-context-highlight  :background sumi-ink4)
    (magit-diffstat-added          :foreground autumn-green)
    (magit-diffstat-removed        :foreground autumn-red)
    (magit-hash                    :foreground fuji-gray)
    (magit-hunk-heading            :foreground boat-yellow2)
    (magit-hunk-heading-highlight  :foreground boat-yellow2 :background sumi-ink4)

    ;; Rainbow delimiters
    ;; Follow the terminal color order from themes.lua
    (rainbow-delimiters-depth-1-face   :foreground crystal-blue)
    (rainbow-delimiters-depth-2-face   :foreground oni-violet)
    (rainbow-delimiters-depth-3-face   :foreground wave-aqua1)
    (rainbow-delimiters-depth-4-face   :foreground spring-green)
    (rainbow-delimiters-depth-5-face   :foreground surimi-orange)
    (rainbow-delimiters-depth-6-face   :foreground carp-yellow)
    (rainbow-delimiters-depth-7-face   :foreground spring-blue)
    (rainbow-delimiters-depth-8-face   :foreground spring-violet1)
    (rainbow-delimiters-unmatched-face :foreground samurai-red)))

(provide 'doom-kanagawa-theme)

;;; doom-kanagawa-theme.el ends here
