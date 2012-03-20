#!/bin/bash
#
# This script is intended to do the smart open window thing. Eg:
# If run when a terminal is focused then launch a new terminal
# If run when a browser is focused then launch a new broser window
#
# The workhorse of this script should be xdotool (see man xdotool)

id="$(xdotool getwindowfocus)"

#the sed command matches the first entry to WM_CLASS
class="$(xprop -id $id -notype WM_CLASS  | wm_class.match.sed)"

case $class in
   'urxvt') 
		# we know it is a urxvt, but what are we running ? We inspect the NAME
		# propertie to find out.
		name="$(xprop -id "$id" -notype WM_NAME | cut -d'"' -f2 )"
		echo "$name" | grep -q "Elinks$"
		if [ $? -eq 0 ]; then
			urxvt -e elinks
		else
			urxvt_pwd=$(echo $name | wm_pwd.match.sed)
			urxvtc -cd "$urxvt_pwd"
			echo "$urxvt_pwd"
			echo "$name"
		fi;;
   *)
      echo "wtf"
      ;;
esac
