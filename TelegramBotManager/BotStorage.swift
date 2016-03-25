//
//  BotStorage.swift
//  TelegramBotManager
//
//  Created by Alessandro Maroso on 25/03/16.
//  Copyright © 2016 membersheep. All rights reserved.
//

import Foundation

protocol BotStorage {
    func getSavedBots() -> [Bot]
    func saveBot(bot: Bot)
}

// TODO: Create implementations with CoreData or SQLite or NSUserDefaults