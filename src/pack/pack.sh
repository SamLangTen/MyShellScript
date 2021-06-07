#!/bin/bash
echo "Welcome to PACK by SamLangTen!"
echo "-----------------------------"
echo "PACK can pack subfolders into ZIP."
echo "NOTICE: Make sure that command \"zip\" has been installed!"
echo ""

if [ -n "$1" ]; then
    PACK_PATH=$1
else
    PACK_PATH=$(pwd)
fi
cd ${PACK_PATH}

DIR_COUNT=$(ls -l | grep "^d" | wc -l)
i=1
echo "${DIR_COUNT} folder(s) need to be packed in total."
echo ""
ls ${PACK_PATH} | while read LINE
do
    if [ -f "${PACK_PATH}/$LINE" ]; then
        continue;
    fi
    echo -n "($i/${DIR_COUNT})Packing ${PACK_PATH}/$LINE into ${PACK_PATH}/$LINE.zip...";
    cd "$LINE";
    zip "$LINE.zip" * > /dev/null;
    mv "$LINE.zip" ../
    echo "Done!"
    cd ..;
    i=$(( $i + 1 ))
done
