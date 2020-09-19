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
wget https://github.com/futurejones/swiftx-cli/releases/download/v1.0.0/swiftx_linux-arm64_1.0.0.deb

# install swiftx
sudo apt-get install ./swiftx_linux-arm64_1.0.0.deb
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
To create the library we will be using the `SwiftX` create function.
```bash
$ swiftx create --help

Create a Swift library.

    ‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾
 1. create a Library from a single source file.
	- swiftx create <file.swift> -o <Lib_Name>
    ________________________________

 2. create a Library from a multiple files in a <Sources> directory.
	- swiftx create -o <Lib_Name>
    ________________________________

Usage:
  swiftx create [filename] [flags]

Flags:
  -h, --help            help for create
  -o, --output string   Set library name
  -p, --package         Package library
```
*Note: The default name for the library is the file name. To change this use the `--output` flag.*
```bash
# goto the swiftModules directory
$ cd swiftModules
# create a library from the today.swift module file.
# use the -p flag to create a .deb install package
$ swiftx create today.swift -p

building library - Today
    ________________________________

starting build...
Complete!

2020/09/18 10:43:40 build completed.
    ________________________________

Enter details for install package...
package name:
today
version number:
1.0.0

Complete!
libToday_1.0.0.deb install package created.
Install: sudo apt install ./libToday_1.0.0.deb
    ________________________________
```
Install the library
```bash
$ sudo apt install ./libToday_1.0.0.deb

Reading package lists... Done
Building dependency tree       
Reading state information... Done
Note, selecting 'today' instead of './libToday_1.0.0.deb'
The following NEW packages will be installed:
  today
0 upgraded, 1 newly installed, 0 to remove and 8 not upgraded.
Need to get 0 B/10.8 kB of archives.
After this operation, 0 B of additional disk space will be used.
Get:1 /home/pi/swiftModules/libToday_1.0.0.deb today armhf 1.0.0 [10.8 kB]
Selecting previously unselected package today.
(Reading database ... 42958 files and directories currently installed.)
Preparing to unpack .../libToday_1.0.0.deb ...
Unpacking today (1.0.0) ...
Setting up today (1.0.0) ...
```
## 2. Importing a Swift Library.
Now that we have `libToday` installed we can use the `import` statement to use it in our project.  
Return to the swiftProjects directory and edit the helloworld.swift file
```bash
$ cd swiftProjects
```
In you favorite editor change the code to the following.  
Use the `import` statement to add the swift library.
```swift
import Today

printToday()
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

Scanning for Libraries... # here you can see the Today library was added
*** Adding Today to build command ***
    ________________________________

starting swift build...
Complete!

2020/09/18 15:06:59 build completed.
    ________________________________
#
# run ./helloworld to test
$ ./helloworld
Welcome to Swift
Today is Tuesday, September 15, 2020 at 7:40:56 AM British Summer Time
```

---
# Project 4 - Hello Export
In this project we will export a `swift application` complete with the `Swift-Slim` runtime.
## 1. Export a Swift Application.
To export an executable use the `SwiftX` export feature.
```bash
$ swiftx export --help

Export self contained install package with Swift-Slim runtime.

    ‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾
Example:
$ swiftx export [executable]
$ swiftx export helloworld
    ________________________________

Usage:
  swiftx export [exec file] [flags]

Flags:
  -h, --help   help for export
```
Export `helloworld`
```bash
$ swiftx export helloworld

exporting Swift-Slim helloworld install package.

    ‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾

enter app version number:
1.0.0

Complete!
helloworld_1.0.0.deb install package created.
Install: sudo apt install ./helloworld_1.0.0.deb
    ________________________________
```
The `helloworld_1.0.0.deb` package can now be installed and run on any compatible system without the need to pre-install `Swift`.  
As the package only includes just enough of `Swift` for the application to run it is just a faction of the size of the ful `Swift` install.  
Full Swift Install = 362MB - expanding to 1.16GB  
SWift-Slim including executable = 10.2MB - expanding to 53MB
