#!/bin/bash

HELPMSG=$(testrun)
HELP1MSG=$(testrun help)

[[ "$HELPMSG" == "$HELP1MSG" ]]
testing "help is default" $?

[[ "$HELPMSG" == *"allocate"* ]] && [[ "$HELPMSG" == *"reserve"* ]]
testing "help message" $?


