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

    # initialize python version management
    pyenv init - | source

    # map Ctrl-z to bring last suspended job to foreground
    bind \cz "fg 2>/dev/null; commandline -f repaint"

    # customize fzf.fish key bindings
    fzf_configure_bindings --directory=\ct --history=\ch

    # limit fzf.fish to files only; include hidden files, but not .git
    set fzf_fd_opts --type f --hidden --exclude=.git

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

    # loop through installed Ollama models and pull latest
    function update_ollama_models
        ollama list | awk 'NR>1 {print $1}' | xargs -I {} sh -c 'echo "Updating model: {}"; ollama pull {}; echo "--"' && echo "All models updated."
    end

    # set Ollama server for use with Aider
    set -gx OLLAMA_API_BASE 'http://127.0.0.1:11434'

    # initialize prompt
    starship init fish | source
end
