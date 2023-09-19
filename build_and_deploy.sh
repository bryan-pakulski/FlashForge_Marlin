#!/bin/bash

echo "Saving build output to build/build.log"

mkdir -p build
./marlin_builder.sh -m nx -l > build/build.log 2>&1

echo "Build Complete!"

# Get latest build
latest_file=$(ls -t build/*.bin 2>/dev/null | head -1)

sudo ./ff_flash_firmware.py ${latest_file}