#!/bin/bash

TEST_DIR=$(dirname $0)

source "$TEST_DIR/setup.sh"

success(){
  local TEST_NAME="$1"
  
  if [[ "$2" ]]; then
    local SUCCESSMSG="$2"
  else
    local SUCCESSMSG="success"
  fi
  
  echo -e "  $TEST_NAME: \033[0;32m $SUCCESSMSG \033[0m"
}

failure(){
  local TEST_NAME=$1
  if [[ "$2" ]]; then
    local FAILMSG="$2"
  else
    local FAILMSG="failure"
  fi
  
  echo -e "  $TEST_NAME: \033[0;31m $FAILMSG \033[0m"
}

testing(){
  local CONDITIONS="$2"
  local TEST_NAME="$1"
  
  if [[ $CONDITIONS -eq 0  ]]; then
    success "  $TEST_NAME"
  else
    failure "  $TEST_NAME"
  fi
}


for i in $( ls "$TEST_DIR"/test_*.sh ); do
  echo
  echo "file: $(basename $i)"
  source $i
done

echo
