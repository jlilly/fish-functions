function backup
    # TODO: create folders and files relative to / rather than ~
    cd
    set -l options (fish_opt -s f -l full)
    set options $options (fish_opt -s l -l location --optional-val)
    set options $options (fish_opt -s h -l help)
    argparse $options -- $argv

    set -l location /media/(whoami)/Backup
    set -l folder incremental

    if not test -e .backup-list
        echo ERROR: no backup list file! Create ~/.backup-list to continue
        cd - > /dev/null
        return 1
    end

    if test -n "$_flag_h"
        echo "Joe's simple backup script"
        echo "Default sync to $location/$folder"
        echo "Folders to backup are listed in ~/.backup-list"
        echo
        echo "Usage: backup [-f] [-l<location>] [-h]"
        echo
        echo "Options"
        echo "    -f --full             Perfoms a 'full' backup:"
        echo "                          - A new folder with today's date is created"
        echo "                          - \"Everything\" will be copied to this folder"
        echo "    -l<location>          Base location, replaces $location"
        echo "    --location=<location>"
        echo "    -h --help             Displays this help, very helpful"
        cd - > /dev/null
        return 0
    end

    if test -n "$_flag_l"
        set location (string replace -r '(.)/$' '$1' -- $_flag_l)

    end

    # test location is a directory and available
    if not test -d $location
        echo ERROR: $location is not a valid directory
        cd - > /dev/null
        return 1
    end

    if test -n "$_flag_f"
        set folder (date -I)
    end

    cat ~/.backup-list | while read -l item
        rsync -a --progress (string replace -r '(.*)/$' '$1' -- $item) $location/$folder
    end
    # Sync the disk before returning control
    echo Syncing the disk...
    sync
    cd - > /dev/null
end
