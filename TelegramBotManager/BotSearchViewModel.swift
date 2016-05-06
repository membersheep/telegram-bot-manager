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
    
    func searchBotWithToken(token: String, completionCallback: (BotSearchViewModel?) -> Void) {
        BotNetworkService.request(TelegramBotAPITarget.GetMe(token: token),
                                  successCallback: {
                                    (bot: Bot) -> Void in
                                    let botModel = Bot(name: bot.name, username: bot.username, token: token)
                                    let botCellViewModel = BotCellViewModel(botModel: botModel)
                                    let botSearchViewModel = BotSearchViewModel(botCellViewModel: botCellViewModel)
                                    completionCallback(botSearchViewModel)
            },
                                  errorCallback: {
                                    statusCode in
                                    print(statusCode)
                                    completionCallback(nil)
            },
                                  failureCallback: {
                                    error in
                                    print(error)
                                    completionCallback(nil)
        });
    }
}