#!/bin/bash

echo "Downloading..."
curl -s https://api.github.com/repos/MediaBrowser/Emby.Releases/releases/latest | grep "browser_download_url.*emby-server-deb_.*amd64.deb" | cut -d : -f 2,3 | tr -d \" | wget -i - -q --show-progress -O ./emby-server.deb

echo "Installing..."
sudo dpkg -i "./emby-server.deb"

echo "Cleaning up..."
rm -rf "./emby-server.deb"

echo "Emby has been installed"
