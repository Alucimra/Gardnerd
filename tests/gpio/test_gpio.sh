#!/bin/bash

MSG0=$(testrun 20 'export')
[[ $? -eq 0 ]] && [[ $(cat "$GPIO_SYSCLASS_PATH/export") == "20" ]]
testing "export of not exported" $?

MSG1=$(testrun 21 'unexport' 2>&1)
[[ $? -gt 0 ]] && [[ $(cat "$GPIO_SYSCLASS_PATH/unexport") != "21" ]] &&
  [[ $MSG1 == *"Not Exported"* ]]
testing "unexport of not exported" $?

MSG2=$(testrun 22 'export' 2>&1)
[[ $? -gt 0 ]] && [[ $(cat "$GPIO_SYSCLASS_PATH/export") != "22" ]] &&
  [[ $MSG2 == *"Already Exported"* ]]
testing "export of already exported" $?

MSG3=$(testrun 22 'unexport' 2>&1)
[[ $? -eq 0 ]] && [[ $(cat "$GPIO_SYSCLASS_PATH/unexport") == "22" ]]
testing "unexport of already exported" $?

# TODO: Test WAIT_SECONDS. Forking worth the test?

# TODO: Test allocate (it requires us to create the directory via a fork)

MSG4=$(testrun 3 'direction?')
[[ $? -eq 0 ]] && [[ $MSG4 == "out" ]]
testing "check direction of an exported" $?

MSG5=$(testrun 5 'direction?' 2>&1)
[[ $? -ne 0 ]] && [[ $MSG5 == *"Not Exported"* ]]
testing "checks direction without exporting" $?

MSG6=$(testrun 23 direction 2>&1)
[[ $? -ne 0 ]] && [[ $MSG6 == *"No direction given"* ]]
testing "no direction given" $?

MSG7=$(testrun 23 direction out 2>&1)
[[ $? -eq 0 ]] && [[ $MSG7 == "out" ]]
testing "setting direction" $?

MSG8=$(testrun 21 direction high 2>&1)
[[ $? -ne 0 ]] && [[ $MSG8 == *"Not Exported"* ]]
testing "setting direction of not exported" $?

MSG9=$(testrun 3 value)
[[ $? -eq 0 ]] && [[ $MSG9 == "0" ]]
testing "getting the value of exported" $?

MSG10=$(testrun 24 value 2>&1)
[[ $? -ne 0 ]] && [[ $MSG10 == *"Not Exported"* ]]
testing "getting the value of non-exported" $?

MSG11=$(testrun 23 'write' 1)
[[ $? -eq 0 ]] && [[ $MSG11 == "1" ]] && [[ $(testrun 23 value) == "1" ]]
testing "writing the value of exported" $?

MSG12=$(testrun 21 'write' 2 2>&1)
[[ $? -ne 0 ]] && [[ $MSG12 == *"Not Exported"* ]]
testing "writing the value of non-exported" $?


# TODO: Test the shortcuts: in/out/high/low/up/down
