#!/bin/bash


redis-server --bind 0.0.0.0 --protected-mode "no" --requirepass $(cat /run/secrets/redis_pass)