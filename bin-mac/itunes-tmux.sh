#!/usr/bin/env bash
# Based on https://www.tylerewing.co/tmux-now-playing
ITUNES=$(osascript <<EOF
set itunes_state to false

if is_app_running("iTunes") then
	tell application "iTunes" to set itunes_state to (player state as text)
end if

if itunes_state is equal to "playing" then
	tell application "iTunes"
		set track_name to name of current track
		set artist_name to artist of current track
		return track_name & " - " & artist_name
	end tell
else
	return ""
end if

on is_app_running(app_name)
	tell application "System Events" to (name of processes) contains app_name
end is_app_running
EOF)

if test "x$ITUNES" != "x"; then
 echo "🎵  ${ITUNES} "
fi
