//
//  BotNetworkService.swift
//  TelegramBotManager
//
//  Created by Alessandro Maroso on 04/05/16.
//  Copyright © 2016 membersheep. All rights reserved.
//

import Foundation
import Moya

struct BotNetworkService {
    static let provider = MoyaProvider<TelegramBotAPITarget>()
    
    static func request(target: TelegramBotAPITarget, successCallback: (AnyObject) -> Void, errorCallback: (statusCode: Int) -> Void, failureCallback: (Moya.Error) -> Void) {
        provider.request(target) {
            result in
            switch result {
            case let .Success(response):
                // TODO: Decode the json with the decoder and return the decoded object to the success callback
                successCallback(response.data)
                break
            case let .Failure(error):
                failureCallback(error)
            }
        }
    }
}