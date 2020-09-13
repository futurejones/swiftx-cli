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