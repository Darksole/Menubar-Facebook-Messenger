//
//  AppDelegate.swift
//  MenuBar Twiter
//
//  Created by Caelen Burke on 1/17/16.
//  Copyright © 2016 Caelen Burke. All rights reserved.
//

import Cocoa
import WebKit

@NSApplicationMain
class AppDelegate: NSObject, NSApplicationDelegate {

    @IBOutlet weak var window: NSWindow!

    let statusItem = NSStatusBar.systemStatusBar().statusItemWithLength(NSVariableStatusItemLength)
    let popup = NSPopover()
    
    
    func applicationDidFinishLaunching(aNotification: NSNotification) {
        // Insert code here to initialize your application
        if let statusButton = statusItem.button {
            statusButton.image = NSImage(named: "StatusIcon")
            statusButton.action = Selector("togglePopover:")
            
            
        }
        
        popup.contentViewController = MasterViewControler(nibName: "MasterViewControler", bundle: nil)
    }

    func applicationWillTerminate(aNotification: NSNotification) {
        // Insert code here to tear down your application
    }

    func showPopover(sender: AnyObject?) {
        if let button = statusItem.button {
            popup.showRelativeToRect(button.bounds, ofView: button, preferredEdge: NSRectEdge.MinY)
        }
    }
    
    func closePopover(sender: AnyObject?) {
        popup.performClose(sender)
    }
    
    func togglePopover(sender: AnyObject?) {
        if popup.shown {
            closePopover(sender)
        } else {
            showPopover(sender)
        }
    }
    

}

