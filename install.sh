#!/bin/bash

set -euo pipefail

trap 'echo -e "\n\nInstallation interrupted by user"; exit 130' INT TERM

sudo -v

sudo hostnamectl set-hostname matvey-pc

brew install --quiet gh ripgrep eza bat node ffmpeg yt-dlp tokei btop lazygit difftastic tlrc opencode fd copyparty oven-sh/bun/bun neovim trash-cli taze ni vercel-cli starship tree-sitter-cli vite-plus

flatpak install -y --noninteractive --system flathub com.obsproject.Studio org.chromium.Chromium org.libreoffice.LibreOffice io.mpv.Mpv org.signal.Signal com.valvesoftware.Steam it.mijorus.gearlever

if [[ ! -d ~/AppImages ]]; then
  curl "https://api.github.com/repos/imputnet/helium-linux/releases/latest" | jq -r '.assets[] | select(.name | contains("x86_64.AppImage")) | .browser_download_url' | xargs curl -L -o /tmp/helium.AppImage

  curl "https://api.github.com/repos/pkgforge-dev/ghostty-appimage/releases/latest" | jq -r '.assets[] | select(.name | contains("x86_64.AppImage")) | .browser_download_url' | xargs curl -L -o /tmp/ghostty.AppImage

  mkdir -p ~/AppImages

  yes | flatpak run it.mijorus.gearlever --integrate /tmp/helium.AppImage
  yes | flatpak run it.mijorus.gearlever --integrate /tmp/ghostty.AppImage
fi

kwriteconfig6 --file kglobalshortcutsrc --group plasmashell --key "activate task manager entry 1" "none,,Activate Task Manager Entry 1"
kwriteconfig6 --file kglobalshortcutsrc --group plasmashell --key "activate task manager entry 2" "none,,Activate Task Manager Entry 2"
kwriteconfig6 --file kglobalshortcutsrc --group plasmashell --key "activate task manager entry 3" "none,,Activate Task Manager Entry 3"
kwriteconfig6 --file kglobalshortcutsrc --group plasmashell --key "activate task manager entry 4" "none,,Activate Task Manager Entry 4"
kwriteconfig6 --file kglobalshortcutsrc --group plasmashell --key "activate task manager entry 5" "none,,Activate Task Manager Entry 5"
kwriteconfig6 --file kglobalshortcutsrc --group plasmashell --key "activate task manager entry 6" "none,,Activate Task Manager Entry 6"
kwriteconfig6 --file kglobalshortcutsrc --group plasmashell --key "activate task manager entry 7" "none,,Activate Task Manager Entry 7"
kwriteconfig6 --file kglobalshortcutsrc --group plasmashell --key "activate task manager entry 8" "none,,Activate Task Manager Entry 8"
kwriteconfig6 --file kglobalshortcutsrc --group plasmashell --key "activate task manager entry 9" "none,,Activate Task Manager Entry 9"

kwriteconfig6 --file kwinrc --group "Desktops" --key "Number" 7

kwriteconfig6 --file kglobalshortcutsrc --group kwin --key "Switch to Desktop 1" "Meta+1,Meta+1,Switch to Desktop 1"
kwriteconfig6 --file kglobalshortcutsrc --group kwin --key "Switch to Desktop 2" "Meta+2,Meta+2,Switch to Desktop 2"
kwriteconfig6 --file kglobalshortcutsrc --group kwin --key "Switch to Desktop 3" "Meta+3,Meta+3,Switch to Desktop 3"
kwriteconfig6 --file kglobalshortcutsrc --group kwin --key "Switch to Desktop 4" "Meta+4,Meta+4,Switch to Desktop 4"
kwriteconfig6 --file kglobalshortcutsrc --group kwin --key "Switch to Desktop 5" "Meta+5,Meta+5,Switch to Desktop 5"
kwriteconfig6 --file kglobalshortcutsrc --group kwin --key "Switch to Desktop 6" "Meta+6,Meta+6,Switch to Desktop 6"
kwriteconfig6 --file kglobalshortcutsrc --group kwin --key "Switch to Desktop 7" "Meta+7,Meta+7,Switch to Desktop 7"
kwriteconfig6 --file kglobalshortcutsrc --group kwin --key "Switch to Desktop 8" "Meta+8,Meta+8,Switch to Desktop 8"
kwriteconfig6 --file kglobalshortcutsrc --group kwin --key "Switch to Desktop 9" "Meta+9,Meta+9,Switch to Desktop 9"

