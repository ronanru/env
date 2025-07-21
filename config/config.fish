if status is-interactive
    set -Ux ANDROID_HOME "~/Android/sdk"
    fish_add_path ~/Android/sdk/platform-tools
    fish_add_path ~/Android/sdk/build-tools
    fish_add_path ~/.bun/bin
    fish_add_path ~

    /home/linuxbrew/.linuxbrew/bin/brew shellenv | source

    starship init fish | source
    fzf --fish | source

    set -U fish_greeting

    alias ls="eza -lah --icons --group-directories-first"
    alias v="nvim"
    alias lg="lazygit"
    alias nu="taze -Il"
    alias nd="nr dev"
    alias nb="nr build"
    alias nde="na dedupe"
    alias cat="bat --plain"

    function cdtemp
        set dir (mktemp -d)
        builtin cd $dir
        echo "You are now in $dir"
        echo $dir | wl-copy
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

    fish_vi_key_bindings
end
