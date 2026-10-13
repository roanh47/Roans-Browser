#!/bin/bash

# Copyright (c) 2026 Alex313031.

YEL='\033[1;33m' # Yellow
CYA='\033[1;96m' # Cyan
RED='\033[1;31m' # Red
GRE='\033[1;32m' # Green
c0=$'\033[0m' # Reset Text
bold=$'\033[1m' # Bold Text
underline=$'\033[4m' # Underline Text

# Error handling
yell() { echo "$0: $*" >&2; }
die() { yell "$*"; exit 111; }
try() { "$@" || die "${RED}Failed $*"; }

# --help
displayHelp () {
	printf "\n" &&
	printf "${bold}${YEL}Script to build RoansBrowser DEBUG for Windows on Linux.${c0}\n" &&
	printf "${underline}Usage: ${c0}build_debug_win.sh # (where # is number of jobs)\n" &&
	printf "\n"
}
case $1 in
	--help) displayHelp; exit 0;;
esac

printf "\n" &&
printf "${YEL}Building RoansBrowser DEBUG for Windows...\n" &&
printf "${CYA}\n" &&

# Build RoansBrowser and RoansBrowser UI Debug Shell
export NINJA_SUMMARIZE_BUILD=1 &&

autoninja -C ~/chromium/src/out/roansbrowser chrome chromedriver roansbrowser_shell setup mini_installer roansbrowser_ui_debug_shell clear_key_cdm -j$@ &&

mkdir -v -p ~/chromium/src/out/roansbrowser/RoansBrowser_UI_Debug_Shell &&
mkdir -v -p ~/chromium/src/out/roansbrowser/RoansBrowser_UI_Debug_Shell/icons &&

cp -r -f -v ./icons/icon_16.png ~/chromium/src/out/roansbrowser/RoansBrowser_UI_Debug_Shell/icons &&
cp -r -f -v ./icons/icon_24.png ~/chromium/src/out/roansbrowser/RoansBrowser_UI_Debug_Shell/icons &&
cp -r -f -v ./icons/icon_32.png ~/chromium/src/out/roansbrowser/RoansBrowser_UI_Debug_Shell/icons &&
cp -r -f -v ./icons/icon_48.png ~/chromium/src/out/roansbrowser/RoansBrowser_UI_Debug_Shell/icons &&
cp -r -f -v ./icons/icon_64.png ~/chromium/src/out/roansbrowser/RoansBrowser_UI_Debug_Shell/icons &&
cp -r -f -v ./icons/icon_128.png ~/chromium/src/out/roansbrowser/RoansBrowser_UI_Debug_Shell/icons &&
cp -r -f -v ./icons/icon_256.png ~/chromium/src/out/roansbrowser/RoansBrowser_UI_Debug_Shell/icons &&
cp -r -f -v ./icons/roansbrowser_debug_shell.ico ~/chromium/src/out/roansbrowser/RoansBrowser_UI_Debug_Shell &&
cp -r -f -v DEBUG_SHELL_README.md ~/chromium/src/out/roansbrowser/RoansBrowser_UI_Debug_Shell/README.md &&
cp -r -f -v ~/chromium/src/out/roansbrowser/locales ~/chromium/src/out/roansbrowser/RoansBrowser_UI_Debug_Shell/ &&
cp -r -f -v ~/chromium/src/out/roansbrowser/test_fonts ~/chromium/src/out/roansbrowser/RoansBrowser_UI_Debug_Shell/ &&
cp -r -f -v ~/chromium/src/out/roansbrowser/resources ~/chromium/src/out/roansbrowser/RoansBrowser_UI_Debug_Shell/ &&
cp -r -f -v ~/chromium/src/out/roansbrowser/ui ~/chromium/src/out/roansbrowser/RoansBrowser_UI_Debug_Shell/ &&
cp -r -f -v ~/chromium/src/out/roansbrowser/blink_test_plugin.dll ~/chromium/src/out/roansbrowser/RoansBrowser_UI_Debug_Shell/ &&
cp -r -f -v ~/chromium/src/out/roansbrowser/icudtl.dat ~/chromium/src/out/roansbrowser/RoansBrowser_UI_Debug_Shell/ &&
cp -r -f -v ~/chromium/src/out/roansbrowser/content_resources.pak ~/chromium/src/out/roansbrowser/RoansBrowser_UI_Debug_Shell/ &&
cp -r -f -v ~/chromium/src/out/roansbrowser/libEGL.dll ~/chromium/src/out/roansbrowser/RoansBrowser_UI_Debug_Shell/ &&
cp -r -f -v ~/chromium/src/out/roansbrowser/libGLESv2.dll ~/chromium/src/out/roansbrowser/RoansBrowser_UI_Debug_Shell/ &&
cp -r -f -v ~/chromium/src/out/roansbrowser/vk_swiftshader.dll ~/chromium/src/out/roansbrowser/RoansBrowser_UI_Debug_Shell/ &&
cp -r -f -v ~/chromium/src/out/roansbrowser/vulkan-1.dll ~/chromium/src/out/roansbrowser/RoansBrowser_UI_Debug_Shell/ &&
cp -r -f -v ~/chromium/src/out/roansbrowser/vk_swiftshader_icd.json ~/chromium/src/out/roansbrowser/RoansBrowser_UI_Debug_Shell/ &&
cp -r -f -v ~/chromium/src/out/roansbrowser/v8_context_snapshot.bin ~/chromium/src/out/roansbrowser/RoansBrowser_UI_Debug_Shell/ &&
cp -r -f -v ~/chromium/src/out/roansbrowser/v8_context_snapshot_generator ~/chromium/src/out/roansbrowser/RoansBrowser_UI_Debug_Shell/ &&
cp -r -f -v ~/chromium/src/out/roansbrowser/ui_resources_100_percent.pak ~/chromium/src/out/roansbrowser/RoansBrowser_UI_Debug_Shell/ &&
cp -r -f -v ~/chromium/src/out/roansbrowser/ui_test.pak ~/chromium/src/out/roansbrowser/RoansBrowser_UI_Debug_Shell/ &&
cp -r -f -v ~/chromium/src/out/roansbrowser/ui_test_200_percent.pak ~/chromium/src/out/roansbrowser/RoansBrowser_UI_Debug_Shell/ &&
cp -r -f -v ~/chromium/src/out/roansbrowser/views_examples_resources.pak ~/chromium/src/out/roansbrowser/RoansBrowser_UI_Debug_Shell/ &&
cp -r -f -v ~/chromium/src/out/roansbrowser/roansbrowser_ui_debug_shell.exe ~/chromium/src/out/roansbrowser/RoansBrowser_UI_Debug_Shell/ &&

printf "\n" &&
printf "${GRE}Debug Windows Build Completed.\n" &&
tput sgr0
