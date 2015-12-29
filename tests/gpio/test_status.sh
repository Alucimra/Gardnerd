#!/bin/bash

STATUSMSG=$( testrun 0 )
STATUS1MSG=$( testrun 0 status)

[[ "$STATUSMSG" == "$STATUS1MSG" ]]
testing "status is default if port is given" $?

[[ "$STATUSMSG" == *"Reservation: NONE"* ]]
testing "when there is no reservation" $?

MSG2=$( testrun 1 status )
[[ $MSG2 == *"Reserved"* ]] && [[ $MSG2 == *"Exported: no"* ]]
testing "when there is a reservation" $?

MSG3=$( testrun 2 status )
[[ $MSG3 == *"Reserved"* ]] && [[ $MSG3 == *"Exported: yes"* ]] &&
  [[ $MSG3 == *"tool"* ]] &&
    [[ $MSG3 == *"Value: 1"* ]] && [[ $MSG3 == *"Direction: in"* ]]
testing "when there is a reservation and exported" $?

MSG4=$( testrun 3 status )
[[ $MSG4 == *"NONE"* ]] && [[ $MSG4 == *"Exported: yes"* ]] &&
    [[ $MSG4 == *"Value: 0"* ]] && [[ $MSG4 == *"Direction: out"* ]]
testing "when there is no reservation and exported" $?
