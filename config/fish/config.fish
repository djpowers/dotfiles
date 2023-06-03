if status is-interactive
    # ensure homebrew is in path
    fish_add_path /opt/homebrew/bin
    fish_add_path /opt/homebrew/sbin

    # use the default theme
    fish_config theme choose "fish default"

    # set variables
    set -gx EDITOR hx
    set -gx BAT_THEME Nord
    set -gx LS_COLORS (vivid generate nord)

    # map Ctrl-z to bring last suspended job to foreground
    bind \cz "fg 2>/dev/null; commandline -f repaint"

    # customize fzf.fish key bindings
    fzf_configure_bindings --directory=\ct --history=\ch

    # set default source for fzf; respect gitignore
    set -gx FZF_DEFAULT_COMMAND 'fd --type f --strip-cwd-prefix --hidden --follow --exclude .git'

    # load nvm default packages
    set nvm_default_packages (head ~/.nvm/default-packages)

    # auto-switch node version via nvm.fish
    function __nvm_auto --on-variable PWD
        if nvm use --silent 2>/dev/null
            # nvm found compatibile version
        else
            nvm use # rerun to display error message
        end
    end
    __nvm_auto

    # initialize prompt
    starship init fish | source

    # set up tidelift infrastructure
    function tl
        set infra_path ~/tidelift/infra/tidelift.sh
        if test -f $infra_path
            bass source $infra_path \; tl $argv
        end
    end
end
