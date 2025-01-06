#!/bin/bash

# mariadbd &
# sleep 5
# PID=$!

# mysql << EOF
#    CREATE OR REPLACE USER '$USER_NAME'@'%' IDENTIFIED BY 'aa'; 
#     GRANT ALL PRIVILEGES ON *.* TO 'aa'@'%' WITH GRANT OPTION; 
#     FLUSH PRIVILEGES;
# EOF

# wait $PID 


# mysql << EOF
#    CREATE OR REPLACE USER '$USER_NAME'@'%' IDENTIFIED BY 'aa'; 
#     GRANT ALL PRIVILEGES ON *.* TO 'aa'@'%' WITH GRANT OPTION; 
#     FLUSH PRIVILEGES;
# EOF

service mariadb start; # start the service in background
sleep 2;
mysql -u root  -e "CREATE OR REPLACE USER '$USER_NAME'@'%' IDENTIFIED BY 'aa'"
mysql -u root  -e "GRANT ALL PRIVILEGES ON *.* TO '$USER_NAME'@'%' WITH GRANT OPTION"
mysql -u root  -e "FLUSH PRIVILEGES"

killall -9 mariadbd; # stop the service

mariadbd # start the service in foreground