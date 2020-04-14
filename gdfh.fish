# Defined in - @ line 2
function gdfh
	set -l endArgs (contains -i -- '--' $argv)
    git diff $argv[1..(math $endArgs - 1)] HEAD $argv[$endArgs..-1]
end
