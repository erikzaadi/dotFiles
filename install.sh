#!/bin/bash
SCRIPT_BASE="$(cd -P "$(dirname "$0")" && pwd)"
export PATH=${PATH}:${SCRIPT_BASE}/bin

#UBER hacky way to generate a star banner
STAR_LINE="$(python -c 'import os;columns = os.popen("stty size", "r").read().split()[-1];print "*" * int(columns)')"

function log_message {
  echo """${STAR_LINE}

    $1

${STAR_LINE}"""
}

log_message """


  /\\/|      _       _   ______ _ _
 |/\\/      | |     | | |  ____(_) |
         __| | ___ | |_| |__   _| | ___  ___
        / _\` |/ _ \\| __|  __| | | |/ _ \\/ __|
       | (_| | (_) | |_| |    | | |  __/\\__ \\
        \\__,_|\\___/ \\__|_|    |_|_|\\___||___/

"""

if [[ ! -d ${SCRIPT_BASE}/.git ]]; then
  log_message "Not in git repo, cloning.."
  git clone --recurse-submodules https://github.com/erikzaadi/dotFiles
  ${SCRIPT_BASE}/dotFiles/install.sh
  exit $?
else
  log_message "Updating dotFiles repo and submodules.."
  GIT_CMD_WITH_PATHS="git --git-dir=${SCRIPT_BASE}/.git --work-tree=${SCRIPT_BASE}"
  ${GIT_CMD_WITH_PATHS} pull origin master
  ${GIT_CMD_WITH_PATHS} submodules init --recursive
fi

ENVARS_FILE=~/.envvars.rc

if [[ ! -f ${ENVARS_FILE} ]]; then
  echo "export DOTFILESDIR=${SCRIPT_BASE}" > ${ENVARS_FILE}
else
  if [[ ! $(cat ${ENVARS_FILE} | grep DOTFILESDIR) ]]; then
    echo "export DOTFILESDIR=${SCRIPT_BASE}" >> ${ENVARS_FILE}
  else
    sed -i ${ENVARS_FILE} -e "s/export\sDOTFILESDIR=.*$/export DOTFILESDIR=${SCRIPT_BASE}/"
  fi
fi

function symlink_for_pattern() {
  PATTERN=$1
  ORIGIN=$2
  TARGET=$3
  for symlink in $(${SCRIPT_BASE}/bin/g_or_native find ${ORIGIN} -name "*${PATTERN}"); do
    TARGET_SYMLINK=$(basename ${symlink})
    TARGET_SYMLINK=$(echo ${TARGET_SYMLINK} | ${SCRIPT_BASE}/bin/g_or_native sed -e "s/${PATTERN}//g")
    ln -sf ${symlink} ~/.${TARGET_SYMLINK}
  done
}


ln -s ${SCRIPT_BASE}/kitty/kitty.conf ~/.config/kitty/kitty.conf
ln -s ${SCRIPT_BASE}/deps/kitty_gruvbox_theme ~/.config/kitty/theme

log_message "Symlinking OS agnostic links.."

symlink_for_pattern ".symlink" ${SCRIPT_BASE} ~/
symlink_for_pattern "\*" ${SCRIPT_BASE}/config ~/config

if [[ "$(uname)" = "Darwin" ]]; then
  log_message "Symlinking Mac links.."
  symlink_for_pattern ".symlink-mac" ${SCRIPT_BASE} ~/
  log_message "Brewing ALL THE THINGS.."
  xcode-select --install
  if [[ ! $(which brew) ]]; then
    ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
  fi
#   for tap in $(cat ${SCRIPT_BASE}/mac/tap); do
#    brew tap ${tap}
#  done
#  for keg in $(cat ${SCRIPT_BASE}/mac/brew); do
#    brew install ${keg}
#  done
#  for cask in $(cat ${SCRIPT_BASE}/mac/cask); do
#    brew install ${cask}
#  done

#  if [[ ! -f ~/.pyenv ]]; then
#    curl -L https://github.com/pyenv/pyenv-installer/raw/master/bin/pyenv-installer | bash
#    OPENSSL_PREFIX=$(brew --prefix openssl)
#    CONFIGURE_OPTS="-with-openssl=${OPENSSL_PREFIX}" pyenv install 3.9
#
#    pyenv virtualenv 3.9 neovim3
#    pyenv activate neovim3
#    pip install neovim flake8 anakin-language-server
#    pyenv which python # Note the path
#  fi

  #    log_message "Setting custom OS-X Settings.."
  #    bash ${SCRIPT_BASE}/mac/osx-settings
#  log_message "Installing python packages.."
#  pip install -r ${SCRIPT_BASE}/python/requirements.txt-mac
else
  log_message "Installing Antibody for zsh (FTW)"
  curl -s https://raw.githubusercontent.com/getantibody/installer/master/install | bash -s
  log_message "Symlinking Ubuntu links.."
  symlink_for_pattern ".symlink-ubuntu" ${SCRIPT_BASE} ~/
  log_message "apt-get ALL THE THINGS.."
  sudo apt-get update
  sudo apt-get install -y $(cat ${SCRIPT_BASE}/ubuntu/apt)
  sudo apt-get upgrade -y && sudo apt-get dist-upgrade -y && sudo apt-get autoremove -y
  log_message "Installing python packages.."
  sudo pip install -r ${SCRIPT_BASE}/python/requirements.txt-ubuntu
fi

if [[ "${SHELL}" != */zsh ]]; then
  log_message "Setting zsh (FTW) as shell.."
  ZSH=$(which zsh)
  chsh -s ${ZSH}
  sudo chsh -s ${ZSH}
fi

#if [[ ! -f ~/.nvm/nvm.sh ]]; then
#  log_message "Installing nvm and node v${LATEST_STABLE_NODE}"
#  git clone https://github.com/creationix/nvm.git ~/.nvm
#  source ~/.nvm/nvm.sh
#fi
#
#nvm install lastest
#nvm use node
#nvm alias default node

log_message "Installing node packages.."
#npm i -g $(cat ${SCRIPT_BASE}/node/packages | tr '\n' ' ')

log_message "Installing (Neo)Vim Packages.."
#nvim --headless -c 'autocmd User PackerComplete quitall' -c 'PackerSync'
#nvim --headless -c 'UpdateRemotePlugins | qa'

log_message "Done, great success!!1"
