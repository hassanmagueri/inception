CREATE USER 'aa'@'%' IDENTIFIED BY 'aa'; 
GRANT ALL PRIVILEGES ON *.* TO 'aa'@'%' WITH GRANT OPTION; 
FLUSH PRIVILEGES;