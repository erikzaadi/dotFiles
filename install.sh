#!/bin/bash
SCRIPT_BASE="$( cd -P "$( dirname "$0" )" && pwd )"
if [[ ! -d ${SCRIPT_BASE}/.git ]]; then
    echo "Not in git repo, cloning"
    git clone https://github.com/erikzaadi/dotFiles --recursive
    ${SCRIPT_BASE}/dotFiles/install.sh
    exit $?
else
    echo "Updating dotFiles repo and submodules.."
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
    for symlink in `${SCRIPT_BASE}/bin/g_or_native.sh find ${ORIGIN} -name "*${PATTERN}"`; do
        TARGET_SYMLINK=$(basename ${symlink})
        TARGET_SYMLINK=$(echo ${TARGET_SYMLINK} | ${SCRIPT_BASE}/bin/g_or_native.sh sed -e "s/${PATTERN}//g")
        ln -sf ${symlink} ~/.${TARGET_SYMLINK}
    done
}

echo "Symlinking OS agnostic links.."
symlink_for_pattern ".symlink" ${SCRIPT_BASE} ~/
if [[ "$(uname)" = "Darwin" ]]; then
    echo "Symlinking Mac links.."
    symlink_for_pattern ".symlink-mac" ${SCRIPT_BASE} ~/
    echo "Brewing ALL THE THINGS.."
    SWALLOW=$(brew tap phinze/homebrew-cask)
    SWALLOW=$(brew tap homebrew/dupes)
    for keg in $(cat ${SCRIPT_BASE}/mac/brew);do 
        brew install ${keg}
    done
    for cask in $(cat ${SCRIPT_BASE}/mac/cask);do
        brew cask install --force ${cask}
    done
else
    echo "Symlinking Linux links.."
    symlink_for_pattern ".symlink-linux" ${SCRIPT_BASE} ~/
    echo "Apt-getting all the things"
    sudo apt-get update
    sudo apt-get install -y $(cat ${SCRIPT_BASE}/linux/apt)
    sudo apt-get upgrade -y && sudo apt-get dist-upgrade -y && sudo apt-get autoremove -y
fi

echo "Setting zsh (FTW) as shell"
chsh /bin/zsh
sudo chsh /bin/zsh

if [[ ! -s ~/.nvm/nvm.sh ]];then 
    echo "Installing nvm"
    curl https://raw.github.com/creationix/nvm/master/install.sh | sh
    source ~/.nvm/.nvm.sh
    #TODO Alter to take latest stable?
    nvm install 0.10
    nvm use 0.10
    nvm alias default 0.10
fi

if [[ ! -s ~/.rvm/scripts/rvm ]]; then
    echo "Installing rvm"
    curl -sSL https://get.rvm.io | bash -s stable
    source ~/.rvm/scripts/rvm
fi

echo "Installing node packages.."
echo npm i -g coffee-script less stylus nib grunt-cli express underscore-cli bower yo cn instant-server http-server

echo "Installing ruby gems.."
echo gem install tmuxinator bundler thyme puppet librarian-puppet

echo "Done, great success!!1"
