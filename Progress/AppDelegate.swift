//
//  AppDelegate.swift
//  Progress
//
//  Created by Wrappers Zhang on 2019/4/9.
//  Copyright © 2019 Wrappers. All rights reserved.
//

import Cocoa
import SwiftDate

@NSApplicationMain
class AppDelegate: NSObject, NSApplicationDelegate {

    let statusItem = NSStatusBar.system.statusItem(withLength: NSStatusItem.variableLength)
    
    func applicationDidFinishLaunching(_ aNotification: Notification) {
        updateDayPercentage()
    }
    
    func applicationWillUpdate(_ notification: Notification) {
        updateDayPercentage()
    }
    
    func applicationWillTerminate(_ aNotification: Notification) {
        // Insert code here to tear down your application
    }
    
}

extension AppDelegate {
    func updateDayPercentage() {
        let now = Date();
        let endOfDay = DateInRegion().dateAt(.endOfDay).date
        let components = NSCalendar.current.dateComponents([.minute], from: now, to: endOfDay)
        let percentage = (Double(components.minute ?? 0)) / (24 * 60) * 100
        statusItem.button?.title = "今天还剩下\(String(format: "%.6f", percentage))%";
    }
}
