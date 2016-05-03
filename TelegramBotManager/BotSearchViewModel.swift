//
//  BotSearchViewModel.swift
//  TelegramBotManager
//
//  Created by Alessandro Maroso on 03/05/16.
//  Copyright © 2016 membersheep. All rights reserved.
//

import Foundation

struct BotSearchViewModel {
    let botCellViewModel: BotCellViewModel?
    
    func searchBotWithToken(token: String) -> BotSearchViewModel{
        // TODO: Search with APIs
        // Take the returned value and wrap it in the proper structs
        return BotSearchViewModel(botCellViewModel: BotCellViewModel(botModel: Bot(name: "test", token: "test")))
    }
}