#!/bin/bash

ME="$( basename "${BASH_SOURCE[0]}" )"
ROOTDIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
CONFDIR=$ROOT

# This script is stored on amzn.mws.3b8be74a-5f63-5960-5bad-19bd40c0ac65

buildDir="$ROOTDIR/build"
pylintReport="$buildDir/pylint-report.out"
# banditReport="$buildDir/bandit-report.json"

[ ! -d $buildDir ] && mkdir $buildDir

# Custom secret here
myToken=SECRET_0123456789

echo "Running pylint"
rm -f $pylintReport
pylint --rcfile $CONFDIR/pylintrc $ROOTDIR/*.py $ROOTDIR/*/*.py -r n --msg-template="{path}:{line}: [{msg_id}({symbol}), {obj}] {msg}" | tee $pylintReport
re=$?
if [ "$re" == "32" ]; then
    >&2 echo "ERROR: pylint execution failed, errcode $re, aborting..."
    exit $re
fi

# echo "Running bandit"
# rm -f $banditReport
# bandit --exit-zero -f json --skip B311,B303,B101 -r . -x .vscode,./tests >$banditReport

echo "Running shellcheck"
shellcheck $ROOTDIR/*.sh $ROOTDIR/*/*.sh -s bash -f json | $CONFDIR/shellcheck2sonar.py >$externalIssueReport
