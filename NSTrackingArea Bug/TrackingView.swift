//
//  TrackingView.swift
//  NSTrackingArea Bug
//
//  Created by John Siracusa on 11/9/22.
//

import Cocoa
import Foundation

class TrackingView : NSView {
    var trackingArea : NSTrackingArea?

    func enableTracking() {
        self.trackingArea = NSTrackingArea(
             rect: self.bounds,
             options: [ .mouseEnteredAndExited, .enabledDuringMouseDrag, .activeAlways ],
             owner: self,
             userInfo: nil
         )

         self.addTrackingArea(self.trackingArea!)
    }

    override func mouseEntered(with event: NSEvent) {
        NSLog("mouseEntered")
        //self.window?.title = "mouseEntered"
        self.window?.backgroundColor = .red
    }

    override func mouseExited(with event: NSEvent) {
        NSLog("mouseExited")
        //self.window?.title = "mouseExited"
        self.window?.backgroundColor = .windowBackgroundColor
    }
}
