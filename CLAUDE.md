# Neovim Config

## Keymap Convention (STRICT — follow always)

### Modifier Rules

| Modifier | Purpose | Example |
|---|---|---|
| `Ctrl + key` | Editor essentials — universal, high-frequency actions | `<C-s>` save, `<C-q>` quit, `<C-h/j/k/l>` window nav |
| `Alt + key` | UI panel toggles — open/close tools/panels | `<A-e>` file explorer, `<A-p>` find files, `<A-f>` grep |
| `[ / ] + key` | Navigate prev/next through items (vim idiom) | `[b`/`]b` buffers, `[d`/`]d` diagnostics, `[c`/`]c` git hunks |
| `Leader + ns + key` | Feature commands grouped by namespace | `<leader>lr` LSP rename, `<leader>sb` search buffers |
| `g + key` | Goto/jump to code locations (vim convention) | `gd` definition, `gr` references, `gD` declaration |
| No modifier | Vim motion overrides only when strictly better | `x` black-hole delete, visual `p` keep yank |

### Leader Namespaces

| Prefix | Namespace | Used for |
|---|---|---|
| `<leader>s` | **S**earch | Telescope pickers |
| `<leader>l` | **L**SP | LSP actions (rename, code action, symbols) |
| `<leader>t` | **T**oggle | Toggle features on/off |
| `<leader>b` | **B**uffer | Buffer management (delete, pin, etc.) |
| `<leader>g` | **G**it | Git operations (blame, stage, diff) |
| `<leader>d` | **D**ebug | DAP (breakpoints, stepping, UI) |
| `<leader>T` | **T**est | Run tests (neotest; jdtls for java) |
| `<leader>q` | (standalone) | Open diagnostic quickfix list |

### Hard Rules

1. Every keymap **must** have a `desc` (except vim-obvious ones like `<Esc>`)
2. Plugin keymaps stay in their plugin file; general keymaps go in `lua/keymaps.lua`
3. Never override important vim defaults (`Ctrl+c`, `Ctrl+[`, `Ctrl+r`, `Ctrl+o`, `Ctrl+i`, `H`, `L`)
4. `[/]` for cycling, `Alt` for panels, `Ctrl` for essentials, `Leader` for features — no exceptions
5. All `vim.keymap.set` calls must use `<cmd>...<CR>` format instead of `:...<CR>` where possible (silent, no command-line flash)

## File Structure

- `lua/keymaps.lua` — General editor keymaps (save, quit, windows, buffers, motions)
- `lua/plugins/<name>.lua` — Plugin-specific keymaps inside each plugin's config
