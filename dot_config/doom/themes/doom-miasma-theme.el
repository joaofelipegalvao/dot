;;; doom-miasma-theme.el --- A dark port of the Miasma theme -*- lexical-binding: t; no-byte-compile: t; -*-
;;
;; Author: OldJobobo / xero
;; Ported by: joaofelipegalvao (doom-emacs port)
;; Keywords: custom themes, faces
;; Homepage: https://github.com/OldJobobo/miasma.nvim
;;
;;; Commentary:
;;
;; A fog descends upon your editor.
;; Dark, organic theme inspired by the woods.
;; Ported from OldJobobo/miasma.nvim (palette by xero).
;; Thanks to hlissner (https://github.com/doomemacs/themes)
;;
;;; Code:
(require 'doom-themes)

;;; Variables
(defgroup doom-miasma-theme nil
  "Options for the `doom-miasma' theme."
  :group 'doom-themes)

(defcustom doom-miasma-brighter-modeline nil
  "If non-nil, more vivid colors will be used to style the mode-line."
  :group 'doom-miasma-theme
  :type 'boolean)

(defcustom doom-miasma-brighter-comments nil
  "If non-nil, comments will be highlighted in more vivid colors."
  :group 'doom-miasma-theme
  :type 'boolean)

(defcustom doom-miasma-padded-modeline doom-themes-padded-modeline
  "If non-nil, adds a 4px padding to the mode-line. Can be an integer to determine the exact padding."
  :group 'doom-miasma-theme
  :type '(choice integer boolean))

;;; Theme definition
(def-doom-theme doom-miasma
    "A dark organic theme inspired by the woods, ported from miasma.nvim."
  ;; name              default   256       16
  (
   ;; --- Palette (mirrors palette.lua) ---
   (mi-base            '("#222222" "#222222" "black"       ))
   (mi-surface         '("#1c1c1c" "#1c1c1c" "black"       ))
   (mi-surface-edge    '("#111111" "#111111" "black"       ))
   (mi-surface-hl      '("#43492a" "#43492a" "brightblack" ))
   (mi-shadow          '("#101010" "#101010" "black"       ))
   (mi-shadow-through  '("#151515" "#151515" "black"       ))

   (mi-text            '("#d7c483" "#d7c483" "yellow"      ))
   (mi-text-bright     '("#c2c2b0" "#c2c2b0" "white"       ))
   (mi-text-muted      '("#666666" "#666666" "brightblack" ))
   (mi-text-subtle     '("#444444" "#444444" "brightblack" ))

   (mi-accent-primary  '("#78834b" "#78834b" "green"       ))
   (mi-accent-sec      '("#5f875f" "#5f875f" "green"       ))
   (mi-amber           '("#c9a554" "#c9a554" "yellow"      ))
   (mi-orange          '("#bb7744" "#bb7744" "yellow"      ))
   (mi-warning         '("#685742" "#685742" "yellow"      ))
   (mi-error           '("#b36d43" "#b36d43" "red"         ))

   ;; semantic aliases (mirrors M.string = M.warning, etc.)
   (mi-string          mi-warning)          ; "#685742"
   (mi-keyword         mi-accent-sec)       ; "#5f875f"
   (mi-type            mi-accent-primary)   ; "#78834b"
   (mi-func            mi-accent-primary)   ; "#78834b"
   (mi-identifier      mi-text)             ; "#d7c483"
   (mi-special         mi-orange)           ; "#bb7744"
   (mi-comment         mi-text-muted)       ; "#666666"
   (mi-selection       mi-accent-primary)   ; "#78834b"
   (mi-border          mi-warning)          ; "#685742"

   (mi-diff-add        mi-accent-sec)       ; "#5f875f"
   (mi-diff-change     mi-warning)          ; "#685742"
   (mi-diff-delete     mi-error)            ; "#b36d43"
   (mi-diff-text       mi-amber)            ; "#c9a554"

   (mi-reference       '("#fd9720" "#fd9720" "yellow"      ))
   (mi-signature       '("#fbec9f" "#fbec9f" "yellow"      ))
   (mi-indent          '("#242d1d" "#242d1d" "black"       ))

   ;; --- Required doom-themes variables ---
   (bg                 mi-base)
   (fg                 mi-text)

   (bg-alt             mi-surface)
   (fg-alt             mi-text-bright)

   ;; base0 = darkest … base8 = lightest
   (base0              mi-shadow)
   (base1              mi-shadow-through)
   (base2              mi-surface-edge)
   (base3              mi-surface)
   (base4              mi-base)
   (base5              mi-text-subtle)
   (base6              mi-text-muted)
   (base7              mi-text-bright)
   (base8              mi-text)

   (grey               mi-text-muted)
   (red                mi-error)
   (orange             mi-orange)
   (green              mi-accent-sec)
   (teal               mi-accent-sec)
   (yellow             mi-amber)
   (blue               mi-accent-primary)
   (dark-blue          mi-accent-primary)
   (magenta            mi-amber)
   (violet             mi-accent-primary)
   (cyan               mi-accent-sec)
   (dark-cyan          mi-accent-sec)

   ;; --- Required face categories ---
   (highlight          mi-accent-primary)
   (selection          mi-surface-hl)
   (region             mi-surface-hl)
   (vertical-bar       mi-surface-edge)

   (comments           (if doom-miasma-brighter-comments mi-text-muted mi-comment))
   (doc-comments       (if doom-miasma-brighter-comments mi-text-muted mi-comment))

   ;; syntax
   (builtin            mi-accent-sec)
   (constants          mi-amber)
   (functions          mi-func)
   (keywords           mi-keyword)
   (methods            mi-func)
   (numbers            mi-amber)
   (operators          mi-text-bright)
   (strings            mi-string)
   (type               mi-type)
   (variables          mi-identifier)
   (error              mi-error)
   (success            mi-accent-sec)
   (warning            mi-warning)
   (vc-added           mi-diff-add)
   (vc-deleted         mi-diff-delete)
   (vc-modified        mi-diff-change)

   ;; --- Modeline ---
   (modeline-bg              (if doom-miasma-brighter-modeline mi-surface-hl mi-surface))
   (modeline-fg              mi-text)
   (modeline-bg-alt          (if doom-miasma-brighter-modeline mi-base mi-surface-edge))
   (modeline-fg-alt          mi-text-muted)
   (modeline-bg-inactive     mi-surface)
   (modeline-fg-inactive     mi-text-muted)
   (modeline-bg-inactive-alt mi-surface)
   (modeline-fg-inactive-alt mi-text-subtle)
   (modeline-pad
    (when doom-miasma-padded-modeline
      (if (integerp doom-miasma-padded-modeline) doom-miasma-padded-modeline 4))))

  ;; --- Base theme face overrides ---
  (
   ;; Syntax / font-lock
   ((font-lock-comment-face &override)
    :slant 'italic
    :foreground comments
    :background (if doom-miasma-brighter-comments (doom-blend mi-text-muted mi-base 0.06)))
   ((font-lock-string-face &override)      :foreground mi-string)
   ((font-lock-keyword-face &override)     :foreground mi-keyword :weight 'bold)
   ((font-lock-type-face &override)        :foreground mi-type :slant 'italic)
   ((font-lock-function-name-face &override) :foreground mi-func)
   ((font-lock-variable-name-face &override) :foreground mi-identifier)
   ((font-lock-constant-face &override)    :foreground mi-amber :weight 'bold)
   ((font-lock-builtin-face &override)     :foreground mi-accent-sec :slant 'italic)
   ((font-lock-preprocessor-face &override) :foreground mi-special)
   ((font-lock-warning-face &override)     :foreground mi-error)

   ;; Cursor / highlight line
   (cursor  :background mi-amber)
   (hl-line :background mi-surface)

   ;; Match parens
   (show-paren-match :foreground mi-signature :background mi-surface-hl :weight 'bold)

   ;; Line numbers
   ((line-number &override)              :foreground mi-text-subtle)
   ((line-number-current-line &override) :foreground mi-amber)

   ;; Search
   (isearch       :foreground mi-shadow :background mi-amber)
   (lazy-highlight :foreground mi-shadow :background mi-warning)

   ;; Region / visual selection
   (region :background mi-surface-hl :foreground mi-text)

   ;; Indent guides
   (highlight-indent-guides-character-face :foreground mi-indent)

   ;; Fringe / sign column
   (fringe          :background mi-surface :foreground mi-text-subtle)
   ((vertical-border &override) :foreground mi-surface-edge)

   ;; Diffs
   (diff-added   :foreground mi-diff-add)
   (diff-removed :foreground mi-diff-delete)
   (diff-changed :foreground mi-diff-change)
   (diff-refine-added   :foreground mi-diff-text :weight 'bold)
   (diff-refine-changed :foreground mi-amber :weight 'bold)

   ;; Diagnostics
   (flycheck-error   :underline `(:style wave :color ,mi-error))
   (flycheck-warning :underline `(:style wave :color ,mi-orange))
   (flycheck-info    :underline `(:style wave :color ,mi-accent-sec))

   ;; LSP / Eglot
   (lsp-face-highlight-read  :background mi-surface-hl)
   (lsp-face-highlight-write :background mi-surface-hl :weight 'bold)
   (eldoc-highlight-function-argument :foreground mi-signature :weight 'bold)

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
    :foreground (if doom-miasma-brighter-modeline mi-text mi-amber))

   ;; Company
   (company-tooltip           :background mi-surface :foreground mi-text)
   (company-tooltip-selection :background mi-surface-hl :foreground mi-text)
   (company-tooltip-common    :foreground mi-amber :weight 'bold)
   (company-scrollbar-bg      :background mi-surface-edge)
   (company-scrollbar-fg      :background mi-text-muted)

   ;; Doom modeline
   (doom-modeline-bar                :background mi-accent-primary)
   (doom-modeline-evil-emacs-state   :foreground mi-amber)
   (doom-modeline-evil-normal-state  :foreground mi-accent-sec)
   (doom-modeline-evil-visual-state  :foreground mi-accent-primary)
   (doom-modeline-evil-insert-state  :foreground mi-orange)

   ;; Ivy
   (ivy-current-match              :background mi-surface-hl :distant-foreground mi-text)
   (ivy-minibuffer-match-face-1    :foreground mi-accent-sec    :background nil :weight 'bold)
   (ivy-minibuffer-match-face-2    :foreground mi-accent-primary :background nil :weight 'bold)
   (ivy-minibuffer-match-face-3    :foreground mi-amber          :background nil :weight 'bold)
   (ivy-minibuffer-match-face-4    :foreground mi-orange         :background nil :weight 'bold)
   (ivy-minibuffer-match-highlight :foreground mi-signature :weight 'bold)
   (ivy-posframe                   :background modeline-bg-alt)

   ;; Helm
   (helm-selection :foreground mi-shadow :weight 'bold :background mi-accent-primary)

   ;; Markdown
   (markdown-markup-face           :foreground mi-text-muted)
   (markdown-header-face           :inherit 'bold :foreground mi-amber)
   ((markdown-code-face &override) :background mi-surface)

   ;; Org
   (org-block            :background (doom-blend mi-accent-primary mi-base 0.06) :extend t)
   (org-block-background :background (doom-blend mi-accent-primary mi-base 0.06))
   (org-block-begin-line :background (doom-blend mi-accent-primary mi-base 0.10) :foreground comments :extend t)
   (org-block-end-line   :background (doom-blend mi-accent-primary mi-base 0.10) :foreground comments :extend t)
   (org-level-1 :foreground mi-amber)
   (org-level-2 :foreground mi-accent-sec)
   (org-level-3 :foreground mi-accent-primary)
   (org-level-4 :foreground mi-orange)
   (org-level-5 :foreground mi-amber)
   (org-level-6 :foreground mi-accent-sec)
   (org-level-7 :foreground mi-accent-primary)
   (org-level-8 :foreground mi-orange)

   ;; Swiper
   (swiper-line-face    :background mi-surface-hl)
   (swiper-match-face-1 :inherit 'ivy-minibuffer-match-face-1)
   (swiper-match-face-2 :inherit 'ivy-minibuffer-match-face-2)
   (swiper-match-face-3 :inherit 'ivy-minibuffer-match-face-3)
   (swiper-match-face-4 :inherit 'ivy-minibuffer-match-face-4)

   ;; Solaire
   (solaire-mode-line-face
    :inherit 'mode-line
    :background modeline-bg-alt
    :box (if modeline-pad `(:line-width ,modeline-pad :color ,modeline-bg-alt)))
   (solaire-mode-line-inactive-face
    :inherit 'mode-line-inactive
    :background modeline-bg-inactive-alt
    :box (if modeline-pad `(:line-width ,modeline-pad :color ,modeline-bg-inactive-alt)))

   ;; Widget
   (widget-field             :foreground mi-text :background mi-surface-hl)
   (widget-single-line-field :foreground mi-text :background mi-surface-hl)

   ;; CSS / SCSS
   (css-proprietary-property :foreground mi-special)
   (css-property             :foreground mi-accent-sec)
   (css-selector             :foreground mi-accent-primary)))

;;; doom-miasma-theme.el ends here
