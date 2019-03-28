
function __git_clone_complete() {
    local cur=${COMP_WORDS[COMP_CWORD]}
    local AUTO_COMPLETE_DIRS=$(ls "$1")
    CDPATH=$1
    COMPREPLY=( $(compgen -d -- "$cur") )
}

function __git_ibm_clone_complete() {
    __git_clone_complete "$IBM_SRC_PATH"
}

function __gh_clone() {
  local parent=$0
  local name=$1
  local owner=$2
  local nwo=$3
  local dir=$4
  local host=$5

  ([ -e "$dir" ] || git clone "git@$host:$nwo" "$dir") && cd "$dir"
}

function gd {
  local parent=$(dirname "$1")
  local name=$(basename "$1")
  local owner=$(basename "$parent")
  local nwo="$owner/$name"
  local dir="$SRC_PATH/$nwo"
  local host="github.com"

  __gh_clone $parent $name $owner $nwo $dir $host
}

function gcd {
  local parent=$(dirname "$1")
  local name=$(basename "$1")
  local owner=$(basename "$parent")
  local nwo="$owner/$name"
  local dir="/Users/ahemard/ibm_github/$nwo"
  local host="github.ibm.com"

  __gh_clone $parent $name $owner $nwo $dir $host
}

complete -F __git_compose_clone_complete "ogcd " -o bashdefault -o default
complete -F __git_ibm_clone_complete "gcd" -o bashdefault -o default
