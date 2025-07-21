#!/bin/bash
sudo -v

sudo hostnamectl set-hostname matvey-pc

# install ghostty
. /etc/os-release
curl -fsSL "https://copr.fedorainfracloud.org/coprs/scottames/ghostty/repo/fedora-${VERSION_ID}/scottames-ghostty-fedora-${VERSION_ID}.repo" | sudo tee /etc/yum.repos.d/_copr:copr.fedorainfracloud.org:scottames:ghostty.repo >/dev/null
rpm-ostree refresh-md
rpm-ostree install ghostty

brew install gh ripgrep eza bat node ffmpeg yt-dlp tokei btop lazygit difftastic tlrc static-web-server sst/tap/opencode pnpm

curl -fsSL https://bun.sh/install | bash

flatpak install -y --noninteractive flathub com.obsproject.Studio org.chromium.Chromium org.libreoffice.LibreOffice io.mpv.Mpv com.google.AndroidStudio org.qbittorrent.qBittorrent org.signal.Signal com.system76.Popsicle com.valvesoftware.Steam

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

kwriteconfig6 --file kglobalshortcutsrc --group services --group com.mitchellh.ghostty.desktop --key "_launch" "Meta+Return"

kwriteconfig6 --file kglobalshortcutsrc --group services --group org.kde.spectacle.desktop --key "_launch" "Meta+Shift+S"
kwriteconfig6 --file kglobalshortcutsrc --group services --group org.kde.spectacle.desktop --key "RectangularRegionScreenShot" "Print"

kwriteconfig6 --file kglobalshortcutsrc --group org_kde_powerdevil --key "powerProfile" "Battery,Battery\tMeta+B,Switch Power Profile"
kwriteconfig6 --file kglobalshortcutsrc --group services --group org.chromium.Chromium.desktop --key "_launch" "Meta+B"

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

kwriteconfig6 --file kdeglobals --group "KDE" --key "AnimationDurationFacto" "0"
kwriteconfig6 --file kdeglobals --group "General" --key "TerminalApplication" "ghostty"
kwriteconfig6 --file kdeglobals --group "General" --key "TerminalService" "com.mitchellh.ghostty.desktop"

kwriteconfig6 --file kscreenlockerrc --group "Deamon" --key "RequirePassword" "false"
kwriteconfig6 --file ksmserverrc --group "General" --key "loginMode" "emptySession"

mkdir -p ~/.config/ghostty
cp ./config/ghostty ~/.config/ghostty/config

rm -rf ~/.config/tmux/plugins/catppuccin
mkdir -p ~/.config/tmux/plugins/catppuccin
git clone --depth 1 https://github.com/catppuccin/tmux.git ~/.config/tmux/plugins/catppuccin/tmux
cp ./config/tmux.conf ~/.tmux.conf

mkdir -p ~/.config/fish/themes
rm ~/.config/starship.toml
starship preset nerd-font-symbols -o ~/.config/starship.toml
wget "https://raw.githubusercontent.com/catppuccin/fish/refs/heads/main/themes/Catppuccin%20Mocha.theme" -O ~/.config/fish/themes/Catppuccin\ Mocha.theme
cp ./config/config.fish ~/.config/fish
fish -c "yes | fish_config theme save \"Catppuccin Mocha\""

cp ./config/krunnerrc ~/.config
cp ./config/mimemaps.list ~/.config

mkdir -p ~/dev/work
mkdir -p ~/dev/sandbox
mkdir -p ~/dev/projects
mkdir -p ~/dev/oss

cp -r ./config/git ~/.config

rm -rf ~/.config/nvim
git clone --depth 1 https://github.com/LazyVim/starter ~/.config/nvim
rm -rf ~/.config/nvim/.git
cp ./config/nvim.lua ~/.config/nvim/lua/plugins

mkdir -p ~/.local/bin
mkdir -p ~/.config/tmux-sessionizer
wget "https://raw.githubusercontent.com/ThePrimeagen/tmux-sessionizer/refs/heads/master/tmux-sessionizer" -O ~/.local/bin/tmux-sessionizer
cp ./config/tmux-sessionizer.conf ~/.config/tmux-sessionizer
chmod +x ~/.local/bin/tmux-sessionizer

~/.bun/bin/bun i -g @antfu/ni taze
