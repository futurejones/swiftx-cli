[back](README.md)
# Getting Started
## Prerequisites
1. You will need one of the following Debian based Linux installations.  
Debian 10  
Ubuntu 18.04  
Ubuntu 20.04  
Raspbian Buster  
RaspiOS Buster

2. Swift version 5.1 or later.  
NOTE: Swift must be installed in the default location `</usr/lib/ /usr/bin/>` for the export `swift-slim` feature to work.  
SwiftX works with both the full Swift install (`swiftlang`) and the Swift-Lite install (`swiftlang-min`)

## Installation
## 1. `apt-get install`
This simplest way to install both `Swift` and `SwiftX` is to use the [Swift-Arm](https://packagecloud.io/swift-arm/release) package repo.
```sh
# install the package repo
curl -s https://packagecloud.io/install/repositories/swift-arm/release/script.deb.sh | sudo bash

# install swiftlang or swiftlang-min
sudo apt-get install swiftlang

# install swiftx
sudo apt-get install swiftx
```
## 2. `manual install`
Select the correct package from the [SwiftX release page](https://github.com/futurejones/swiftx-cli/releases/)
```bash
# download the swiftx .deb package
wget https://github.com/futurejones/swiftx-cli/releases/download/v3.0.0/swiftx_linux-arm64_3.0.0.deb

# install swiftx
sudo apt-get install swiftx_linux-arm64_3.0.0.deb
```
# Project 1 - Hello World
## 1. Setting up directory structure.
One of the key features of `SwiftX` is the ability include and re-use `swift module` files with multiple projects. To achieve this we need to have a single location for all our `swift module` files.  
This is the `swiftModules` directory.  
By default the `swiftModules` directory is located in the `$HOME/$USER` directory.  
```bash
# create a project and module directory
$ mkdir swiftProjects
$ mkdir swiftModules
```
Create a quick `helloworld` project.

```bash
# goto projects directory
$ cd swiftProjects
# create helloworld.swift file
$ touch helloworld.swift
```
In you favorite editor add the following line of code to helloworld.swift.
```swift
print("Hello World!")
```
Use `SwiftX` to build the project
```bash
$ swiftx build helloworld.swift
#
# you should see the following output
building swift project - helloworld

    ‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾
Scanning for Modules...
*** no modules found ***
    ________________________________

Scanning for Libraries...
*** no custom libraries found ***
    ________________________________

starting swift build...
Complete!

2020/09/15 07:17:10 build completed.
    ________________________________
#
# run ./helloworld to test
$ ./helloworld
Hello World!
```

