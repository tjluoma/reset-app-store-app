# reset-app-store-app

Run this when the Mac App Store App just spins and spins


This script will automatically execute the steps mentioned in my MacStories article:

[What to Do When the Mac App Store App Just Spins and Spins](https://www.macstories.net/mac/what-to-do-when-the-mac-app-store-app-just-spins-and-spins/)

1.	Quits the App Store app, if running

2.	Enables the Debug Menu in the App Store app

3. 	Removes any file/folder “com.apple.appstore” in “/private/var/folders” (requires root/sudo)

4.	Reboots the computer.

It works for me, but use entirely at your own risk.


## Advanced Usage


	zsh -c "$(curl -sL https://raw.githubusercontent.com/tjluoma/reset-app-store-app/master/reset-app-store-app.sh)"

or, more compactly:

	zsh -c "$(curl -sL http://luo.ma/rasa.sh)"

