import Cocoa

var landscape : Bool {
    let size = NSScreen.main!.frame.size
    return size.width > size.height
}


