#!/usr/bin/env bats
# test_devpy
#bats_require_minimum_version 1.5.0
setup_file() {
unset "${DEV_SUITES_DIR}"
unset "${DEV_APP_DIR}"
return 0
}


@test "1. can run our script" {
    echo "pwd: $(pwd)"
    export DEV_APP_DIR=../app
    run source $DEV_APP_DIR/dev0
    echo "# output:  $output" >&3
}
@test "2. No previous settings, DEV_SUITES_DIR undefined " {
    unset DEV_SUITES_DIR
    export DEV_APP_DIR=../app
    run source $DEV_APP_DIR/dev0
    [ "${lines[0]}" = "DEV_SUITES_DIR and/or DEV_APP_DIR are not defined" ]
    [ "${lines[1]}" = "Please set and export DEV_SUITES_DIR AND DEV_APP_DIR in .bashrc" ]
}


@test "3. No previous settings, no parameters at all" {
    export DEV_SUITES_DIR=../test_data
    export DEV_APP_DIR=../app
    run  /bin/bash pwd;source $DEV_APP_DIR/dev0
    echo "# output: $output" >&3
}

# shellcheck disable=SC2207
# shellcheck disable=SC2010
validSuites=( $(ls -l "$DEV_SUITES_DIR" |grep -e "^d"|sed -e 's/.* //') )
commands=( suite s ide i build b run r )
commands_text="suite or s, ide or i, build or b, run or r"

valid__cmakeBuildTypes=( Debug debug D d Release release R r RelWithDebInfo relwithdebinfo RD Rd rd MinSizeRel M m )
cdTargets=( b build e edit p project r repository rs repositories t tree ts trees w worktree ws worktrees )
declare -A _cmakeBuildTypes_lookup=( \
  ["Debug"]="Debug"                   ["debug"]="Debug"     ["d"]="Debug"   ["D"]="Debug" \
  ["Release"]="Release"               ["release"]="Release" ["r"]="Release" ["R"]="Release" \
  ["RelWithDebInfo"]="RelWithDebInfo" ["relwithdebinfo"]="RelWithDebInfo" \
  ["rd"]="RelWithDebInfo"             ["Rd"]="RelWithDebInfo" ["RD"]="RelWithDebInfo" \
  ["MinSizeRel"]="MinSizeRel"         ["minsizerel"]="MinSizeRel" \
  ["m"]="MinSizeRel"                  ["M"]="MinSizeRel" )
declare -A _commands_lookup=( ["b"]="fBuild" ["i"]="fIde" ["r"]="frun" )

declare -g _suiteName
declare -g _gitReference
declare -g _cmakeBuildType
declare -g _devSuitesDir
declare -g _codeWorkspacePath

declare -g _suiteNamePrevious
declare -g _gitReferencePrevious
declare -g _cmakeBuildTypePrevious

declare -g _cdTarget

declare -g _treesDir

function fCMakeBuildType(){
  if [[ "$1" != "--" && "$1" != "" && " ${valid__cmakeBuildTypes[*]} " =~ [[:space:]]$1[[:space:]] ]]; then
    _cmakeBuildType=$1
    return 0
  else
    return 1
  fi
}

function fSuiteName(){

# parameter is a string matching a script
  if [[ "$_suiteName" == "" \
        && "$1" != ""
        && "$1" != "--"
        && " ${validSuites[*]} " =~ [[:space:]]$1[[:space:]] ]]; then
    _suiteName="$1"
  fi

# parameter is empty and our path includes a suite
  if [[ "$_suiteName" == "" \
        && "$1" == "" ]]; then
    d=$(pwd);echo "pwd: $(pwd)";d=${d##"$DEV_SUITES_DIR"/};d=${d%%/*}
    if [[ " ${validSuites[*]} " =~ [[:space:]]${d}[[:space:]] ]]; then
      _suiteName=$d
    fi
  fi
# and if our path doesn't include a suite:
# parameter is empty, suite name is empty, then use the previous value
  if [[ "$_suiteName" == "" && "$1" == "" ]]; then
    # shellcheck disable=SC2154
    _suiteName=$_suiteNamePrev #defined by sourcing set_prev_environment
  fi

  return 0
}

function fcd(){
  if [[ "$1" == "cd" ]]; then
    if [[ ! " ${cdTargets[*]} " =~ [[:space:]]$2[[:space:]] ]]; then
      return 1
    else
      _cdTarget="$2"
      return 2
    fi
  fi
  return 0
}
