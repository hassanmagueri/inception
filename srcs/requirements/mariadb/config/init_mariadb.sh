#!/bin/bash
# service mariadb start;

mariadbd &
sleep 5
PID=$!

mysql << EOF
   CREATE OR REPLACE USER '$USER_NAME'@'%' IDENTIFIED BY 'aa'; 
    GRANT ALL PRIVILEGES ON *.* TO 'aa'@'%' WITH GRANT OPTION; 
    FLUSH PRIVILEGES;
EOF

# killall mariadbd
wait $PID 