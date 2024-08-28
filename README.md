# devPy - A development utility

devPy is intended to make starting a project and ongoing development easy by providing standardized routines for everyday activities

## Typical Activities

### Install and Configure devpy

* Install devpy

* designate a directory or directories to contain projects
* designate a prefix for devpy environment variables
* configure development branches of devPy

### Usage

* Switch between installed and one or more branches of devpy

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



devpy works with regular git repositories or bare git repositories with worktrees.

An installation of devpy is just a clone of its git repository, either regular or bare.
Configuration is started by executing dev.py from the clone's worktree on any branch.

devpy is used on projects.  devpy is itself a project.  Choose a directory to contain projects you will use devpy with

for example /work/suites or /work/projects

  cd to your projects or suites directory

``` bash
  DEV_PROJECTS_PATH=/work/suites
  cd $DEV_PROJECTS_PATH
  mkdir -p dev1py; cd dev1py
  mkdir -p project repos trees
  cd repos
  git clone --bare https://github.com/callahanp/dev1py.git
  DEV_WORKTREE_PATH=/work/suites/dev1py/worktrees
  git worktree add -B main $DEV1_WORKTREE_PATH/dev1py.main
  git worktree add -B next $DEV1_WORKTREE_PATH/dev1py.next
  cd DEV_WORKTREE_PATH=/work/suites/dev1py/worktree/dev1py.main
  ./dev1.py
```

