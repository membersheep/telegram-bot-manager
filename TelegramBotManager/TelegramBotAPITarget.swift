//
//  TelegramBotAPITarget.swift
//  TelegramBotManager
//
//  Created by Alessandro Maroso on 04/05/16.
//  Copyright © 2016 membersheep. All rights reserved.
//

import Foundation
import Moya

enum TelegramBotAPITarget {
    case GetMe(token: String)
}

extension TelegramBotAPITarget: TargetType {
    var baseURL: NSURL {
        return NSURL(string: "https://api.telegram.org/bot")!
    }
    var path: String {
        switch self {
        case .GetMe(let token):
            return "/bot\(token)/getMe"
        }
    }
    var method: Moya.Method {
        switch self {
        case .GetMe(_):
            return .GET
        }
    }
    var parameters: [String: AnyObject]? {
        switch self {
        case .GetMe(_):
            return nil
        }
    }
    var sampleData: NSData {
        switch self {
        case .GetMe(_):
            return "{\"ok\": true,\"result\": {\"id\": 208788398,\"first_name\": \"lollerlandia-mumble\",\"username\": \"LollerMumbleBot\"}}".UTF8EncodedData
        }
    }
}

// MARK: - Helpers
private extension String {
    var URLEscapedString: String {
        return self.stringByAddingPercentEncodingWithAllowedCharacters(NSCharacterSet.URLHostAllowedCharacterSet())!
    }
    var UTF8EncodedData: NSData {
        return self.dataUsingEncoding(NSUTF8StringEncoding)!
    }
}