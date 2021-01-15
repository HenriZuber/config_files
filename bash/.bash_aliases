alias rmz_dns='sudo cp /home/klex/repos/resolv.conf /etc/resolv.conf'

# Enable color of ls and grep if available
if [ -x /usr/bin/dircolors ]; then
    test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
    alias ls='ls --color=auto'
    alias grep='grep --color=auto'
fi
alias ll='ls -ahlF'
alias la='ls -A'
alias tmux='tmux -2'
alias ping='prettyping --nolegend'


# Git aliases
alias ga='git add'
alias gc='git commit'
alias gd='git diff'
alias gs='git status'

# Docker aliases
alias dps='docker ps'
alias dpsa='docker ps -a'
alias docker_stop_all='docker stop $(docker ps -a -q)'
alias docker_rm_all='docker rm $(docker ps -a -q)'
alias docker_stop_rm_all='docker_stop_containers; docker_rm_containers'
alias docker_purge_images='docker rmi $(docker images | grep "^<none>" | awk "{print $3}")'
alias nvidia-smi-docker='nvidia-docker run --rm nvidia/cuda nvidia-smi'

docker-new-bash() {
    docker exec -t -i $1 /bin/bash
}
docker-new-bash-root() {
    docker exec -u 0 -t -i $1 /bin/bash
}
dcr() {
    docker-compose run --rm $1 /bin/bash -c "$2"
}

# Docker autocompletion
get_completions(){
    local completion COMP_CWORD COMP_LINE COMP_POINT COMP_WORDS COMPREPLY=()
    # load bash-completion if necessary
    declare -F _completion_loader &>/dev/null || {
        source /usr/share/bash-completion/bash_completion
    }
    COMP_LINE=$*
    COMP_POINT=${#COMP_LINE}
    eval set -- "$@"
    COMP_WORDS=("$@")
    # add '' to COMP_WORDS if the last character of the command line is a space
    [[ ${COMP_LINE[@]: -1} = ' ' ]] && COMP_WORDS+=('')
    # index of the last word
    COMP_CWORD=$(( ${#COMP_WORDS[@]} - 1 ))
    # determine completion function
    completion=$(complete -p "$1" 2>/dev/null | awk '{print $(NF-1)}')
    # run _completion_loader only if necessary
    [[ -n $completion ]] || {
        # load completion
        _completion_loader "$1"
        # detect completion
        completion=$(complete -p "$1" 2>/dev/null | awk '{print $(NF-1)}')
    }
    # ensure completion was detected
    [[ -n $completion ]] || return 1
    # execute completion function
    "$completion"
    # Return array of completions
    echo "${COMPREPLY[@]}"
}
_get-docker-containers(){
    local cur=${COMP_WORDS[COMP_CWORD]}
    local comp=$(get_completions 'docker attach ')
    COMPREPLY=( $(compgen -W "$comp" -- $cur) )
}
_get-compose-services(){
    local cur=${COMP_WORDS[COMP_CWORD]}
    local comp=$(get_completions 'docker-compose run ')
    COMPREPLY=( $(compgen -W "$comp" -- $cur) )
}
complete -F _get-docker-containers docker-new-bash
complete -F _get-docker-containers docker-new-bash-root
complete -F _get-compose-services dcr

# jq aliases
function jq_change_key {
    jq "to_entries |
        map(if .key == \"$1\"
            then . + {\"value\":\"$2\"}
            else .
            end) |
        from_entries"
}

function jq_add_key {
  jq --arg key "$2" ". + {\"$1\": \$key}"
}
