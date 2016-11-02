my closeNotif()
on closeNotif()
    tell application "System Events"
        tell process "Notification Center"
            set theseWindows to every window whose subrole is "AXNotificationCenterBanner" or subrole is "AXNotificationCenterAlert"
            repeat with thisWindow in theseWindows
                try
                    click thisWindow
                end try
            end repeat
        end tell
    end tell
end closeNotif
