//
//  BotListViewModel.swift
//  TelegramBotManager
//
//  Created by Alessandro Maroso on 29/03/16.
//  Copyright © 2016 membersheep. All rights reserved.
//

import Foundation

struct BotListViewModel {
    private var botStorage: BotStorage
    private var botCellViewModelList: [BotCellViewModel]

    init(botStorage: BotStorage) {
        self.botStorage = botStorage
        self.botCellViewModelList = botStorage.storedBots.map {
            BotCellViewModel(botModel:$0)
        }
    }
    
    func removeBotNamed(name: String) -> BotListViewModel {
        botStorage.removeBotNamed(name)
        return BotListViewModel(botStorage: botStorage)
    }    
}

extension BotListViewModel: CollectionType {
    typealias Index = Int
    
    var startIndex: Int {
        return 0
    }
    
    var endIndex: Int {
        return botCellViewModelList.count
    }
    
    subscript(i: Int) -> BotCellViewModel {
        return botCellViewModelList[i]
    }
}