kwriteconfig6 --file kglobalshortcutsrc --group kwin --key "Window to Desktop 1" "Meta+!,Meta+!,Window to Desktop 1"
kwriteconfig6 --file kglobalshortcutsrc --group kwin --key "Window to Desktop 2" "Meta+@,Meta+@,Window to Desktop 2"
kwriteconfig6 --file kglobalshortcutsrc --group kwin --key "Window to Desktop 3" "Meta+#,Meta+#,Window to Desktop 3"
kwriteconfig6 --file kglobalshortcutsrc --group kwin --key "Window to Desktop 4" "Meta+$,Meta+$,Window to Desktop 4"
kwriteconfig6 --file kglobalshortcutsrc --group kwin --key "Window to Desktop 5" "Meta+%,Meta+%,Window to Desktop 5"
kwriteconfig6 --file kglobalshortcutsrc --group kwin --key "Window to Desktop 7" "Meta+^,Meta+^,Window to Desktop 6"
kwriteconfig6 --file kglobalshortcutsrc --group kwin --key "Window to Desktop 7" "Meta+&,Meta+&,Window to Desktop 7"
kwriteconfig6 --file kglobalshortcutsrc --group kwin --key "Window to Desktop 8" "Meta+*,Meta+*,Window to Desktop 8"
kwriteconfig6 --file kglobalshortcutsrc --group kwin --key "Window to Desktop 9" "Meta+(,Meta+(,Window to Desktop 9"

kwriteconfig6 --file kglobalshortcutsrc --group plasmashell --key "manage activities" "none,,Show Activity Switcher"
kwriteconfig6 --file kglobalshortcutsrc --group kwin --key "Window Close" "Meta+Q,Meta+Q,Close Window"

kwriteconfig6 --file kglobalshortcutsrc --group services --group ghostty.desktop --key "_launch" "Meta+Return"

kwriteconfig6 --file kglobalshortcutsrc --group services --group org.kde.spectacle.desktop --key "_launch" "Meta+Shift+S"
kwriteconfig6 --file kglobalshortcutsrc --group services --group org.kde.spectacle.desktop --key "RectangularRegionScreenShot" "Print"

kwriteconfig6 --file kglobalshortcutsrc --group org_kde_powerdevil --key "powerProfile" "Battery,Battery\tMeta+B,Switch Power Profile"
kwriteconfig6 --file kglobalshortcutsrc --group services --group helium.desktop --key "_launch" "Meta+B"

kwriteconfig6 --file kglobalshortcutsrc --group plasmashell --key "activate application launcher" "none,,Activate Application Launcher"
kwriteconfig6 --file kglobalshortcutsrc --group kwin --key "Overview" "Meta,Meta+W,Toggle Overview"

kwriteconfig6 --file kwinrc --group Plugins --key "slideEnabled" "false"
kwriteconfig6 --file kwinrc --group org.kde.kdecoration2 --key "ButtonsOnLeft" ""
kwriteconfig6 --file kwinrc --group org.kde.kdecoration2 --key "ButtonsOnRight" "X"
kwriteconfig6 --file dolphinrc --group General --key "RememberOpenedTabs" "false"

kwriteconfig6 --file kxkbrc --group Layout --key "DisplayName" ","
kwriteconfig6 --file kxkbrc --group Layout --key "LayoutList" "us,ru"
kwriteconfig6 --file kxkbrc --group Layout --key "Options" "grp:caps_toggle,grp:alt_shift_toggle"
kwriteconfig6 --file kxkbrc --group Layout --key "ResetOldOptions" "true"
kwriteconfig6 --file kxkbrc --group Layout --key "Use" "true"
kwriteconfig6 --file kxkbrc --group Layout --key "VariantList" ","

