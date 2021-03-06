# Sagotsky's dotfiles and scripts.  

I link to these things often enough that they might as well be on github.  Also,
I'm hopeful that publicizing my scripts will force me to write them properly, 
even if nobody actively uses or reviews them.

# Scripts 

Whole lot of scripts in here.  Some will eventually be extracted into their own
repos.  For now, here's an explanation of the interesting ones.  No point
listing the one-offs.

# 4E2latex.pl

Generates latex documents from text files with Dungeons & Dragons 4th ed NPC
stat blocks.  See: ddi-mooch.  Highlighting is based on my vim syntax 
highlighter for this, but meant for a white background.

## active_win_man.sh 

Calls up a manpage for currently focused window.  Meant for a keyboard shortcut.
Digs into terminal windows to find their shell and active program.  I mostly use
this as an example for getting info about a window.

## cli-board.sh

Clipboard copier.  Uses dmenu to read through ~/.cli-board directory.  Text 
files are read into the clipboard.  Shell scripts are executed and their results
dumped into the clipboard.  

## ddi-mooch.sh 

Downloads plain text copies of all content in D&D 4e's compendium.  Needs a 
cookies.txt file with authorization to connect to DDI comepndium.  Good example 
of using xargs for forking parallel processes.

## gitget

Frontend for browsing and downloading from github.  Lets you search repository 
descriptions or list all of a users watched or owned repositories.  Results
can be cloned en mass.

## gdmSwitch.sh 

Switches to another user's X session or to GDM's login screen if user isn't 
logged in.  This exists because my wife couldn't handle ctrl-alt-f8.  It would 
be a good example of esoteric GDM commands that are poorly documented, except 
that gdm3 deprected all those options.  

## notify-volume.sh 

Watches mixer device for changes.  Spits out volume after each change.  Used by 
xmobar instead of polling 1/sec for current volume.

## plbroadcatch 

Todo: make separate repo, rewrite.  This script connects to showrss and 
downloads my new TV torrents.  It's in perl so I could run it on my dd-wrt 
router.  (It had been in python, but I didn't have the disk space to install 
python there.)  It's also my first perl project, so don't use it as an example.

