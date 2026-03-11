# init.lua

## System dependencies

- `neovim` (0.10+ recommended)
- `git` (used by `lazy.nvim`, fugitive, gitsigns)
- `ripgrep` (`rg`) for Telescope live grep and `:grep`
- `fd` for Telescope file finding
- `make` for building `telescope-fzf-native`
- a C toolchain (`gcc`/`clang` + standard build tools) for native plugin builds

## Required language toolchains (for Mason-managed tools)

These are required so Mason can install/maintain formatters and language tooling:

- `npm`
- `go`
- `cargo`
- `pip`

## Optional but recommended

- `fzf`/`zf (can also be used with Telescope/fzf/zf workflows alongside `telescope-fzf-native`/`telescope-zf-native`)