kwriteconfig6 --file kdeglobals --group "KDE" --key "AnimationDurationFactor" "0"
kwriteconfig6 --file kdeglobals --group "General" --key "TerminalApplication" "ghostty"
kwriteconfig6 --file kdeglobals --group "General" --key "TerminalService" "com.mitchellh.ghostty.desktop"

kwriteconfig6 --file kscreenlockerrc --group "Daemon" --key "RequirePassword" "false"
kwriteconfig6 --file ksmserverrc --group "General" --key "loginMode" "emptySession"

kwriteconfig6 --file PlasmaUserFeedback --group "Global" --key "FeedbackLevel" "64"

echo -e "[AC][SuspendAndShutdown]\nAutoSuspendAction=0" >~/.config/powerdevilrc

mkdir -p ~/.config/ghostty
cp ./config/ghostty ~/.config/ghostty/config

mkdir -p ~/.config/opencode
cp ./config/opencode.json ~/.config/opencode/opencode.json

cp ./config/tmux.conf ~/.tmux.conf

mkdir -p ~/.config/fish/themes
rm ~/.config/starship.toml
/var/home/linuxbrew/.linuxbrew/bin/starship config hostname.disabled true
/var/home/linuxbrew/.linuxbrew/bin/starship config username.disabled true

mkdir -p ~/.config/secrets
if [[ ! -f ~/.config/secrets/opencode-password ]]; then
  if [[ -f ~/.config/systemd/user/opencode-web.service ]]; then
    OPENCODE_PASSWORD="$(grep -oP 'OPENCODE_SERVER_PASSWORD=\K.*' ~/.config/systemd/user/opencode-web.service)"
  fi
  if [[ -z "$OPENCODE_PASSWORD" ]]; then
    OPENCODE_PASSWORD="$(openssl rand -base64 32)"
  fi
  printf 'OPENCODE_SERVER_PASSWORD=%s\n' "$OPENCODE_PASSWORD" >~/.config/secrets/opencode-password
  chmod 600 ~/.config/secrets/opencode-password
fi

if [[ ! -f ~/.config/systemd/user/opencode-web.service ]]; then
  mkdir -p ~/.config/systemd/user
  cp ./config/opencode-web.service ~/.config/systemd/user/opencode-web.service
  loginctl enable-linger "$USER"
  systemctl --user daemon-reload
  systemctl --user enable opencode-web
  systemctl --user start opencode-web
else
  cp ./config/opencode-web.service ~/.config/systemd/user/opencode-web.service
  systemctl --user daemon-reload
  systemctl --user restart opencode-web
fi

cp ./config/config.fish ~/.config/fish/config.fish
fish -c "fish_config theme choose catppuccin-mocha --color-theme=dark"

cp ./config/krunnerrc ~/.config

mkdir -p ~/dev/work
mkdir -p ~/dev/sandbox
mkdir -p ~/dev/projects
mkdir -p ~/dev/oss

cp -r ./config/git ~/.config

if [[ ! -d ~/.config/nvim ]] || [[ ! -f ~/.config/nvim/init.lua ]]; then
  echo "Setting up neovim configuration..."
  rm -rf ~/.config/nvim
  git clone --depth 1 https://github.com/LazyVim/starter ~/.config/nvim
  rm -rf ~/.config/nvim/.git
  cp ./config/nvim.lua ~/.config/nvim/lua/plugins
  sed -i 's/notify = false/notify = true/g' ~/.config/nvim/lua/config/lazy.lua
fi

mkdir -p ~/.local/bin
mkdir -p ~/.config/tmux-sessionizer
wget "https://raw.githubusercontent.com/ThePrimeagen/tmux-sessionizer/refs/heads/master/tmux-sessionizer" -O ~/.local/bin/tmux-sessionizer
cp ./config/tmux-sessionizer.conf ~/.config/tmux-sessionizer
chmod +x ~/.local/bin/tmux-sessionizer

fish -c "/home/linuxbrew/.linuxbrew/bin/bun completions"
/var/home/linuxbrew/.linuxbrew/bin/nr --completion-fish >~/.config/fish/completions/nr.fish
