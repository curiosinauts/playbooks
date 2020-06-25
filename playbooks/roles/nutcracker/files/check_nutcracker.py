#!/usr/bin/env python

from redis import *
from redis.exceptions import ConnectionError
import sys

r = Redis('127.0.0.1', port=22221, socket_connect_timeout=1) # short timeout for the test

try:
    response = r.get("foo")
except ConnectionError:
    print("nutcracker error")
    exit(1)

print("ok")
