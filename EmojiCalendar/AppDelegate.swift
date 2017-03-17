//
//  AppDelegate.swift
//  EmojiCalendar
//
//  Created by Jan on 17/03/2017.
//  Copyright © 2017 Primlo. All rights reserved.
//

import Cocoa

let EMOJIS = ["🐛", "🏕", "🦎", "🍓", "👥", "🦍", "🏀", "🐊", "🔝", "👻", "🌖", "💎", "🎒", "🏮", "👐", "🐌", "💂", "🍡", "🍉", "🍄", "🐘", "🕌", "🌾", "😸", "🌵", "🌈", "💧", "👅", "🤠", "🐸", "📣", "💪", "🐆", "🐚", "🎹", "👹", "☘️", "🚄", "🦊", "⚓️", "🌹", "🤖", "👺", "⛩", "🐫", "✈️", "⛪️", "🦆", "🐹", "🏳️‍", "🙏", "🍪", "🎁", "🍮", "🐔", "🇬🇧", "🚠", "🚎", "🍭", "👾", "🐨", "🍁", "🇨🇳", "🌻", "☄️", "😊", "🐽", "😀", "🐄", "🌏", "🗿", "🌈", "🔜", "🍿", "🎃", "🎲", "🍶", "🐍", "🖖", "🥒", "😶", "🕵", "🍔", "🐧", "🍣", "📖", "🦇", "🐼", "🎩", "🦋", "🐒", "👀", "🌤", "🈚️", "🇺🇸", "🌊", "🌿", "🎼", "🔙", "✨", "🌺", "🐉", "🐾", "👩‍", "👁", "🤥", "🤙", "⭐️", "🐝", "👣", "🎈", "🐞", "🤳", "🇪🇺"]

@NSApplicationMain
class AppDelegate: NSObject, NSApplicationDelegate {
    
    var statusBarItem: NSStatusItem!
    
    func applicationDidFinishLaunching(_ aNotification: Notification) {
        statusBarItem = NSStatusBar.system().statusItem(withLength: -1)
        statusBarItem.target = self
        statusBarItem.action = #selector(iconClicked(sender:))
        
        if let currentEmoji = UserDefaults.standard.object(forKey: "com.primlo.emojicalendar.emoji") as? Int {
            changeEmoji(index: currentEmoji)
        } else {
            changeToTodaysEmoji()
        }
    }
    
    func changeToTodaysEmoji() {
        let date = Date()
        let cal = Calendar.current
        guard let day = cal.ordinality(of: .day, in: .year, for: date) else {
            return
        }
        
        changeEmoji(index: day)
        UserDefaults.standard.set(day, forKey: "com.primlo.emojicalendar.emoji")
    }
    
    func changeEmoji(index: Int) {
        statusBarItem.title = EMOJIS[index % EMOJIS.count]
    }
    
    func iconClicked(sender: Any) {
        changeToTodaysEmoji()
    }
}
