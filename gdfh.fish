# Defined in - @ line 2
function gdfh
	set -l largv

    set -l rargv

    set -l dashesIndex (contains -i -- '--' $argv)
    if test -z "$dashesIndex"
        or test "$dashesIndex" -eq 1
        set rargv $argv
    else
        set largv $argv[1..(math $dashesIndex - 1)]
        set rargv $argv[(math $dashesIndex + 1)..-1]
    end
    git diff $largv HEAD $rargv
end
