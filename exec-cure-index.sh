#!/bin/bash

# Use with a command like:
# stack build --pedantic --exec "bash exec-cure-index.sh"

stack exec cure-index | jq .
