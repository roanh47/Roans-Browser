## ICNS generation directory. <img src="https://github.com/roanh47/Roans-Browser/blob/main/logos/NEW/mac/icon_2048px.png" width="48">

This directory contains files/scripts for generating an .icns (IconSet) file for MacOS from predefined icon .PNGs from 16px to 1024px.

 - In the app and document subdirs, there are the icon files and two scripts, both named build_icns.sh, which must each be seperately run in their respective folders.
They will generate `Roan's Browser.icns` and `RoansBrowserDocument.icns`, which should both be placed in the parent of this directory, I.E. //roansbrowser/logos/NEW/mac/

They will then be renamed to app.icns and document.icns and copied to //roansbrowser/chrome/app/theme/chromium/mac/ for proper Roan's Browser branding on MacOS.

<img src="https://github.com/roanh47/Roans-Browser/blob/main/logos/NEW/mac/apple.png" width="200">
