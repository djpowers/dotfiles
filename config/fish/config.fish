if status is-interactive
  # ensure homebrew is in path
  fish_add_path /opt/homebrew/bin

  # set variables
  set -gx EDITOR nvim

  # use the default theme
  fish_config theme choose "fish default"

  starship init fish | source
end
