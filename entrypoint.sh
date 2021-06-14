#!/usr/bin/env bash
#   ########################################################################
#   Copyright 2021 Splunk Inc.
#
#    Licensed under the Apache License, Version 2.0 (the "License");
#    you may not use this file except in compliance with the License.
#    You may obtain a copy of the License at
#
#        http://www.apache.org/licenses/LICENSE-2.0
#
#    Unless required by applicable law or agreed to in writing, software
#    distributed under the License is distributed on an "AS IS" BASIS,
#    WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
#    See the License for the specific language governing permissions and
#    limitations under the License.
#   ######################################################################## 


if [ "$CI" = "true" ]
then
    echo in CI    
    if [ ! -z $INPUT_VERSION ]; then ARG_VERSION="--ta-version=${INPUT_VERSION}"; fi
    echo executing ucc-gen $ARG_VERSION
    ucc-gen $ARG_VERSION
    ec=$?
else
    ucc-gen $@
    ec=$?
fi

OUTPUT=output/$(ls output/)

echo "::set-output name=OUTPUT::$OUTPUT"
exit $ec