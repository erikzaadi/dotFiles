#!/bin/bash
SCRIPT_BASE="$( cd -P "$( dirname "$0" )" && pwd )"

#UBER hacky way to generate a star banner
STAR_LINE="`python -c 'import os;columns = os.popen("stty size", "r").read().split()[-1];print "*" * int(columns)'`"

function log_message
{
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
    git clone https://github.com/erikzaadi/dotFiles --recursive
    ${SCRIPT_BASE}/dotFiles/install.sh
    exit $?
else
    log_message "Updating dotFiles repo and submodules.."
    GIT_CMD_WITH_PATHS="git --git-dir=${SCRIPT_BASE}/.git --work-tree=${SCRIPT_BASE}"
    ${GIT_CMD_WITH_PATHS} pull origin master
    ${GIT_CMD_WITH_PATHS} submodule update --init
fi

if [[ ! -f ~/.envvars.rc ]]; then
    echo "export DOTFILESDIR=${SCRIPT_BASE}" > ~/.envvars.rc
fi

function symlink_for_pattern()
{
    PATTERN=$1
    ORIGIN=$2
    TARGET=$3
    for symlink in `${SCRIPT_BASE}/bin/g_or_native find ${ORIGIN} -name "*${PATTERN}"`; do
        TARGET_SYMLINK=$(basename ${symlink})
        TARGET_SYMLINK=$(echo ${TARGET_SYMLINK} | ${SCRIPT_BASE}/bin/g_or_native sed -e "s/${PATTERN}//g")
        ln -sf ${symlink} ~/.${TARGET_SYMLINK}
    done
}

log_message "Symlinking OS agnostic links.."

symlink_for_pattern ".symlink" ${SCRIPT_BASE} ~/
IS_MAC=1
if [[ "$(uname)" = "Darwin" ]]; then
    log_message "Symlinking Mac links.."
    symlink_for_pattern ".symlink-mac" ${SCRIPT_BASE} ~/
    log_message "Brewing ALL THE THINGS.."
    SWALLOW=$(brew tap phinze/homebrew-cask)
    SWALLOW=$(brew tap homebrew/dupes)
    for keg in $(cat ${SCRIPT_BASE}/mac/brew);do 
        brew install ${keg}
    done
    for cask in $(cat ${SCRIPT_BASE}/mac/cask);do
        brew cask install  ${cask}
    done
else
    IS_MAC=0
    log_message "Symlinking Ubuntu links.."
    symlink_for_pattern ".symlink-ubuntu" ${SCRIPT_BASE} ~/
    log_message "Apt-getting all the things"
    sudo apt-get update
    sudo apt-get install -y $(cat ${SCRIPT_BASE}/ubuntu/apt)
    sudo apt-get upgrade -y && sudo apt-get dist-upgrade -y && sudo apt-get autoremove -y
fi

log_message "Setting zsh (FTW) as shell"
ZSH=$(which zsh)
chsh ${ZSH}
sudo chsh ${ZSH}

if [[ ! -f ~/.nvm/nvm.sh ]];then 
    log_message "Installing nvm"
    curl https://raw.github.com/creationix/nvm/master/install.sh | sh
    source ~/.nvm/.nvm.sh
    #TODO Alter to take latest stable?
    nvm install 0.10
    nvm use 0.10
    nvm alias default 0.10
fi

if [[ ! -f ~/.rvm/scripts/rvm ]]; then
    log_message "Installing rvm"
    curl -sSL https://get.rvm.io | bash -s stable
    source ~/.rvm/scripts/rvm
fi

log_message "Installing node packages.."
npm i -g $(cat ${SCRIPT_BASE}/packages/node)

log_message "Installing ruby gems.."
gem install $(cat ${SCRIPT_BASE}/packages/ruby)

log_message "Installing python packages.."
if [[ ${IS_MAC} -eq 1 ]]; then
    pip install -r ${SCRIPT_BASE}/python/requirements.txt-mac
else
    pip install -r ${SCRIPT_BASE}/python/requirements.txt-ubuntu
fi

log_message "Installing vim bundles"
vim -c 'BundleInstall!' -c 'qa!'

log_message "Done, great success!!1"
