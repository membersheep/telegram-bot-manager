//
//  BotStorage.swift
//  TelegramBotManager
//
//  Created by Alessandro Maroso on 25/03/16.
//  Copyright © 2016 membersheep. All rights reserved.
//

import Foundation

protocol BotStorage {
    var storedBots: [Bot] {get}
    func saveBot(bot: Bot)
    func removeBotNamed(name: String)
}

// TODO: Create implementations with CoreData or SQLite or NSUserDefaults