#!/bin/bash

HELPMSG=`$SCRIPT_PATH help`
HELP1MSG=`$SCRIPT_PATH`

[[ "$HELPMSG" == "$HELP1MSG" ]]
testing "help is default" $?

[[ "$HELPMSG" == *"allocate"* ]] && [[ "$HELPMSG" == *"reserve"* ]]
testing "help message" $?


