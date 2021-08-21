#!/bin/bash

SYSTEM_TYPE=$(uname -s)

if [ "$SYSTEM_TYPE" = "Darwin" ]; then

    # ~/.macos — https://mths.be/macos

    # Close any open System Preferences panes, to prevent them from overriding
    # settings we’re about to change
    osascript -e 'tell application "System Preferences" to quit'

    # Ask for the administrator password upfront
    sudo -v

    # Keep-alive: update existing `sudo` time stamp until `.macos` has finished
    while true; do sudo -n true; sleep 60; kill -0 "$$" || exit; done 2>/dev/null &

    #===============
    # General UI/UX 
    #===============

    # Set computer name (as done via System Preferences → Sharing)
    sudo scutil --set ComputerName "macOS"
    sudo scutil --set HostName "macOS"
    sudo scutil --set LocalHostName "macOS"
    sudo defaults write /Library/Preferences/SystemConfiguration/com.apple.smb.server NetBIOSName -string "macOS"

    # Disable the sound effects on boot
    sudo nvram SystemAudioVolume=" "

    # Increase window resize speed for Cocoa applications
    defaults write NSGlobalDomain NSWindowResizeTime -float 0.001

    # Save to disk (not to iCloud) by default
    defaults write NSGlobalDomain NSDocumentSaveNewDocumentsToCloud -bool false

    # Disable the “Are you sure you want to open this application?” dialog
    defaults write com.apple.LaunchServices LSQuarantine -bool false

    # Remove duplicates in the “Open With” menu (also see `lscleanup` alias)
    /System/Library/Frameworks/CoreServices.framework/Frameworks/LaunchServices.framework/Support/lsregister -kill -r -domain local -domain system -domain user

    # Disable Resume system-wide
    defaults write com.apple.systempreferences NSQuitAlwaysKeepsWindows -bool false

    # Disable automatic termination of inactive apps
    defaults write NSGlobalDomain NSDisableAutomaticTermination -bool true

    # Disable the crash reporter
    defaults write com.apple.CrashReporter DialogType -string "none"

    # Set Help Viewer windows to non-floating mode
    defaults write com.apple.helpviewer DevMode -bool true

    # Disable automatic capitalization as it’s annoying when typing code
    defaults write NSGlobalDomain NSAutomaticCapitalizationEnabled -bool false

    # Disable smart dashes as they’re annoying when typing code
    defaults write NSGlobalDomain NSAutomaticDashSubstitutionEnabled -bool false

    # Disable automatic period substitution as it’s annoying when typing code
    defaults write NSGlobalDomain NSAutomaticPeriodSubstitutionEnabled -bool false

    # Disable smart quotes as they’re annoying when typing code
    defaults write NSGlobalDomain NSAutomaticQuoteSubstitutionEnabled -bool false

    # Disable auto-correct
    defaults write NSGlobalDomain NSAutomaticSpellingCorrectionEnabled -bool false

    #=============================================================
    # Trackpad, mouse, keyboard, Bluetooth accessories, and input
    #=============================================================

    # Disable “natural” (Lion-style) scrolling
    defaults write NSGlobalDomain com.apple.swipescrolldirection -bool false

    # Increase sound quality for Bluetooth headphones/headsets
    defaults write com.apple.BluetoothAudioAgent "Apple Bitpool Min (editable)" -int 40

    # Enable full keyboard access for all controls
    # (e.g. enable Tab in modal dialogs)
    defaults write NSGlobalDomain AppleKeyboardUIMode -int 3

    # Set a blazingly fast keyboard repeat rate
    # TODO: check
    # defaults write NSGlobalDomain KeyRepeat -int 1
    # defaults write NSGlobalDomain InitialKeyRepeat -int 10

    # Set language and text formats
    # Note: if you’re in the US, replace `EUR` with `USD`, `Centimeters` with
    # `Inches`, `en_GB` with `en_US`, and `true` with `false`.
    defaults write NSGlobalDomain AppleLanguages -array "en" "nl"
    defaults write NSGlobalDomain AppleLocale -string "en_GB@currency=EUR"
    defaults write NSGlobalDomain AppleMeasurementUnits -string "Centimeters"
    defaults write NSGlobalDomain AppleMetricUnits -bool true

    # Show language menu in the top right corner of the boot screen
    sudo defaults write /Library/Preferences/com.apple.loginwindow showInputMenu -bool true

    # Set the timezone; see `sudo systemsetup -listtimezones` for other values
    sudo systemsetup -settimezone "Europe/Brussels" > /dev/null

    # Stop iTunes from responding to the keyboard media keys
    launchctl unload -w /System/Library/LaunchAgents/com.apple.rcd.plist 2> /dev/null

    #===============
    # Energy saving
    #===============

    # Enable lid wakeup
    sudo pmset -a lidwake 1

    # Sleep the display after 15 minutes
    sudo pmset -a displaysleep 15

    # Remove the sleep image file to save disk space
    sudo rm /private/var/vm/sleepimage
    # Create a zero-byte file instead…
    sudo touch /private/var/vm/sleepimage
    # …and make sure it can’t be rewritten
    sudo chflags uchg /private/var/vm/sleepimage

    #========
    # Screen
    #========

    # Require password immediately after sleep or screen saver begins
    defaults write com.apple.screensaver askForPassword -int 1
    defaults write com.apple.screensaver askForPasswordDelay -int 0

    # Save screenshots to the desktop
    defaults write com.apple.screencapture location -string "${HOME}/Desktop"

    # Save screenshots in PNG format (other options: BMP, GIF, JPG, PDF, TIFF)
    defaults write com.apple.screencapture type -string "png"

    # Enable subpixel font rendering on non-Apple LCDs
    # Reference: https://github.com/kevinSuttle/macOS-Defaults/issues/17#issuecomment-266633501
    defaults write NSGlobalDomain AppleFontSmoothing -int 1

    # Enable HiDPI display modes (requires restart)
    sudo defaults write /Library/Preferences/com.apple.windowserver DisplayResolutionEnabled -bool true

    #========
    # Finder
    #========

    # Finder: disable window animations and Get Info animations
    defaults write com.apple.finder DisableAllAnimations -bool true

    # Dont show icons for hard drives, servers, and removable media on the desktop
    defaults write com.apple.finder ShowExternalHardDrivesOnDesktop -bool false
    defaults write com.apple.finder ShowHardDrivesOnDesktop -bool false
    defaults write com.apple.finder ShowMountedServersOnDesktop -bool false
    defaults write com.apple.finder ShowRemovableMediaOnDesktop -bool false

    # Finder: show all filename extensions
    defaults write NSGlobalDomain AppleShowAllExtensions -bool true

    # Disable the warning when changing a file extension
    defaults write com.apple.finder FXEnableExtensionChangeWarning -bool false

    # Avoid creating .DS_Store files on network or USB volumes
    defaults write com.apple.desktopservices DSDontWriteNetworkStores -bool true
    defaults write com.apple.desktopservices DSDontWriteUSBStores -bool true

    # Disable disk image verification
    defaults write com.apple.frameworks.diskimages skip-verify -bool true
    defaults write com.apple.frameworks.diskimages skip-verify-locked -bool true
    defaults write com.apple.frameworks.diskimages skip-verify-remote -bool true

    # Enable snap-to-grid for icons on the desktop and in other icon views
    /usr/libexec/PlistBuddy -c "Set :DesktopViewSettings:IconViewSettings:arrangeBy grid" ~/Library/Preferences/com.apple.finder.plist
    /usr/libexec/PlistBuddy -c "Set :FK_StandardViewSettings:IconViewSettings:arrangeBy grid" ~/Library/Preferences/com.apple.finder.plist
    /usr/libexec/PlistBuddy -c "Set :StandardViewSettings:IconViewSettings:arrangeBy grid" ~/Library/Preferences/com.apple.finder.plist

    # Increase grid spacing for icons on the desktop and in other icon views
    # TODO: check
    # /usr/libexec/PlistBuddy -c "Set :DesktopViewSettings:IconViewSettings:gridSpacing 100" ~/Library/Preferences/com.apple.finder.plist

    # Increase the size of icons on the desktop and in other icon views
    /usr/libexec/PlistBuddy -c "Set :DesktopViewSettings:IconViewSettings:iconSize 52" ~/Library/Preferences/com.apple.finder.plist

    # Show the /Volumes folder
    sudo chflags nohidden /Volumes

    # Expand the following File Info panes:
    # “General”, “Open with”, and “Sharing & Permissions”
    defaults write com.apple.finder FXInfoPanesExpanded -dict \
        General -bool true \
        OpenWith -bool true \
        Privileges -bool true

    #====================
    # Dock and Dashboard
    #====================

    # Show indicator lights for open applications in the Dock
    defaults write com.apple.dock show-process-indicators -bool true

    # Don’t animate opening applications from the Dock
    defaults write com.apple.dock launchanim -bool false

    # Speed up Mission Control animations
    defaults write com.apple.dock expose-animation-duration -float 0.1

    # Disable Dashboard
    defaults write com.apple.dashboard mcx-disabled -bool true

    # Don’t show Dashboard as a Space
    defaults write com.apple.dock dashboard-in-overlay -bool true

    # Don’t automatically rearrange Spaces based on most recent use
    defaults write com.apple.dock mru-spaces -bool false

    # Remove the auto-hiding Dock delay
    defaults write com.apple.dock autohide-delay -float 0
    # Remove the animation when hiding/showing the Dock
    defaults write com.apple.dock autohide-time-modifier -float 0

    #======
    # Mail
    #======

    # Disable send and reply animations in Mail.app
    defaults write com.apple.mail DisableReplyAnimations -bool true
    defaults write com.apple.mail DisableSendAnimations -bool true

    # Copy email addresses as `foo@example.com` instead of `Foo Bar <foo@example.com>` in Mail.app
    defaults write com.apple.mail AddressesIncludeNameOnPasteboard -bool false

    # Add the keyboard shortcut ⌘ + Enter to send an email in Mail.app
    defaults write com.apple.mail NSUserKeyEquivalents -dict-add "Send" "@\U21a9"

    # Disable inline attachments (just show the icons)
    defaults write com.apple.mail DisableInlineAttachmentViewing -bool true

    # Disable automatic spell checking
    defaults write com.apple.mail SpellCheckingBehavior -string "NoSpellCheckingEnabled"

    #===========
    # Spotlight
    #===========

    # Change indexing order and disable some search results
    defaults write com.apple.spotlight orderedItems -array \
        '{"enabled" = 1;"name" = "APPLICATIONS";}' \
        '{"enabled" = 1;"name" = "SYSTEM_PREFS";}' \
        '{"enabled" = 1;"name" = "DIRECTORIES";}' \
        '{"enabled" = 1;"name" = "PDF";}' \
        '{"enabled" = 1;"name" = "DOCUMENTS";}' \
        '{"enabled" = 0;"name" = "FONTS";}' \
        '{"enabled" = 0;"name" = "MESSAGES";}' \
        '{"enabled" = 0;"name" = "CONTACT";}' \
        '{"enabled" = 0;"name" = "EVENT_TODO";}' \
        '{"enabled" = 0;"name" = "IMAGES";}' \
        '{"enabled" = 0;"name" = "BOOKMARKS";}' \
        '{"enabled" = 0;"name" = "MUSIC";}' \
        '{"enabled" = 0;"name" = "MOVIES";}' \
        '{"enabled" = 0;"name" = "PRESENTATIONS";}' \
        '{"enabled" = 0;"name" = "SPREADSHEETS";}' \
        '{"enabled" = 0;"name" = "SOURCE";}'

    # Load new settings before rebuilding the index
    killall mds > /dev/null 2>&1
    # Make sure indexing is enabled for the main volume
    sudo mdutil -i on / > /dev/null
    # Rebuild the index from scratch
    sudo mdutil -E / > /dev/null

    #==============
    # Time Machine
    #==============

    # Prevent Time Machine from prompting to use new hard drives as backup volume
    defaults write com.apple.TimeMachine DoNotOfferNewDisksForBackup -bool true

    #==================
    # Activity Monitor
    #==================

    # Show the main window when launching Activity Monitor
    defaults write com.apple.ActivityMonitor OpenMainWindow -bool true

    # Show all processes in Activity Monitor
    defaults write com.apple.ActivityMonitor ShowCategory -int 0

    # Sort Activity Monitor results by CPU usage
    defaults write com.apple.ActivityMonitor SortColumn -string "CPUUsage"
    defaults write com.apple.ActivityMonitor SortDirection -int 0

    #===========================================================
    # Address Book, Dashboard, iCal, TextEdit, and Disk Utility
    #===========================================================

    # Enable the debug menu in Address Book
    defaults write com.apple.addressbook ABShowDebugMenu -bool true

    # Enable Dashboard dev mode (allows keeping widgets on the desktop)
    defaults write com.apple.dashboard devmode -bool true

    # Enable the debug menu in iCal (pre-10.8)
    defaults write com.apple.iCal IncludeDebugMenu -bool true

    # Use plain text mode for new TextEdit documents
    defaults write com.apple.TextEdit RichText -int 0
    # Open and save files as UTF-8 in TextEdit
    defaults write com.apple.TextEdit PlainTextEncoding -int 4
    defaults write com.apple.TextEdit PlainTextEncodingForWrite -int 4

    # Enable the debug menu in Disk Utility
    defaults write com.apple.DiskUtility DUDebugMenuEnabled -bool true
    defaults write com.apple.DiskUtility advanced-image-options -bool true

    # Auto-play videos when opened with QuickTime Player
    defaults write com.apple.QuickTimePlayerX MGPlayMovieOnOpen -bool true

    #===============
    # Mac App Store
    #===============

    # Enable the WebKit Developer Tools in the Mac App Store
    defaults write com.apple.appstore WebKitDeveloperExtras -bool true

    # Enable Debug Menu in the Mac App Store
    defaults write com.apple.appstore ShowDebugMenu -bool true

    # Allow the App Store to reboot machine on macOS updates
    defaults write com.apple.commerce AutoUpdateRestartRequired -bool true

    #========
    # Photos
    #========

    # Prevent Photos from opening automatically when devices are plugged in
    defaults -currentHost write com.apple.ImageCapture disableHotPlug -bool true

    #===================
    # Custom preferences
    #===================

    # General
    defaults write $HOME/Library/Preferences/.GlobalPreferences.plist "AppleWindowTabbingMode" "always"
    defaults write $HOME/Library/Preferences/.GlobalPreferences.plist "NSAutomaticTextCompletionEnabled" "NSCloseAlwaysConfirmsChanges"
    defaults write $HOME/Library/Preferences/.GlobalPreferences.plist "AppleScrollerPagingBehavior" -bool false
    defaults write $HOME/Library/Preferences/.GlobalPreferences.plist "AppleInterfaceStyle" "Dark"
    defaults write $HOME/Library/Preferences/.GlobalPreferences.plist "NSTableViewDefaultSizeMode" -int "2"
    defaults write $HOME/Library/Preferences/.GlobalPreferences.plist "AppleReduceDesktopTinting" -bool false
    defaults write $HOME/Library/Preferences/.GlobalPreferences.plist "NSQuitAlwaysKeepsWindows" -bool false
    defaults write $HOME/Library/Preferences/.GlobalPreferences.plist "AppleShowScrollBars" "Automatic"
    defaults write $HOME/Library/Preferences/.GlobalPreferences.plist "NSCloseAlwaysConfirmsChanges" -bool false

    # Dock
    defaults write $HOME/Library/Preferences/.GlobalPreferences.plist "AppleActionOnDoubleClick" "Minimize"
    defaults write $HOME/Library/Preferences/com.apple.dock.plist "show-recents" -bool false
    defaults write $HOME/Library/Preferences/com.apple.dock.plist "autohide" -bool false
    defaults write $HOME/Library/Preferences/com.apple.dock.plist "tilesize" -int "48"
    defaults write $HOME/Library/Preferences/com.apple.dock.plist "largesize" -int "128"
    defaults write $HOME/Library/Preferences/com.apple.dock.plist "launchanim" -bool false
    defaults write $HOME/Library/Preferences/com.apple.dock.plist "orientation" "right"
    defaults write $HOME/Library/Preferences/com.apple.dock.plist "minimize-to-application" -bool false
    defaults write $HOME/Library/Preferences/com.apple.dock.plist "mineffect" "genie"
    defaults write $HOME/Library/Preferences/com.apple.dock.plist "show-process-indicators" -bool true

    # Menubar
    defaults write $HOME/Library/Preferences/com.apple.controlcenter.plist "NSStatusItem Visible Battery" -bool true
    defaults write $HOME/Library/Preferences/com.apple.speech.synthesis.general.prefs.plist "TimeAnnouncementsEnabled" -bool false
    defaults write $HOME/Library/Preferences/com.apple.controlcenter.plist "NSStatusItem Visible WiFi" -bool true
    defaults write $HOME/Library/Preferences/com.apple.airplay.plist "showInMenuBarIfPresent" -bool true
    defaults write $HOME/Library/Preferences/com.apple.menuextra.clock.plist "Show24Hour" -bool true
    defaults write $HOME/Library/Preferences/com.apple.menuextra.clock.plist "ShowDayOfMonth" -bool true
    defaults write $HOME/Library/Preferences/com.apple.menuextra.clock.plist "ShowSeconds" -bool true
    defaults write $HOME/Library/Preferences/com.apple.systemuiserver.plist "NSStatusItem Visible Siri" -bool true
    defaults write $HOME/Library/Preferences/com.apple.systemuiserver.plist "NSStatusItem Visible Item-0" -bool false
    defaults write $HOME/Library/Preferences/com.apple.controlcenter.plist "NSStatusItem Visible AirDrop" -bool false
    defaults write $HOME/Library/Preferences/com.apple.controlcenter.plist "NSStatusItem Visible KeyboardBrightness" -bool false
    defaults write $HOME/Library/Preferences/com.apple.controlcenter.plist "NSStatusItem Visible Item-8" -bool false
    defaults write $HOME/Library/Preferences/com.apple.controlcenter.plist "NSStatusItem Visible UserSwitcher" -bool false
    defaults write $HOME/Library/Preferences/com.apple.controlcenter.plist "NSStatusItem Visible Item-7" "NSStatusItem Visible Item-8"
    defaults write $HOME/Library/Preferences/com.apple.controlcenter.plist "NSStatusItem Visible Bluetooth" -bool false
    defaults write $HOME/Library/Preferences/com.apple.controlcenter.plist "NSStatusItem Visible AccessibilityShortcuts" -bool false
    defaults write $HOME/Library/Preferences/com.apple.menuextra.clock.plist "FlashDateSeparators" -bool false
    defaults write $HOME/Library/Preferences/com.apple.menuextra.clock.plist "DateFormat" "EEE d MMM  HH:mm:ss"
    defaults write $HOME/Library/Preferences/com.apple.menuextra.clock.plist "ShowDayOfWeek" -bool true
    defaults write $HOME/Library/Preferences/com.apple.menuextra.clock.plist "IsAnalog" -bool false
    defaults write $HOME/Library/Preferences/com.apple.Siri.plist "StatusMenuVisible" -bool false
    defaults write $HOME/Library/Preferences/.GlobalPreferences.plist "_HIHideMenuBar" -bool true

    # Mission control
    defaults write $HOME/Library/Preferences/.GlobalPreferences.plist "AppleShowScrollBars" "AppleSpacesSwitchOnActivate"
    defaults write $HOME/Library/Preferences/.GlobalPreferences.plist "AppleSpacesSwitchOnActivate" -bool true
    defaults write $HOME/Library/Preferences/com.apple.dock.plist "expose-group-apps" -bool false
    defaults write $HOME/Library/Preferences/com.apple.dock.plist "mru-spaces" -bool false

    # Language
    defaults write $HOME/Library/Preferences/.GlobalPreferences_m.plist "AppleLocale" "en_BE"
    defaults write $HOME/Library/Preferences/.GlobalPreferences.plist "AppleTemperatureUnit" "Celsius"

    # Trackpad
    defaults write $HOME/Library/Preferences/.GlobalPreferences.plist "com.apple.swipescrolldirection" -bool false

    # OneDrive
    defaults write $HOME/Library/Preferences/com.microsoft.OneDrive.plist "OpenAtLogin" -int "1"
    defaults write $HOME/Library/Preferences/com.microsoft.OneDrive.plist "HideDockIcon" -bool true

    # Login items
    osascript -e 'tell application "System Events" to make login item at end with properties {path:"/Applications/Maccy.app", hidden:true}'
    osascript -e 'tell application "System Events" to make login item at end with properties {path:"/System/Applications/Mail.app", hidden:true}'

    #============================
    # Kill affected applications
    #============================

    for app in "Activity Monitor" \
        "Address Book" \
        "Calendar" \
        "cfprefsd" \
        "Contacts" \
        "Dock" \
        "Finder" \
        "Google Chrome" \
        "Maccy" \
        "Mail" \
        "OneDrive" \
        "Photos" \
        "SystemUIServer" \
        "Terminal" \
        "iCal"; do
        killall "${app}" &> /dev/null
    done

    echo "macOS system preferences ✅"
fi

