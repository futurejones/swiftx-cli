# SwiftX

<p align="center">
<img src="images/SwiftX_icon@128.png" alt="SwiftX logo" height="128">  
<p align="center">
Create, build, and export Swift applications.
</p>

#

# Build a Swift Project
Build project from file 'helloworld.swift'  
`$ swiftx build helloworld.swift`  
This will output an executable file `helloworld`

#

# Create a Swift Library
Create a library from a single swift file.  
`$ swiftx create today.swift`  
This will output an installable package file `libToday_1.0.0.deb`

#

# Export a Project with Swift-Slim runtime
`$ swiftx export`  
This will output a self contained installable package file that includes the program executable and the `swift-slim` runtime. `helloworld_1.0.0.deb`

#