if status is-interactive
    set -Ux ANDROID_HOME ~/Android/Sdk
    fish_add_path ~/Android/Sdk/platform-tools
    fish_add_path ~/Android/Sdk/build-tools
    fish_add_path ~/.bun/bin
    fish_add_path ~/.vite-plus/bin

    /home/linuxbrew/.linuxbrew/bin/brew shellenv | source

    starship init fish | source
    fzf --fish | source

    set -U fish_greeting

    alias ls="eza -lah --icons --group-directories-first"
    alias v="nvim"
    alias lg="lazygit"
    alias nu="taze -Il --maturity-period 3"
    alias ns="nr start"
    alias nd="nr dev"
    alias nb="nr build"
    alias nde="na dedupe"
    alias cat="bat --plain"
    alias open="xdg-open"
    alias oc="opencode attach http://localhost:4096 -u matvey -p \"{{OPENCODE_SERVER_PASSWORD}}\" --dir ."
    alias mpv="/var/lib/flatpak/exports/bin/io.mpv.Mpv"

    function tmp
        set dir (mktemp -d)
        set session_name (basename $dir | string replace -a '.' '_')
        echo "Creating tmux session '$session_name' in $dir"
        echo $dir | wl-copy
        if set -q TMUX
            tmux new-session -d -s $session_name -c $dir
            tmux switch-client -t $session_name
        else
            tmux new-session -s $session_name -c $dir
        end
    end

    set -Ux FZF_DEFAULT_OPTS "\
--color=bg+:#313244,bg:#1e1e2e,spinner:#f5e0dc,hl:#f38ba8 \
--color=fg:#cdd6f4,header:#f38ba8,info:#cba6f7,pointer:#f5e0dc \
--color=marker:#b4befe,fg+:#cdd6f4,prompt:#cba6f7,hl+:#f38ba8 \
--color=selected-bg:#45475a \
--multi"

    set -Ux EDITOR nvim
    set -Ux VISUAL nvim
    set -Ux MANPAGER "nvim +Man!"
    set -Ux NI_DEFAULT_AGENT bun
    set -Ux NI_GLOBAL_AGENT http

    fish_vi_key_bindings

    enable_transience
end
