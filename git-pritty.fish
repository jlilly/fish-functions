# Defined in - @ line 2
function git-pritty
	set -l staged (string match -erq '\.(scss|ts|json)$' (git diff --name-only --staged))
    if test -z "$staged"
        echo 'Nothing to prettier'
        return 1
    end
    npx prettier --write $staged
    git add -p $staged
end
