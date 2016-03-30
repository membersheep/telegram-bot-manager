//
//  BotStorageMock.swift
//  TelegramBotManager
//
//  Created by Alessandro Maroso on 30/03/16.
//  Copyright © 2016 membersheep. All rights reserved.
//

import Foundation
@testable import TelegramBotManager

class BotStorageMock: BotStorage {
    var storedBots: [Bot] = []
    
    func saveBot(bot: Bot) {
        storedBots.append(bot)
    }
    
    func removeBotNamed(name: String) {
        guard let index = storedBots.indexOf({$0.name == name}) else {
            return
        }
        storedBots.removeAtIndex(index)
    }
}