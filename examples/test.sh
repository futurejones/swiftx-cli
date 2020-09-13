#!/bin/bash

echo "Starting Test 1 - helloworld"
echo
pushd swiftProjects/ || exit
echo "Building Test 1 - helloworld"
echo
swiftx build helloworld.swift
echo "Running Test 1 - helloworld"
echo
./helloworld
popd || exit
echo "End Test 1 - helloworld"
echo
echo "Starting Test 2 - hellomodule"
echo
pushd swiftProjects/ || exit
echo "Building Test 2 - hellomodule"
echo
swiftx build hellomodule.swift
echo "Running Test 2 - hellomodule"
echo
./hellomodule
popd || exit
echo "End Test 2 - hellomodule"
echo
echo "Starting Test 3 - libToday"
echo
pushd swiftModules/ || exit
echo "Building Test 3 - libToday"
echo
printf "today\n1.0.0\n" | swiftx create today.swift -p
echo "Installing Test 3 - libToday"
echo
sudo apt install -y ./libToday_1.0.0.deb
popd || exit
echo "End Test 3 - libToday"
echo
echo "Starting Test 4 - hellolib"
echo
pushd swiftProjects/ || exit
echo "Building Test 4 - hellolib"
echo
swiftx build hellolib.swift
echo "Running Test 4 - hellolib"
echo
./hellolib
popd || exit
echo "End Test 4 - hellolib"
echo
echo "**** All Tests Completed ****"
