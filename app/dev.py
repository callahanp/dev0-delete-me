#!/bin/python3
"""

1 Reads a configuration file to place or check the existence of

* repositories
* worktrees
* code-workspaces
* build directories
* symbolic links to worktrees in build directories

2 opens code workspace with a multi-root code workspace
  customized for a branch, tag or specific commit

3 builds using a script customized for combination of

  * suite-name
  * git branch, tag or commit
  * CMake build type
    * Debug             d
    * RelWithDebInfo    rd
    * Release           r
    * MinSizeRel        m


4 runs bash scripts customized for a particular combination of
  using the same options as builds

"""
import os.path
from devpy import devpy
print (os.path.basename(__file__), "installed")
devpy()
if __name__ == "__main__":
    import doctest
    doctest.testmod()