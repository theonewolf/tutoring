#!/bin/bash
#
# memory_checker.sh - bash script that periodically checks the memory usage of
#             a running process
#
#
# The MIT License (MIT)
# 
# Copyright (c) 2014 Wolfgang Richter <wolfgang.richter@gmail.com>
# 
# Permission is hereby granted, free of charge, to any person obtaining a copy
# of this software and associated documentation files (the "Software"), to deal
# in the Software without restriction, including without limitation the rights
# to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
# copies of the Software, and to permit persons to whom the Software is
# furnished to do so, subject to the following conditions:
# 
# The above copyright notice and this permission notice shall be included in
# all copies or substantial portions of the Software.
# 
# THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
# IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
# FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
# AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
# LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
# OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
# THE SOFTWARE.


### Check and ensure we are being used properly (have one argument)
USAGE="%s <Program Name>\n"

if [ "$#" -lt 1 ]
then
    printf "$USAGE" "$0"
    exit 1
fi

### Printout information before heading to loop
PID=`pidof -s "$1"`

printf 'Following the memory usage of: %s\n' "$1"
printf 'PID is: %d\n' "$PID"

### Loop checking on memory usage of the process
while true
do
    VMRSS=`grep VmRSS /proc/$PID/status | cut -f 2,3`
    printf 'Used RSS Memory: %s\n' "$VMRSS"
    sleep 5
done
