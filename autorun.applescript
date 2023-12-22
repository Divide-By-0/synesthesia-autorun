tell application "System Events"
	tell process "Synesthesia"
    -- Note that ANY change to this script will invalidate Apple permissions, so you will need to save to a different script as an "Application" then give that + Synesthesia Accessibility permissions before ever running it. 

    -- Wait in case this program autostarts first
		delay 5
    
		set frontmost to true
		delay 6 -- Wait for the app to become the frontmost app
		-- Navigate the menu system
		click menu item "Show Visualizer" of menu "Window" of menu bar 1
		delay 6 -- Wait for the visualizer to show
 
		set position of window 1 to {1920, 0}
		delay 4 -- Wait for the window to move        
 
		-- Send the fullscreen command
		click button 2 of window 1 -- Assuming button 2 is the fullscreen button
		-- keystroke "f" using {command down, shift down}
	end tell
end tell