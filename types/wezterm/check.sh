#!/usr/bin/env bash

# shopt -s globstar
shopt -s globstar nullglob

err=0
trap 'err=1' ERR

# Lua 5.1/JIT does not include ./?/init.lua by default.
# Add it to ensure Teal over Lua 5.1/JIT sees ./?/init.d.tl files.
export LUA_PATH="./?.lua;./?/init.lua;$LUA_PATH"

for declfile in plugins/*.d.tl; do
    result=$(tl check "$declfile")
    status=$?
    if [ "$status" -ne 0 ]; then
        echo "======================== $declfile ========================"
        echo "$result"
    fi
done

exit $err
