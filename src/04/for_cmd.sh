#!/bin/bash

gcc hello.c -o hello.fcgi -lfcgi

spawn-fcgi -p 8080 -f ./hello.fcgi

nginx -g "daemon off;"



