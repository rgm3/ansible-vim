#!/bin/bash

# A pure bash implementation of the playbook.
# It's... a lot more convenient for installing on the local system.

# shellcheck disable=SC2155
set -euo pipefail
IFS='\n\t'

REQUIREMENTS=("git" "vim" "curl")
target_user=$(id -un)
homedir=""
PLUG_URL="https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim"
VIMRC_URL="https://raw.githubusercontent.com/rgm3/ansible-vim/master/vimrc"

function main {
  # shellcheck disable=SC2230
  ! which "${REQUIREMENTS[@]}" &>/dev/null && die "missing one of: ${REQUIREMENTS[*]}"

  if [[ -n "${1:-}" ]]; then
    ! id "$1" &> /dev/null && die "invalid user: $1"
    target_user="$1"
  fi

  homedir=$(get_homedir "${target_user}")
  [[ -w "${homedir}" ]] || die "can't write to directory: ${homedir}"
  [[ -e ${homedir}/.vim ]] && die "${homedir}/.vim already exists"
  confirm "Install for ${target_user} in ${homedir}?" || return

  install_vim_settings
}

function install_vim_settings {
  mkdir -p "${homedir}/.vim/autoload"
  mkdir -p "${homedir}/.vim/undo"
  curl -so "${homedir}/.vim/autoload/plug.vim" "${PLUG_URL}"
  curl -so "${homedir}/.vimrc" "${VIMRC_URL}"

  local group=$(id -gn "${target_user}")
  chown -R "${target_user}":"${group}" "${homedir}/.vim"
  chown -R "${target_user}":"${group}" "${homedir}/.vimrc"

  if [[ ${target_user} == $(id -un) ]]; then
    vim +PlugInstall +qall
  else
    echo "User ${target_user} should run: vim +PlugInstall +qall"
  fi
}

function confirm {
  read -n1 -rp "$1 [y/n]: "
  echo
  [[ $REPLY =~ ^[Yy]$ ]]
}

function get_homedir {
  local user="$1"
  case "$(uname -s)" in
    Darwin) dscl . -read /users/"${user}" NFSHomeDirectory | awk -F': ' '{print $2}' ;;
    *) getent passwd "${user}" | cut -d: -f6 ;;
  esac
}

function die {
  [[ -n $1 ]] && >&2 echo "$1"
  exit "${2:-1}"
}

main "$@"
