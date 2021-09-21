#!/bin/bash

curl -f -o /dev/null -s http://localhost:8000/ || exit $?
