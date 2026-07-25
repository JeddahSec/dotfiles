# dotfiles

🏠 Personal home directory configurations and custom system scripts for a minimal, keyboard-driven Linux setup (dwm-based).

## Structure

```
dottiles/
├── config/
│   ├── dmenu          # dmenu configuration
│   ├── dunst           # notification daemon config
│   ├── dwm             # window manager config/patches
│   ├── dwmblocks       # statusbar blocks for dwm
│   ├── picom           # compositor config
│   ├── qutebrowser     # browser config
│   └── rofi            # application launcher config
├── install             # install script
├── kitty               # terminal emulator config
├── nvim                 # Neovim configuration
├── scripts/
│   ├── statusbar        # statusbar scripts
│   └── t                # misc helper script
├── tmux                 # tmux configuration
├── tools/
│   ├── arp_scan.py       # ARP network scanner
│   ├── arp_spoof.py      # ARP spoofing tool
│   ├── dns_sniffer.py    # DNS traffic sniffer
│   ├── icmp_scanner.py   # ICMP-based host scanner
│   ├── macchanger.py     # MAC address changer
│   └── port_scanner.py   # TCP port scanner
└── zshrc/
    ├── xinitrc            # X session startup config
    ├── xprofile           # X profile/env vars
    └── zshrc               # Zsh shell configuration
```

## What's inside

- **config/** – Configuration files for a lightweight DWM-based desktop: window manager, status bar, compositor, notifications, launcher, and browser.
- **kitty/** – Fast, GPU-accelerated terminal emulator config.
- **nvim/** – Neovim setup (plugins, keybindings, and editor config).
- **scripts/** – Custom shell scripts, including the status bar generator.
- **tmux/** – Terminal multiplexer configuration.
- **tools/** – Python-based network utilities (ARP scanning/spoofing, DNS sniffing, ICMP scanning, MAC changing, port scanning). ⚠️ Intended for authorized security testing and learning only — see [Disclaimer](#disclaimer).
- **zshrc/** – Shell and X session files: `.zshrc`, `.xinitrc`, and `.xprofile`.
- **install** – Script to symlink/copy these configs into place on a fresh system.

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
- `kitty`, `neovim`, `tmux`, `zsh`
- `python3` (for the tools in `tools/`)

## Disclaimer

The scripts under `tools/` (ARP scanning/spoofing, DNS sniffing, port/ICMP scanning, MAC changing) interact with network traffic and can disrupt or compromise systems you don't own. Use them only on networks and devices you own or have explicit permission to test. The author is not responsible for misuse.

## License

Feel free to fork and adapt these configs for your own setup. No warranty provided — use at your own risk.
