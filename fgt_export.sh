#!/bin/bash
sed -n "/$1/,/^end$/p" "$2"
