//
//  AppDelegate.swift
//  NSTrackingArea Bug
//
//  Created by John Siracusa on 11/9/22.
//

import Cocoa

@main
class AppDelegate: NSObject, NSApplicationDelegate {
    var window : NSWindow!
    var textField : NSTextField!
   
    func applicationDidFinishLaunching(_ aNotification: Notification) {
        let view = TrackingView()

        self.window = NSWindow(
            contentRect: NSRect(x: 0, y: 0, width: 600, height: 400),
            styleMask: [ .titled ],
            backing: .buffered,
            defer: false
        )

        self.window.title = "Test Window"

        self.window.contentView = view

        self.textField = NSTextField(frame: NSRect(x: 10, y: 10, width: 580, height: 380))
        self.textField.font = .systemFont(ofSize: 18)
        self.textField.isEditable = false
        self.textField.isBezeled = false
        self.textField.drawsBackground = false
        self.textField.stringValue =
            "Move the cursor in and out of this window. Notice how the background color changes to red when the mouse is inside the window.\n\n" +
            "Now drag a file from the Finder and wave it over this window.\n\n" +
            "Expected result:\n\tThe background color changes to red.\n\n" +
            "Actual result:\n\tOn macOS 12 Monterey, the background color changes to red.\n" +
            "\tOn macOS 13 Ventura, the background color does NOT change."

        self.window.contentView?.addSubview(textField)

        view.enableTracking()

        self.window.center()

        self.window.makeKeyAndOrderFront(self)
    }

    func applicationSupportsSecureRestorableState(_ app: NSApplication) -> Bool {
        return true
    }
}
