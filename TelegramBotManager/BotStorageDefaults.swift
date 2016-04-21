//
//  BotStorageDefaults.swift
//  TelegramBotManager
//
//  Created by Alessandro Maroso on 25/03/16.
//  Copyright © 2016 membersheep. All rights reserved.
//

import Foundation

struct BotStorageDefaults: BotStorage {
    private let BOT_DICTIONARY_KEY = "botDictionaryKey";
    private let defaults = NSUserDefaults.standardUserDefaults()
    
    var storedBots: [Bot] {
        let dictionary = defaults.dictionaryForKey(BOT_DICTIONARY_KEY) as? [String: String] ?? [:]
        return dictionary.map{ key, value in
            Bot(name: key, token: value)
        }
    }
    
    func saveBot(bot: Bot) {
        var dictionary = defaults.dictionaryForKey(BOT_DICTIONARY_KEY) as? [String: String] ?? [:]
        dictionary[bot.name] = bot.token
        defaults.setObject(dictionary, forKey: BOT_DICTIONARY_KEY)
        defaults.synchronize()
    }
    
    func removeBotNamed(name: String) {
        var dictionary = defaults.dictionaryForKey(BOT_DICTIONARY_KEY) as? [String: String] ?? [:]
        dictionary.removeValueForKey(name)
        defaults.setObject(dictionary, forKey: BOT_DICTIONARY_KEY)
        defaults.synchronize()
    }
}
