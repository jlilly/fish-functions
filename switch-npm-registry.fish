# Defined in - @ line 2
function switch-npm-registry
	# Requires npmAltRegistry to be set univerisally
    if test -z "$npmAltRegistry"
        echo No alternative npm registry defined
        echo 'do \'set -U npmAltRegistry URL\''
        return 1
    end

    set -l npmRegistry 'https://registry.npm.org/'
    set -l localRegistry (npm get registry)


    if string match -q $npmRegistry $localRegistry
        set localRegistry $npmAltRegistry
    else
        set localRegistry $npmRegistry
    end

    npm config set registry $localRegistry
    npm config get registry
end
