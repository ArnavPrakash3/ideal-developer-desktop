# Ideal Developer Desktop — Pulse

A keyboard-first developer workspace with a consistent dark terminal theme, useful shortcuts, and a refreshable system monitor.

## What is included
- `dotfiles/bashrc_additions.sh` — dark, readable prompt and developer aliases.
- `scripts/system-status.sh` — refreshable CPU, RAM, and battery (or uptime fallback) status.
- `config/shortcuts.md` — recommended keyboard shortcuts and setup checklist.
- `screenshots/README.md` — checklist for adding genuine screenshots from your machine.

## Quick setup (Linux)
1. Open a terminal in this repository.
2. Make the status script executable:
   ```bash
   chmod +x scripts/system-status.sh
   ```
3. Run it:
   ```bash
   ./scripts/system-status.sh
   ```
4. Add the prompt/aliases to your shell by appending the file to your existing Bash config:
   ```bash
   cat dotfiles/bashrc_additions.sh >> ~/.bashrc
   source ~/.bashrc
   ```
   This appends the configuration instead of replacing your existing `.bashrc`.
5. Set the terminal profile to a dark background with readable text. Use the same accent color in your launcher/status bar if your desktop environment supports it.
6. Configure the shortcuts in `config/shortcuts.md` using your desktop's Keyboard Shortcuts settings.
7. Capture screenshots of your actual terminal, shortcuts settings, and status script. Put them in `screenshots/`.

## Suggested screenshots
- `screenshots/terminal-theme.png`
- `screenshots/system-status.png`
- `screenshots/keyboard-shortcuts.png`
- `screenshots/desktop-overview.png`

Do not submit placeholder images. Capture the real setup on your computer.

## Notes
- The script uses Linux `/proc` data for CPU and RAM.
- Battery is read from `/sys/class/power_supply` when available. If no battery is detected, it displays uptime as an alternative metric.
- CPU usage is sampled briefly and the script refreshes every 2 seconds. Press `Ctrl+C` to exit.
- Desktop shortcuts and window decorations differ between GNOME, KDE, XFCE, and window managers; configure them in the settings for your environment.
