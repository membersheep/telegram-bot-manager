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
        guard let dictionary = defaults.dictionaryForKey(BOT_DICTIONARY_KEY) as? [String: String] else {
            return []
        }
        return dictionary.map{ key, value in
            Bot(name: key, token: value)
        }
    }
    
    func saveBot(bot: Bot) {
        if var unwrappedDictionary = defaults.dictionaryForKey(BOT_DICTIONARY_KEY) as? [String: String] {
            unwrappedDictionary[bot.name] = bot.token
            defaults.setObject(unwrappedDictionary, forKey: BOT_DICTIONARY_KEY)
        } else {
            defaults.setObject(NSDictionary(dictionary: [bot.name:bot.token]), forKey: BOT_DICTIONARY_KEY)
        }
        defaults.synchronize()
    }
    
    func removeBotNamed(name: String) {
        if var unwrappedDictionary = defaults.dictionaryForKey(BOT_DICTIONARY_KEY) as? [String: String] {
            unwrappedDictionary.removeValueForKey(name)
            defaults.setObject(unwrappedDictionary, forKey: BOT_DICTIONARY_KEY)
        }
        defaults.synchronize()
    }
}
