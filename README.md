# SwiftX

Create, build, and export Swift applications.

## Build a Swift Project
Build project from file `helloworld.swift`
```bash
$ swiftx build helloworld.swift
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
