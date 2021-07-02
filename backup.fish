# Defined in - @ line 2
function backup
	cd
    set -l day (date -I)
    # TODO: rm trailing slashes
    cat ~/.backup-list | while read -l item
        rsync -a --progress "$item" /media/joe/Backup/$day
    end
    # Sync the disk before returning control
    echo Syncing the disk...
    sync
    cd -
end
