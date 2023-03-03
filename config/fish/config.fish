set -gx EDITOR nvim
starship init fish | source

fish_add_path /opt/homebrew/bin

if status is-interactive
  # use the default theme
  fish_config theme choose "fish default"
end
