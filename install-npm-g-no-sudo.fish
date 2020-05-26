function install-npm-g-no-sudo
    echo "Experimental"
    echo "Taken from https://github.com/sindresorhus/guides/blob/master/npm-global-without-sudo.md"
    set -Ux NPM_PACKAGES $HOME/.npm-packages
    mkdir $NPM_PACKAGES
    npm config set prefix $NPM_PACKAGES
    set PATH $PATH $NPM_PACKAGES
    set MANPATH $MANPATH $NPM_PACKAGES/share/man
end
