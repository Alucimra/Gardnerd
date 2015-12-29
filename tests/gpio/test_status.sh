#!/bin/bash

STATUSMSG=`$SCRIPT_PATH`
STATUS1MSG=`$SCRIPT_PATH 1 status`

[[ "$STATUSMSG" == "$STATUS1MSG" ]]
testing "status is default"
