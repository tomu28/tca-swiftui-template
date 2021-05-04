#! /bin/bash

shopt -s expand_aliases

alias package-run='xcrun --sdk macosx swift run --package-path Tools'

cd $(pwd)/../

CHANGED_FILES=$(git status -s | grep -E '^\s*[^D]+\s+.*\.swift$' | awk -F ' ' '{print $2}')

if [ -z $CHANGED_FILES ]; then
    echo "No files changed. Skip prebuild script."
    exit 0
fi

echo execute SwiftLint
echo -n $CHANGED_FILES | while read filename; do
    package-run swiftlint --quiet --path $filename
done

echo execute SwiftFormat
    package-run swiftformat $CHANGED_FILES --lint || echo "warning: Incorrect code format found. Run \`make run-swiftformat\`."
