set -gx EDITOR nvim
starship init fish | source

if status is-interactive
  # use the default theme
  fish_config theme choose "fish default"
end
