#!/bin/sh
echo "Creating testfile"
dd if=/dev/urandom of=test.in count=100
echo "Deleting file from dCache"
curl -XDELETE http://127.0.0.1:2880/data/world-writable/curl-testfile.txt
echo "Copy file to dCache"
curl -T test.in http://127.0.0.1:2880/data/world-writable/curl-testfile.txt
echo "Copy file from dCache"
curl http://127.0.0.1:2880/data/world-writable/curl-testfile.txt -o test.out
md5sum test.{in,out} && rm -f test.{in,out}
