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
    run ../app/devpy
     echo "# output:  $output" >&3
}
@test "2. No previous settings, DEV_SUITES_DIR undefined " {
    unset DEV_SUITES_DIR
    run "../app/devpy"
    [ "${lines[0]}" = "DEV_SUITES_DIR and/or DEV_APP_DIR are not defined" ]
    [ "${lines[1]}" = "Please set and export DEV_SUITES_DIR AND DEV_APP_DIR in .bashrc" ]
  
}


@test "3. No previous settings, no parameters at all" {
    export DEV_SUITES_DIR=../test_data
    export DEV_APP_DIR=../app
    run  "../app/devpy"
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
