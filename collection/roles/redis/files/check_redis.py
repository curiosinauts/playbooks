#!/usr/bin/env python3

from redis import *
from redis.exceptions import ConnectionError
import sys

r = Redis('127.0.0.1', socket_connect_timeout=1) # short timeout for the test

try:
    response = r.client_list()
except ConnectionError:
    print("redis error")
    exit(1)

print("ok")
