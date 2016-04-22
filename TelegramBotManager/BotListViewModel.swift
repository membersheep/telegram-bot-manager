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
    
    // TODO: Keep an array of view models
    // TODO: If one of the cells changes (modified, created, removed), it'll create a brand new view model with all the other view models and the new one.

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