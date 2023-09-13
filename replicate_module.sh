#!/bin/bash

# Replicates the gax-test00 module to gax-test01 to gax-test09.

for N in `seq 9`; do
  suffix=$(printf "%02d" "${N}")
  rm -rf "gax-test${suffix}"
  cp -r gax-test00 "gax-test${suffix}"
  sed -i.bak -e "s/gax-test00/gax-test${suffix}" "gax-test${suffix}/pom.xml"
done