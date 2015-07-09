#!/bin/bash
# must be called with sudo
echo "start of replace python script"
echo "$1"
echo "$2"
echo "$3"
rm -R /System/Library/Frameworks/Python.framework/Versions/$1
mv /Library/Frameworks/Python.framework/Versions/$2 /System/Library/Frameworks/Python.framework/Versions
chown -R root:wheel /System/Library/Frameworks/Python.framework/Versions/$2

rm /System/Library/Frameworks/Python.framework/Versions/Current
ln -s /System/Library/Frameworks/Python.framework/Versions/$2 /System/Library/Frameworks/Python.framework/Versions/Current

rm /usr/bin/pydoc
rm /usr/bin/python
rm /usr/bin/pythonw
rm /usr/bin/python-config

ln -s /System/Library/Frameworks/Python.framework/Versions/$2/bin/pydoc$3 /usr/bin/pydoc
ln -s /System/Library/Frameworks/Python.framework/Versions/$2/bin/python$3 /usr/bin/python
ln -s /System/Library/Frameworks/Python.framework/Versions/$2/bin/pythonw$3 /usr/bin/pythonw
ln -s /System/Library/Frameworks/Python.framework/Versions/$2/bin/python$3-config /usr/bin/python-config
