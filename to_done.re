


. Read about how daemons work and whether it’s a good idea to use them or not.

Read about PID 1 and the best practices for writing Dockerfiles.



\\\|||recommended that you use the Docker secrets to store any confidential information.

make make bonus

docker security



 WARNING overcommit_memory is set to 0! Background save may fail under low memory condition. To fix this issue add 'vm.overcommit_memory = 1' to /etc/sysctl.conf and then reboot or run the command 'sysctl vm.overcommit_memory=1' for this to take effect.
redis      | 7:M 26 Jan 2025 17:00:39.212 # WARNING you have Transparent Huge Pages (THP) support enabled in your kernel. This will create latency and memory usage issues with Redis. To fix this issue run the command 'echo madvise > /sys/kernel/mm/transparent_hugepage/enabled' as root, and add it to your /etc/rc.local in order to retain the setting after a reboot. Redis must be restarted after THP is disabled (set to 'madvise' or 'never').