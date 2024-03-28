if status --is-login
  set -gx PATH $PATH /opt/homebrew/bin
end
if status is-interactive
    # Commands to run in interactive sessions can go here
end


set -g theme_powerline_fonts yes
set -g theme_nerd_fonts yes
set -g theme_display_git_stashed_verbose yes
set -g theme_display_git_master_branch yes
set -g theme_display_git_untracked yes
set -g theme_display_git_dirty yes
set -g theme_display_nvm yes
set -g theme_display_virtualenv yes
set -g theme_color_scheme zenburn

set fish_greeting ""

# Aliases
alias cp="cp -v"
alias mv="mv -v"
#alias ls="exa"
#alias ll="exa --all --long --header --icons"
#alias lg="exa --all --long --header --icons --git"
#alias tree="exa --tree"
alias cat="bat --theme=gruvbox-dark"


# Env variables
set -Ux EDITOR "nvim"


starship init fish | source
zoxide init --cmd cd fish | source
