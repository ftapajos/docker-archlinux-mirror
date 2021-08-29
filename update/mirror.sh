#!/bin/bash


RSYNC=/usr/bin/rsync

if [[ -z $ARCHLINUX_T1_RSYNC_URL ]] ; then 
	ARCHLINUX_T1_RSYNC_URL=rsync://mirror.de.leaseweb.net/archlinux/
fi

OPTIONS=-"rtlvH --delete-after --delay-updates --safe-links --max-delete=3000"


pushd /mnt/mirror

while true; do
	$RSYNC $OPTIONS $ARCHLINUX_T1_RSYNC_URL ./
	date > __last_sync
	sleep 2h
done


