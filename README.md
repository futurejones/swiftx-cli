# SwiftX
<img src="https://img.shields.io/badge/Swift-5.1 +-orange.svg" /> <img src="https://img.shields.io/badge/Debian-10-green.svg" /> <img src="https://img.shields.io/badge/Ubuntu-18.04-green.svg" /> <img src="https://img.shields.io/badge/Ubuntu-20.04-green.svg" /> <img src="https://img.shields.io/badge/RaspiOS-Buster-red.svg" /> <img src="https://img.shields.io/badge/Raspbian-Buster-red.svg" />  

### Create, build, and export Swift applications.
SwiftX uses the [Swift-Lite](https://swift-lite.org) system of meta-tags combined with a special build utility to make constructing a multi-file Swift project with Module and Library dependencies simple and easy.  
For more information please visit [Swift-Lite.org](https://swift-lite.org).  
SwiftX combines both `swift-lite-build` and `lib-builder` into one convenient build tool.

SwiftX is designed for use on Linux Debian based systems such as Debian, Ubuntu and RaspiOS. SwiftX is compatible with Swift versions 5.1 and above and can be used with a full Swift - `swiftlang` install, as well as with Swift-Lite - `swiftlang-min`.

SwiftX is available for x86_64, arm64 and arm architectures.

### Read the [Quick Start Guide](Getting_Started.md) for installation and getting started instructions.

## Sample Project File
helloworld.swift
```swift
// a swift project file
// include: today.swift

import Dispatch
import Foundation

print("Hello World")
printToday()  // function from today.swift module

```

## Sample Module File

today.swift
```swift
// a swift module file

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
NOTE: modules files must be located within the `swiftModules` directory. The location of the `swiftModules` directory can be set using `swiftx config`.
```bash
$ swiftx config --help

Set the swiftModule directory path.

Choose one of the following:-

    ‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾
 1. Local:
  This will look for modules within the project directory.
        e.g. /myProject/swiftModules/
        cmd = $ swiftx config --local
    ________________________________

 2. Default:
  This will look for modules within the $HOME directory.
        e.g. /$HOME/swiftModules/
        cmd = $ swiftx config --default
    ________________________________

 3. Custom:
  Use this option to set a custom directory.
        e.g. /custom/path/swiftModules/
        cmd = $ swiftx config --custom /my/custom/path/swiftModules/
    ________________________________

Usage:
  swiftx config [flags]

Flags:
  -c, --custom string   Set module path to custom
  -d, --default         Set module path to default
  -h, --help            help for config
  -l, --local           Set module path to local
```

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
$ swiftx create today.swift -p

building library - Today
    ________________________________

starting build...
Complete!

2020/09/11 12:17:33 build completed.
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
This will output an installable package file `libToday_1.0.0.deb`

## Export a Project with Swift-Slim runtime
```bash
$ swiftx export

export Swift install package.

    ‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾

enter app name:
helloworld
version number:
1.0.0

Complete!
helloworld_1.0.0.deb install package created.
Install: sudo apt install ./helloworld_1.0.0.deb
    ________________________________
```
This will output a self contained installable package file that includes the program executable and the `swift-slim` runtime. `helloworld_1.0.0.deb`

## Help
```bash
$ swiftx --help

A Swift build tool:

SwiftX allows you to quickly and easily create Swift applications.

    ————————————————

Features:
 Support for custom modules and libraries.
 Export self contained packages that include the Swift runtime

     ————————————————

Usage:
  swiftx [flags]
  swiftx [command]

Available Commands:
  build       Build a Swift project
  config      Set the swiftModule directory path.
  create      Create a Swift library
  export      Export self contained install package with Swift runtime
  help        Help about any command

Flags:
  -h, --help      help for swiftx
  -v, --version   Prints the swiftx version number

Use "swiftx [command] --help" for more information about a command.
```