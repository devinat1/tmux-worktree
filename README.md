# tmux-worktree

Tmux configuration with git worktree integration.

## Setup

```bash
ln -s ~/repos/tmux-worktree/tmux.conf ~/.tmux.conf
ln -s ~/repos/tmux-worktree/bin/tmux-worktree ~/.local/bin/tmux-worktree
tmux source-file ~/.tmux.conf
```

## What it does

When you create a new worktree (`prefix + g`, then `c`), it automatically:
- Creates a git worktree for the branch
- Copies all `.env*` files from your main worktree
- Runs `npm install` if a `package.json` exists
- Opens a new tmux window in the worktree directory
