# Rebasing Roan's Browser

My primary job as the founder and main dev of Roan's Browser is rebasing Roan's Browser to match newer upstream Chromium versions.
This is not a trivial task. This document describes my personal workflow for how I rebase the repo. If anyone 
notices something I could do better or faster, make a PR and edit this file along with an explanation of what should be done differently.

Rebasing would be even more of a chore if it wasn't thanks to the [Chromium source code search](https://source.chromium.org/). 
We have a [bookmarks file](https://github.com/roanh47/Roans-Browser/blob/main/infra/ROANSBROWSER_DEV_BOOKMARKS.html) located in __//infra__ 
which has a (not super well organized) bookmark list of all the files roansbrowser uses.

The bookmarks file can be imported at chrome://bookmarks. Each file will be at the current Roan's Browser revision, and it will also show 
git history. If only one or two small commits were made to a file since the last version, I usually just look at the diff and manually 
edit files as needed. 
For more in depth rebasing, I find [Meld](https://meldmerge.org/) invaluable. The IDE I use is [Geany](https://www.geany.org/). 
Both are available for Linux, Windows, and MacOS.
