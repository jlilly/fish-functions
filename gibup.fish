# Defined in - @ line 2
function gibup --description 'Push current branch to remote'
	set -l branch (git symbolic-ref --short HEAD)
    # TODO: allow other remotes beside 'origin'
    set -l remote origin
    git push --set-upstream $remote $branch
end
