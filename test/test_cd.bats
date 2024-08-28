#!/usr/bin/env bats
# test_devpy

#bats_require_minimum_version 1.5.0
setup_file() {
echo "in setup_file"
}

@test "1. can run our script" {
    run ../app/cd
      i=0
  while [ $i -lt ${#lines[@]} ]; do
    echo --${lines[$i]}--
    ((i=i+1))
  done
  echo "# output: $output" >&3
  
}


@test "2. next script starts over in directory above " {
   echo "Starting in $(pwd)"
    cd ../
    echo "Landing in $(pwd)"
    run ../dev1py.next/app/cd
      i=0
  while [ $i -lt ${#lines[@]} ]; do
    echo --${lines[$i]}--
    ((i=i+1))
  done
  echo "# output: $output" >&3
}

@test "3. next script starts over? " {
    echo "Starting in $(pwd)"
    cd ../test_data/wxyz
    echo "Landing in $(pwd)"
 
    run ../../app/cd
      i=0
  while [ $i -lt ${#lines[@]} ]; do
    echo --${lines[$i]}--
    ((i=i+1))
  done
  echo "# output: $output" >&3
}

@test "4. test env var from test? " {

    export b="This was set in the test script before run"
    run ../app/cd
      i=0
  while [ $i -lt ${#lines[@]} ]; do
    echo --${lines[$i]}--
    ((i=i+1))
  done
  echo "# output: $output" >&3
}

