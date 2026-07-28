# dotfiles

🏠 Personal home directory configurations and custom system scripts for a minimal, keyboard-driven Linux setup (dwm-based).

## Structure

```
dottiles/
├── config/
│   ├── bat             # bat (cat replacement) config/theme
│   ├── dmenu          # dmenu configuration
│   ├── dunst           # notification daemon config
│   ├── dwm             # window manager config/patches
│   ├── dwmblocks       # statusbar blocks for dwm
│   ├── picom           # compositor config
│   ├── qutebrowser     # browser config
│   ├── rofi            # application launcher config
│   └── vscode          # VS Code settings/keybindings
├── install             # install script
├── kitty               # terminal emulator config
├── nvim/
│   └── colors           # custom colorschemes (e.g. react-theme.lua)
├── scripts/
│   ├── statusbar        # statusbar scripts
│   └── t                # misc helper script
├── tmux                 # tmux configuration
└── zshrc/
    ├── xinitrc            # X session startup config
    ├── xprofile           # X profile/env vars
    └── zshrc               # Zsh shell configuration
```

> Network utilities (formerly `tools/`) have moved to a separate repo: [JeddahSec/tools](https://github.com/JeddahSec/tools)

## What's inside

- **config/** – Configuration files for a lightweight DWM-based desktop: window manager, status bar, compositor, notifications, launcher, browser, plus `bat` (a `cat` replacement) and VS Code settings.
- **kitty/** – Fast, GPU-accelerated terminal emulator config.
- **nvim/** – Neovim setup (plugins, keybindings, editor config, and a custom colorscheme).
- **scripts/** – Custom shell scripts, including the status bar generator.
- **tmux/** – Terminal multiplexer configuration.
- **zshrc/** – Shell and X session files: `.zshrc`, `.xinitrc`, and `.xprofile`.
- **install** – Script to symlink/copy these configs into place on a fresh system.

> 🛠️ **Network tools** previously in `tools/` now live in their own repo: **[JeddahSec/tools](https://github.com/JeddahSec/tools)** (ARP scanning/spoofing, DNS/HTTP sniffing, ICMP scanning, MAC changing, port scanning).

## Installation

```bash
git clone https://github.com/JeddahSec/dotfiles.git
cd dotfiles
chmod +x install
./install
```

> Review the `install` script before running it, and back up any existing configs it might overwrite.

## Requirements

- A Linux distribution (Arch-based recommended)
- `dwm`, `dmenu`, `dunst`, `picom`, `rofi`, `qutebrowser`
- `kitty`, `neovim`, `tmux`, `zsh`, `bat`
- VS Code (optional, for the `config/vscode` settings)

## License

Feel free to fork and adapt these configs for your own setup. No warranty provided — use at your own risk.
