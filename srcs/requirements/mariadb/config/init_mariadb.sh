#!/bin/bash

mysql << EOF
    CREATE USER '$USER_NAME'@'%' IDENTIFIED BY 'aa'; 
    GRANT ALL PRIVILEGES ON *.* TO 'aa'@'%' WITH GRANT OPTION; 
    FLUSH PRIVILEGES;
EOF

mariadbd;