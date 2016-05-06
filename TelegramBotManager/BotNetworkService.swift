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
    static let provider = MoyaProvider<TelegramBotAPITarget>(plugins: [NetworkLoggerPlugin()])
    
    static func request<T: Mappable>(target: TelegramBotAPITarget, successCallback: (T) -> Void, errorCallback: (statusCode: Int) -> Void, failureCallback: (Moya.Error) -> Void) {
        provider.request(target) {
            result in
            switch result {
            case let .Success(response):
                do {
                    try response.filterSuccessfulStatusCodes()
                    let mappedObject = try response.mapObject(T)
                    successCallback(mappedObject)
                } catch Error.StatusCode(let response) {
                    errorCallback(statusCode: response.statusCode)
                } catch Error.JSONMapping(let response) {
                    failureCallback(Error.JSONMapping(response))
                } catch {
                    failureCallback(Error.Underlying(error))
                }
                break
            case let .Failure(error):
                failureCallback(error)
                break
            }
        }
    }
}