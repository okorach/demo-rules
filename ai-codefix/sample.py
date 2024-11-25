#!/usr/bin/env python3

import sys

SAME = "The 2 strings are the same"
DIFFERENT = "The 2 strings are different"


"""Deprecated entry point for sonar-projects-export"""
args = sys.argv
arg1 = args[1]
arg2 = args[2]
ignorecase = True if args[3] == "true" else False

if ignorecase and arg1.lower() == arg2.lower():
    print(SAME)
elif not ignorecase and arg1 == arg2:
    print(SAME)
else:
    print(DIFFERENT)

