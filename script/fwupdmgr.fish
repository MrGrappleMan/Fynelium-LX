#!/usr/bin/env fish

# Alias
alias fwu "fwupdmgr"
alias fwurepadd "fwupdmgr enable-remote -y"

# REP ADD
fwurepadd lvfs
fwurepadd lvfs-testing
