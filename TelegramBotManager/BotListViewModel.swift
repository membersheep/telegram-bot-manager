//
//  BotListViewModel.swift
//  TelegramBotManager
//
//  Created by Alessandro Maroso on 29/03/16.
//  Copyright © 2016 membersheep. All rights reserved.
//

import Foundation

struct BotListViewModel {
    
    var botStorage: BotStorage
    
    var botList: [BotCellViewModel] {
        return botStorage.storedBots.map {
            BotCellViewModel(botModel:$0)
        }
    }
    
    func removeBotNamed(name: String) -> BotListViewModel {
        botStorage.removeBotNamed(name)
        return self
    }
}