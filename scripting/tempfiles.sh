#!/bin/bash

echo "Creating temp files"
for (( i=1; i<=5; i++ ));
do
	echo "hello world $i" >> tempfile-${i}.txt
done

echo "temp files created"

echo "Reading from temp files"
for (( i=1; i<=5; i++ ));
do
	FILE_CONTENT=`cat tempfile-${i}.txt`
	echo ${FILE_CONTENT}
done

echo "Deleting temp files"
for (( i=1; i<=5; i++ ));
do
        rm tempfile-${i}.txt
done

echo "temp files deleted"
