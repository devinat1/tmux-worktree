# tmux-worktree

Tmux configuration with git worktree integration.

## Setup

```bash
ln -s ~/Desktop/projects/tmux-worktree/tmux.conf ~/.tmux.conf
ln -s ~/Desktop/projects/tmux-worktree/bin/tmux-worktree ~/.local/bin/tmux-worktree
tmux source-file ~/.tmux.conf
```

## What it does

When you create a new worktree (`prefix + g`, then `c`), it automatically:
- Creates a git worktree for the branch
- Copies all `.env*` files from your main worktree
- Runs `npm install` if a `package.json` exists
- Opens a new tmux window in the worktree directory

## Pane Management

| Action | Keybinding |
|--------|------------|
| Split horizontal | `\|` or `v` |
| Split vertical | `-` or `s` |
| Navigate panes | `h/j/k` (vim-style left/down/up) |
| Resize panes | `H/J/K/L` |
| Even-horizontal layout | `b` |

## Window Management

| Action | Keybinding |
|--------|------------|
| New window | `c` |
| Next window | `n` |
| Previous window | `p` |
| Last window | `l` or `;` |
| Rename window | `,` |
| Close window | `&` |

## Git Worktree Integration

| Action | Keybinding |
|--------|------------|
| Fuzzy picker (switch worktree) | `w` |
| List worktrees | `W` |
| New worktree | `g c` |
| Switch worktree (by name) | `g s` |
| List worktrees (popup) | `g l` |
| Remove worktree (by name) | `g r` |
| Remove worktree (fuzzy) | `g x` |

## Command Line

```bash
tmux-worktree new <branch>      # Create worktree + tmux window
tmux-worktree pick              # Fuzzy picker to switch
tmux-worktree pick-remove       # Fuzzy picker to remove
tmux-worktree list              # List all worktrees
tmux-worktree switch <branch>   # Switch to worktree
tmux-worktree remove <branch>   # Remove worktree
```

## Session Management

| Action | Keybinding |
|--------|------------|
| New session | `S` |
| Previous session | `(` |
| Next session | `)` |
| Detach | `d` |

## Other

| Action | Keybinding |
|--------|------------|
| Reload config | `r` |
| Copy mode (vim) | `[` or `Escape` |
| Paste | `]` |
