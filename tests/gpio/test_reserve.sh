#!/bin/bash

MSG0=$(testrun 1 reserve 2>&1)

[[ $? -gt 0 ]]
testing "fail if already reserved" $?

[[ $MSG0 == *"wone-derful number"* ]]
testing "when reserved, output last reserve" $?

MSG2=$(testrun 10 reserved?)
[[ $? -eq 0 ]] && [[ $MSG2 == "0" ]]
testing "checking when no reserve" $?

DESC="Ten is 1 and then 0"
MSG1=$(testrun 10 reserve "$DESC")
[[ $? -eq 0 ]]
testing "reserve with description" $?

[[ $MSG1 == *"$DESC"* ]]
testing "output latest description when reserving" $?

MSG3=$(testrun 10 reserved?)
[[ $? -eq 1 ]] && [[ $MSG3 == "1" ]]
testing "checking when there is a reserve" $?

MSG4=$(testrun 10 reservation)
[[ $? -eq 0 ]] && [[ $MSG4 == "$DESC" ]]
testing "reading the reservation when reserved" $?

MSG5=$(testrun 11 reservation 2>&1)
[[ $? -gt 0 ]] && [[ $MSG5 == *"Not Reserved"* ]]
testing "reading the reservation without reserve" $?

MSG6=$(testrun 10 release)
[[ $? -eq 0 ]] && [[ $MSG6 == "$DESC" ]]
testing "releasing the reserve" $?

MSG7=$(testrun 11 release 2>&1)
[[ $? -gt 0 ]] && [[ $MSG7 == *"Not Reserved"* ]]
testing "releasing without a reserve" $?
