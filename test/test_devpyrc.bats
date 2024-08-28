#!/usr/bin/env bats
# test_devpyrc.bash

bats_require_minimum_version 1.5.0

setup_file() {
unset "${!DEV_*}"
}

@test "can run our script" {
    source ../app/devpyrc
}

@test "devpyrc must be sourced" {
  run ../app/devpyrc
    #echo "-----"
    #echo ${lines[0]}
    #echo "-----"
  [ "${lines[0]}" = "devpyrc cannot be run directly. Use: source devpyrc" ]
}

@test "No DEV_SUITES_DIR assigned" {
  export DEV_SUITES_DIR=
   run  /bin/bash <../app/devpyrc
      #echo "-----"
      #echo ${lines[0]}
      #echo "-----"
  [ "${lines[0]}" = "DEV_SUITES_DIR and/or DEV_APP_DIR are not defined" ]
}

@test "No DEV_APP_DIR assigned" {
  export DEV_APP_DIR=
   run  /bin/bash <../app/devpyrc
      #echo "-----"
      #echo ${lines[0]}
      #echo "-----"
  [ "${lines[0]}" = "DEV_SUITES_DIR and/or DEV_APP_DIR are not defined" ]
}

@test "DEV_SUITES_DIR assigned" {
  export DEV_SUITES_DIR=/work
    run  /bin/bash <../app/devpyrc
    echo ${#lines[@]}
    echo ${lines[0]}
  [ ${lines[0]} = "/work" ]

}