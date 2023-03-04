if status is-interactive
  # ensure homebrew is in path
  fish_add_path /opt/homebrew/bin

  # set variables
  set -gx EDITOR nvim

  # use the default theme
  fish_config theme choose "fish default"

  # auto-switch node version via nvm.fish
  function __nvm_auto --on-variable PWD
    nvm use --silent 2>/dev/null
  end
  __nvm_auto

  starship init fish | source
end
