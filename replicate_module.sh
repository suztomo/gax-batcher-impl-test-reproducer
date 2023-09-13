#!/bin/bash

# Replicates the gax-test00 module to gax-test01 to gax-test09.

COUNT=9

for N in `seq ${COUNT}`; do
  suffix=$(printf "%02d" "${N}")
  module="gax-test${suffix}"
  rm -rf "${module}"
  cp -r gax-test00 $module
  sed -i.bak -e "s/gax-test00/gax-test${suffix}/" "${module}/pom.xml"
  echo "        <module>${module}</module>"
done

echo "Ensure to add these modules in the root pom.xml"

