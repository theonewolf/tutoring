#!/bin/bash
#
# create_db.sh - bash script that creates a test DB and table, and then inserts
#        10,000 random rows into it
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




# SQL Statements to run
CREATE_DB="CREATE DATABASE IF NOT EXISTS \`test\`;"
DROP_TABLE="USE \`test\`; DROP TABLE IF EXISTS \`uuids\`;"
CREATE_TABLE="USE \`test\`; CREATE TABLE \`uuids\` ( \
  \`uuid\` varchar(36) DEFAULT NULL, \
  \`randstring\` char(10) DEFAULT NULL \
) ENGINE=InnoDB DEFAULT CHARSET=latin1;"
INSERT_TABLE="USE \`test\`; INSERT INTO \`uuids\` \
VALUES ('%s', '%s');"

# Get user's MySQL Password
printf "What is your MySQL Password? "
read -s MYSQL_PASSWORD

# Create DB
printf 'Creating Database (%s)\n' "$CREATE_DB"
mysql -u root --password="$MYSQL_PASSWORD" -e "$CREATE_DB"
sleep 3

# Drop Table
printf 'Dropping Table (%s)\n' "$DROP_TABLE"
mysql -u root --password="$MYSQL_PASSWORD" -e "$DROP_TABLE"
sleep 3

# Create Table
printf 'Creating Table (%s)\n' "$CREATE_TABLE"
mysql -u root --password="$MYSQL_PASSWORD" -e "$CREATE_TABLE"

# Infinite Insertion loop
printf 'Hit CTRL+C to quite the infinite insertion loop...'
while true
do
    UUID=`uuidgen`
    RAND=`openssl rand -hex 5 | cut -b 1,2,3,4,5,6,7,8,9,10`
    mysql -u root --password="$MYSQL_PASSWORD" -e "`printf \"$INSERT_TABLE\" \"$UUID\" \"$RAND\"`"
done
