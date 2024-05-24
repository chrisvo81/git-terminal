#!/bin/bash

# Enable command autocompletion
autoload -Uz compinit
compinit

# Load version control information
autoload -Uz vcs_info
precmd_vcs_info() { vcs_info }
precmd_functions+=(precmd_vcs_info)

# Function to update PS1 with vcs_info
function precmd() {
    vcs_info
    BRANCH="${vcs_info_msg_0_#*\[}"
    BRANCH="${BRANCH%\]*}"
}

# Customize the prompt
setopt PROMPT_SUBST
PROMPT='%F{green}%n%f %F{135}%m%f %F{yellow}%1~%f %F{blue}(${BRANCH})%f %# '