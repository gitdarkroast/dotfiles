if status is-interactive
    # Commands to run in interactive sessions can go here
end

# Fish git prompt
set __fish_git_prompt_showdirtystate yes
set __fish_git_prompt_showstashstate yes
set __fish_git_prompt_showuntrackedfiles yes
set __fish_git_prompt_showupstream yes
set __fish_git_prompt_color_branch yellow
set __fish_git_prompt_color_upstream_ahead green
set __fish_git_prompt_color_upstream_behind red

# Status Chars
set __fish_git_prompt_char_dirtystate '⚡'
set __fish_git_prompt_char_stagedstate '→'
set __fish_git_prompt_char_untrackedfiles '☡'
set __fish_git_prompt_char_stashstate '↩'
set __fish_git_prompt_char_upstream_ahead '+'
set __fish_git_prompt_char_upstream_behind -

set fish_greeting ""

# Aliases
alias cp="cp -v"
alias mv="mv -v"
alias ls="exa"
alias ll="exa --all --long --header --icons"
alias lg="exa --all --long --header --icons --git"
alias tree="exa --tree"
alias cat="bat --theme=gruvbox-dark"


# Env variables
set -Ux EDITOR "nvim"


starship init fish | source
zoxide init --cmd cd fish | source
