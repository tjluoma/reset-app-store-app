#!/bin/zsh -f
# Purpose:
#
# From:	Timothy J. Luoma
# Mail:	luomat at gmail dot com
# Date:	2016-04-12

NAME="$0:t:r"

if [ -e "$HOME/.path" ]
then
	source "$HOME/.path"
else
	PATH='/usr/local/scripts:/usr/local/bin:/usr/bin:/usr/sbin:/sbin:/bin'
fi


while [ "`pgrep -x 'App Store'`" != "" ]
do
	echo "$NAME: Telling App Store app to quit"

	osascript -e 'tell application "App Store" to quit'
	sleep 5

done

defaults write com.apple.appstore ShowDebugMenu -bool true >/dev/null

defaults read com.apple.appstore ShowDebugMenu >/dev/null

########################################################################################################################

echo "$NAME: Next you will be asked to enter your administrator's password."

echo "	Doing to will attempt to delete Mac App Store cache files, and then reboot your computer immediately."

echo "	Be sure you are ready to reboot before continuing."

echo

read "?Press 'Y' and enter to confirm, or any other key to quit. [y/N] " ANSWER

case "$ANSWER" in
	Y*|y*)
			:
	;;

	*)
			echo "$NAME: Not continuing"
			exit 0
	;;

esac


sudo find /private/var/folders -ipath '*com.apple.appstore*' -depth -mindepth 4 -delete -print

sudo shutdown -r +1

echo "$NAME: Finished. You have 1 minute to save any unsaved changes before the computer will reboot."

########################################################################################################################


exit 0
#EOF
