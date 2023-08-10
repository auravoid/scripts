#!/bin/bash

echo "Downloading..."
curl -s https://api.github.com/repos/muety/wakapi/releases/latest | grep "browser_download_url.*wakapi_linux_amd64.zip" | cut -d : -f 2,3 | tr -d \" | wget -i - -q --show-progress -O ./wakapi.zip

echo "Extracting..."
unzip -o -q -j wakapi.zip 'wakapi' -d ./

echo "Cleaning up..."
rm wakapi.zip

echo "Done!"
