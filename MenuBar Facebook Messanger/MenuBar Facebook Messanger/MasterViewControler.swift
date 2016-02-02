//
//  MasterViewControler.swift
//  MenuBar Twiter
//
//  Created by Caelen Burke on 1/17/16.
//  Copyright © 2016 Caelen Burke. All rights reserved.
//

import Cocoa
import WebKit

extension NSImage {
    class func swatchWithColor(color: NSColor, size: NSSize) -> NSImage {
        let image = NSImage(size: size)
        image.lockFocus()
        color.drawSwatchInRect(NSMakeRect(0, 0, size.width, size.height))
        image.unlockFocus()
        return image
    }
}

class MasterViewControler: NSViewController {

    
    
    @IBOutlet weak var webView: WebView!
    
    @IBOutlet weak var Quit: NSButton!

    override func viewDidLoad() {
        super.viewDidLoad()
        (Quit.cell as! NSButtonCell).bordered = false//The background color is used only when drawing borderless buttons.
        (Quit.cell as! NSButtonCell).backgroundColor = NSColor.redColor()
        
        webView.mainFrame.loadRequest(NSURLRequest(URL: NSURL(string: "https://www.messenger.com/login")!))
        Quit.action = Selector("quit:")
        
    }
    
    func quit(sender: AnyObject?) {
        exit(0)
        
    }
}
