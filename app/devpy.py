#!/bin/python3
import os.path
def devpy():
  print (os.path.basename(__file__), "installed")
suite=""
gitReference=""
cmakeBuildType=""

parameters_suite=""
parameters_gitReference=""
parameters_cmakeBuildType=""

pwd_suite=""
pwd_gitReference=""
pwd_cmakeBuildType=""

env_suite=""
env_gitReference=""
env_cmakeBuildType=""

parameter1=""
parameter2=""
parameter3=""


if __name__ == "__main__":
    import doctest
    doctest.testmod()