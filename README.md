# SwiftX

Create, build, and export Swift applications.

## Build a Swift Project
Build project from file `helloworld.swift`
```bash
$ swiftx build helloworld.swift

building swift project - helloworld

    ‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾
Scanning for Modules...
*** Adding today.swift to build command ***
    ________________________________

Scanning for Libraries...
Dispatch is a standard library 
Foundation is a standard library 
*** no custom libraries found ***
    ________________________________

starting swift build...
Complete!

2020/09/11 12:09:55 build completed.
    ________________________________
```
This will output an executable file `helloworld`

## Create a Swift Library
Create a library from a single swift file.
```bash
$ swiftx create today.swift
```
This will output an installable package file `libToday_1.0.0.deb`

## Export a Project with Swift-Slim runtime
```bash
$ swiftx export
```
This will output a self contained installable package file that includes the program executable and the `swift-slim` runtime. `helloworld_1.0.0.deb`
