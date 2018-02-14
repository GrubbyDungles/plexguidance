
# local_includes file 

    $ cat > .local_includes
    */
    *.json
    *.bak
    *.conf
	*.tar.gz
	*.db
	*.xml
	*.pid
	*.db-shm
	*.db-wal
	*.jpg
	*.zip
	*.txt
	*.ini
	*.lock
	*.log
	*.cred
	
    ^D
    $



# Bash script to run backup 

    $ cat > ~/bin/plexguide_appdata_rsync
    #!/bin/bash
    #script to backup config files from /opt/appdata/

    INCLUDE_FILE=~/.local_includes
    SRC=/opt/appdata/
    DEST=/mnt/backup/live

    rsync -auv --include-from=$INCLUDE_FILE --exclude '*' --prune-empty-dirs $SRC $DEST

    echo "backup completed at $(date)"

    ^D
    $ chmod 755 ~/bin/plexguide_appdata_rsync
    $



# Run this every day at 04:00 in the morning

    $ crontab -e
    00 04 * * *     ~/plexguide_appdata_rsync

    :wq
    $
## NEXT STILL TO DO
Add an incremental backup by zip / tar with versioning of directory /mnt/backup/live to /mnt/backup/archive/appdata.zip

Use either no series or date in either zip itself or create directory with numeric date for zip to reside in.
