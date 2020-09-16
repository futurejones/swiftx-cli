[back](README.md)
---
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
sudo apt-get install swiftlang-min

# install swiftx
sudo apt-get install swiftx
```
## 2. `manual install`
Select the correct package from the [SwiftX release page](https://github.com/futurejones/swiftx-cli/releases/)
```bash
# download the swiftx .deb package
wget https://github.com/futurejones/swiftx-cli/releases/download/v3.0.0/swiftx_linux-arm64_3.0.0.deb

# install swiftx
sudo apt-get install ./swiftx_linux-arm64_3.0.0.deb
```
---
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
---
# Project 2 - Hello Module
## 1. Adding a Swift Module file.
In this project we will add a `swift module` file and use it in a project.

```bash
# goto the swiftModules directory
$ cd swiftModules
# create a module file - today.swift
$ touch today.swift
```
In you favorite editor add the following lines of code to today.swift.
```swift
import Foundation

public func printToday(){
    let date = Date()
    let dateFormatter = DateFormatter()

    dateFormatter.dateStyle = .full
    dateFormatter.timeStyle = .full

    let dateString = dateFormatter.string(from: date as Date)
    print("Welcome to Swift")
    print("Today is \(dateString)")
}
```
Return to the swiftProjects directory and edit the helloworld.swift file
```bash
$ cd swiftProjects
```
In you favorite editor change the code to the following.  
Use the `//include` tag to add the swift module.
```swift
// include: today.swift

printToday()
```
Use `SwiftX` to build the project
```bash
$ swiftx build helloworld.swift
#
# you should see the following output
building swift project - helloworld

    ‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾
Scanning for Modules... # here you can see the today.swift module was added
*** Adding today.swift to build command ***
    ________________________________

Scanning for Libraries...
*** no custom libraries found ***
    ________________________________

starting swift build...
Complete!

2020/09/15 07:38:44 build completed.
    ________________________________
#
# run ./helloworld to test
$ ./helloworld
Welcome to Swift
Today is Tuesday, September 15, 2020 at 7:40:56 AM British Summer Time
```
---
# Project 3 - Hello Library
In this project we will first create a `swift library` file and then use it in a project.
## 1. Create and install a Swift Library.

## 2. Importing a Swift Library.

---
# Project 4 - Hello Export
In this project we will export a `swift application` complete with the `Swift-Slim` runtime.
## 1. Export a Swift Application.

