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
alias ls="eza --icons=always"
#alias ll="exa --all --long --header --icons"
#alias lg="exa --all --long --header --icons --git"
#alias tree="exa --tree"
alias cat="bat --theme=gruvbox-dark"


# Env variables
set -Ux EDITOR "nvim"
set -Ux AWS_PROFILE "bedrock"
set -Ux CLAUDE_CODE_USE_BEDROCK "1"

set -Ux GOPRIVATE "gitlab.failsafe.net/*"

set -gx ATLASSIAN_API_TOKEN (security find-generic-password -a $USER -s "ATLASSIAN_API_TOKEN" -w 2>/dev/null)
set -gx GITLAB_PERSONAL_ACCESS_TOKEN (security find-generic-password -a $USER -s "GITLAB_PERSONAL_ACCESS_TOKEN" -w 2>/dev/null)


starship init fish | source
zoxide init fish | source
fzf --fish | source

set -x GPG_TTY $(TTY)
/opt/homebrew/bin/gpg-agent --daemon
export PATH="$HOME/.local/bin:$PATH"
