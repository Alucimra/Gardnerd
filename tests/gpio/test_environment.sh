#!/bin/bash

MSG=$(testrun environment)
[[ $MSG == *"$GPIO_DIRECTORY"* ]] && [[ $MSG == *"$GPIO_SYSCLASS_PATH"* ]]
testing "gpio directory and sysclass" $?

MSG1=$(testrun 839 environment)
[[ $MSG1 == *"GPIO_NUM"* ]] && [[ $MSG1 == *"839.reserve"* ]] &&
  [[ $MSG1 == *"gpio839"* ]]
testing "gpio num path and reserve path" $?

