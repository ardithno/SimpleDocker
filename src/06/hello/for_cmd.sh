#!/bin/bash


spawn-fcgi -p 8080 -f ./hello.fcgi

nginx -g "daemon off;"





