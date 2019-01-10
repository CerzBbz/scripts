#!/bin/sh
# Used for commenting out contents of a file. Outputs to new file.
sed -e 's/^/#/' $1 > commented.$1
