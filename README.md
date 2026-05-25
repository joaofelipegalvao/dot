# Dotfiles managed with Chezmoi + Bitwarden

This repository contains my configuration files (dotfiles) used in my Linux environment.  
All configuration is managed by **Chezmoi**, with sensitive data loaded via **Bitwarden CLI**.

## Prerequisites

- [Chezmoi](https://www.chezmoi.io/install/) installed
- Bitwarden CLI (`bw`) configured and logged in

## Installation

You can fork this project to create your own set of configurations.  
After that, install Chezmoi and initialize it like this:

```sh
chezmoi init --apply joaofelipegalvao
```

During initialization, you'll be prompted for information that will be saved in:

```sh
cat ~/.config/chezmoi/chezmoi.toml
```

All tracked templates and files are located here:

```sh
ls ~/.local/share/chezmoi
```

The idea is that Chezmoi uses templates like `dot_config/git/config.tmpl`, merging them with data from `chezmoi.toml`, ultimately generating the actual file in the correct location, such as:

```
~/.config/git/config
```

## Editing your templates

Always remember to edit the **templates**, never the generated files.

Chezmoi provides useful tools:

```sh
chezmoi cd             # enters the main dotfiles directory
chezmoi edit ~/.zshrc  # opens the corresponding template in your editor
```

## Adding new dotfiles

If you create a new configuration file — for example, you started using Tmux or Yazi — add it like this:

```sh
chezmoi add --autotemplate ~/.config/yazi/yazi.toml
```

The `--autotemplate` flag makes Chezmoi automatically identify parts that should become template variables.

## Working with sensitive data (Bitwarden)

Sensitive information that **should not go to GitHub** must be stored via Bitwarden.

Example template using Bitwarden CLI:

```
{{- $item := bitwarden "item" "<bitwarden-item-uuid>" -}}
{{- if not $item -}}
{{-   fail "Bitwarden item not found" -}}
{{- end -}}
export MY_API_KEY="{{ $item.login.password }}"
```

To view all data being used by Chezmoi:

```sh
chezmoi data
```

## Updating your environment

Whenever you change a template or data file:

```sh
chezmoi apply
```

To pull updates from the remote repository:

```sh
chezmoi update
```

## Syncing system changes back to chezmoi

If you edit files directly in `~/.config/` (outside chezmoi), sync them back with:

```sh
chezmoi re-add
```

This updates `~/.local/share/chezmoi` with the current state of your system files.

## Saving changes to the repository

After updating your dotfiles:

```sh
chezmoi cd
git add .
git commit -m "Update dotfiles"
git push
```

## Repository structure

```
dot_config/
├── git/          # Git configuration
├── mise/         # Runtime version manager
├── nvim/         # Neovim (LazyVim)
├── tmux/         # Terminal multiplexer
├── yazi/         # File manager
└── zsh/          # Shell and prompt
```

Each directory automatically maps to `~/.config/*` when Chezmoi applies the changes.

## About

Repository containing my configuration files managed with Chezmoi and Bitwarden.
