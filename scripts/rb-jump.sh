#!/bin/sh

# selects song from dmenu, plays in rhythmbox

# must be same as path in rhythmbox, or else rb will add to library
MUSIC="$HOME/Music/"
#DMENU_OPTS="-l 12 -b -i -fn -*-lucida-bold-r-*-*-15-*-*-*-*-*-*-* -sb #cfb000 -sf #000 -nf #fff -nb #4a525a -m 0"
#DMENU_OPTS="-l 12 -b -i -fn -*-lucida-bold-r-*-*-15-*-*-*-*-*-*-* -sb #123 -sf #fff -nf #0f0 -nb #123 -m 0"
DMENU_OPTS="-l 12 -b -i -fn -*-lucida-bold-r-*-*-15-*-*-*-*-*-*-* -sb #123 -sf #cfb000 -nf #fff -nb #123 -m 0"
FIND_SONGS=`cat <<EOF
-iregex .*\(mp3\|ogg\|flac\)
EOF
`
FIND_OPTS=$FIND_SONGS
CMD="--play-uri"

while getopts "de" opt; do
    case $opt in
        e)
            CMD="--enqueue"
            ;;
        d)
            FIND_OPTS="-type d"
            CMD="--enqueue" # can't play them all at once...
            ;;
    esac
done

# dropped sort from pipes.  sort blocked until find finished.  may speed up drawing
SONGFILE=$( find $MUSIC $FIND_OPTS | sed -e "s/\/home\/sagotsky\/Music\///g" | dmenu $DMENU_OPTS )
if [ `echo $SONGFILE | wc -c` -gt 1 ] ; then
    #find "$MUSIC/$SONGFILE" $FIND_SONGS -exec rhythmbox-client "$CMD" "{}" \;
    find "$MUSIC/$SONGFILE" $FIND_SONGS |\
    sort |\
    while read line ; do  # should this loop be in a function?  it would be easier to read than multiline piping  
        rhythmbox-client "$CMD" "$line"
    done
fi

#if [ $? -eq 0 ] ; then
    #FILE="$MUSIC$SONGFILE"
    #if [ -f "$FILE" ] ; then
        #rhythmbox-client "$CMD" "$FILE"
    #fi
#fi

#rhythmbox-client --play-uri="`find $HOME/Music/ -name "*.mp3"  |  dmenu -l 20 -i`"
