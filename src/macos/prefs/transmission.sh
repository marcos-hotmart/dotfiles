#!/bin/bash

# source utils
cd "$(dirname "$0")" \
    && . "../../init/helpers.sh"

execute "defaults write org.m0k.transmission DeleteOriginalTorrent -bool true" \
    "Delete the original torrent files"

execute "defaults write org.m0k.transmission DownloadAsk -bool false" \
    "Don’t prompt for confirmation before downloading"

execute "defaults write org.m0k.transmission MagnetOpenAsk -bool false" \
    "Don’t prompt for confirmation before downloading for magnet links"

execute "defaults write org.m0k.transmission CheckRemoveDownloading -bool true" \
    "Don’t prompt for confirmation before removing non-downloading active transfers"

execute "defaults write org.m0k.transmission DownloadChoice -string 'Constant' && \
         defaults write org.m0k.transmission DownloadFolder -string '$HOME/Downloads'" \
    "Use '~/Downloads' to store complete downloads"

execute "defaults write org.m0k.transmission UseIncompleteDownloadFolder -bool true && \
         defaults write org.m0k.transmission IncompleteDownloadFolder -string '$HOME/Downloads/torrents'" \
    "Use '~/Downloads/torrents' to store incomplete downloads"

execute "defaults write org.m0k.transmission WarningDonate -bool false" \
    "Hide the donate message"

execute "defaults write org.m0k.transmission WarningLegal -bool false" \
    "Hide the legal disclaimer"

execute "defaults write org.m0k.transmission RandomPort -bool true" \
    "Randomize port on launch"

execute "defaults write org.m0k.transmission BlocklistNew -bool true && \
        defaults write org.m0k.transmission BlocklistURL -string 'http://john.bitsurge.net/public/biglist.p2p.gz' && \
        defaults write org.m0k.transmission.BlocklistAutoUpdate -bool true" \
    "Add the recommended IP blocklist"

killall "Transmission" &> /dev/null

print_success "Transmission"