# dev1Py - A development utility
 
dev1Py is intended to make starting a project and ongoing development easy by providing standardized routines for everyday activities

## Typical Activities

### Install and Configure Dev1py

* Install dev1py

* designate a directory or directories to contain projects
* designate a prefix for dev1py environment variables
* configure development branches of Dev1Py

### Usage

* Switch between installed and one or more branches of Dev1py
  
Create:

* Projects
* Local git repositories
* Clones of local or remote repositories
* Attach a local repository to a new Github, Gitlab, or Sourceforge repository
* designate a repository as a personal or associate fork or upstream official repository
  
Manage:

* Personal, associate, and upstream forks and official repositories
* Activities of multiple developers on a branch
* Merge requests
* Branches
* Builds
* Execution
* Logging
* Throway copies of projects

## Overview



Dev1py works with regular git repositories or bare git repositories with worktrees. 

An installation of dev1py is just a clone of its git repository, either regular or bare.
Configuration is started by executing dev1.py from the clone's worktree on any branch.

  cd to your install directory
  
  DEV1_INSTALL_DIR=$(pwd)
  mkdir -p $DEV1_INSTALL_DIR/repositories
  cd $DEV1_INSTALL_DIR/repositories
  git clone --bare https://github.com/callahanp/dev1py.git 
  cd $DEV1_INSTALL_DIR/repositories/dev1py.git
  branch=Main
  DEV1_WORKTREES_PATH=$DEV1_INSTALL_DIR/worktrees
  mkdir -p $DEV1_WORKTREEs_PATH
  DEV1_WORKTREE_PATH=$DEV1_WORKTREES_PATH/dev1py.$branch
  git worktree add -B $branch $DEV1_WORKTREE_PATH
  chmod +x $DEV1_WORKTREE_PATH/dev1.py
  $DEV1_WORKTREE_PATH/dev1.py

 
