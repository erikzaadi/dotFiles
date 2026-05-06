# dotFiles

Erik's personal dotfiles for macOS/Ubuntu. Not meant for direct installation — borrow snippets, don't run install.sh on your machine.

## How it works

Symlink-based installation via `install.sh`:
- `*.symlink` → `~/.filename` (all platforms)
- `*.symlink-mac` → `~/.filename` (macOS only)
- `*.symlink-ubuntu` → `~/.filename` (Linux only)
- `config/*` → `~/.config/` (XDG)

The install script writes `~/.envvars.rc` exporting `DOTFILESDIR` (the repo root). Scripts and configs reference `${DOTFILESDIR}` to stay portable.

## Neovim

Config entry: `nvim/init.lua` — requires these modules in order:
- `lua/plugs.lua` — plugin specs (lazy.nvim)
- `lua/plugconfs.lua` — plugin configuration, LSP setup, completion
- `lua/keymaps.lua` — keybindings via nvim-mapper
- `lua/filetypes.lua` — filetype-specific overrides
- `lua/defaults.lua` — vim options

**Adding a plugin:** add a spec to `lua/plugs.lua`, configure in `lua/plugconfs.lua`, keybind in `lua/keymaps.lua`. Run `:Lazy sync` inside Neovim to install; commit the updated `lazy-lock.json`.

**Adding an LSP server:** add the server name to the `lsp_servers` list in `lua/plugconfs.lua`, add any server-specific opts in the `lsp_opts` table below it.

**Adding a keymap:** use the `map()` helper in `keymaps.lua`. Signature: `map(mode, keyMap, command, description, category, opts)`. The `command` arg can be a string (`"<cmd>...<cr>"`) or a Lua function.

**Leader key:** `<Space>`

**Formatter:** guard.nvim. TypeScript/JS uses ESLint + Prettier. Other languages use LSP formatting via `<leader>i`.

**Test files in repo root** (`test.py`, `test.ts`, etc.) exist for filetype/LSP smoke-testing — not unit tests, don't delete them.

## Zsh

Entry point: `zsh/zshrc.symlink-{mac,ubuntu}` → sources `zsh/zshrc` → sources `zsh/defaults`.

Plugin manager: **Antidote**. Plugin list: `zsh/plugins`.

Path order (macOS): `bin-mac` → `$GOPATH/bin` → Homebrew gnubin → `~/.bin` → `~/.local/bin`

**Cross-platform tool compatibility:** scripts use `g_or_native` (in `bin/`) to prefer GNU coreutils (`gfind`, `gsed`) and fall back to BSD native tools. Use it in new scripts that need portable `find`/`sed`/`xargs`.

## Git

Config: `git/gitconfig.symlink`. 40+ aliases — run `git list-aliases` to see them all.

Notable ones:
- `git pushu` — push with upstream tracking set
- `git micdrop` — delete branch locally and remotely
- `git ragecommit` — commit with a random emoticon message
- `git fnm` — fetch + merge origin/main
- `git rbm` — rebase interactively origin/main
- `git cleanup-local-merged` — prune merged local branches

Diff tool: **difftastic** (structural, not line-based). Pager: **diff-so-fancy**.

## Claude Code integration

The `c()` zsh function and the `<leader>cr` Neovim keymap both implement smart session resumption:
1. Read `.claude_session` in cwd (written by the Claude Code CLI on exit)
2. Extract the session ID and verify the corresponding `.jsonl` file exists in `$CLAUDE_CONFIG_DIR/projects/<encoded-cwd>/`
3. Resume if valid; start fresh (and clean up stale `.claude_session`) if not

The encoding matches what the CLI uses: replace all non-alphanumeric characters with `-`.

`claude-personal` alias uses a separate `CLAUDE_CONFIG_DIR` for a personal account.

## Adding new configs for a new tool

1. Create `<tool>/` directory with config files
2. Name the main config `<something>.symlink` (or `.symlink-mac`)
3. Add symlink logic to `install.sh` if the target path is non-standard
4. For XDG configs, put them under `config/<tool>/` — they're linked automatically

## What not to do

- Don't run `install.sh` in CI or on unfamiliar machines — it mutates `~/.zshrc`, sets the default shell, and installs system tools
- Don't commit secrets to `karabiner/karabiner.json` (file is mode 600 for a reason)
- Don't add plugins that duplicate existing functionality — check `lua/plugs.lua` before adding anything in the LSP/completion/git/telescope space
