if status is-interactive
  # ensure homebrew is in path
  fish_add_path /opt/homebrew/bin

  # use the default theme
  fish_config theme choose "fish default"

  # set variables
  set -gx EDITOR nvim

  # customize fzf.fish key bindings
  fzf_configure_bindings --directory=\ct --history=\ch

  # load nvm default packages
  set nvm_default_packages (head ~/.nvm/default-packages)

  # auto-switch node version via nvm.fish
  function __nvm_auto --on-variable PWD
    nvm use --silent 2>/dev/null
  end
  __nvm_auto

  starship init fish | source
end
