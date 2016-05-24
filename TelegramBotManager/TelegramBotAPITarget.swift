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
    case GetUserProfilePhotos(token: String, userId: String)
}

extension TelegramBotAPITarget: TargetType {
    var baseURL: NSURL {
        return NSURL(string: "https://api.telegram.org")!
    }
    var path: String {
        switch self {
        case .GetMe(let token):
            return "/bot\(token)/getMe"
        case .GetUserProfilePhotos(let token, _):
            return "/bot\(token)/getUserProfilePhotos"
        }
    }
    var method: Moya.Method {
        switch self {
        case .GetMe(_):
            return .GET
        case .GetUserProfilePhotos(_, _):
            return .GET
        }
    }
    var parameters: [String: AnyObject]? {
        switch self {
        case .GetMe(_):
            return nil
        case .GetUserProfilePhotos(_, let userId):
            return ["user_id": userId]
        }
    }
    var sampleData: NSData {
        switch self {
        case .GetMe(_):
            return "{\"ok\": true,\"result\": {\"id\": 208788398,\"first_name\": \"lollerlandia-mumble\",\"username\": \"LollerMumbleBot\"}}".UTF8EncodedData
        case .GetUserProfilePhotos(_, _):
            return "{\"ok\":true,\"result\":{\"total_count\":1,\"photos\":[[{\"file_id\":\"AgADBAADqacxG7BK2AABbo6AoxSAX90WhIQrAAROGLsaxK1dmhVeAAIC\",\"file_size\":5549,\"width\":160,\"height\":160},{\"file_id\":\"AgADBAADqacxG7BK2AABbo6AoxSAX90WhIQrAARvk4omtHiKKxZeAAIC\",\"file_size\":16573,\"width\":320,\"height\":320},{\"file_id\":\"AgADBAADqacxG7BK2AABbo6AoxSAX90WhIQrAASSqeJODoOGMxdeAAIC\",\"file_size\":47895,\"width\":640,\"height\":640},{\"file_id\":\"AgADBAADqacxG7BK2AABbo6AoxSAX90WhIQrAATp2KGoemCVWxheAAIC\",\"file_size\":50894,\"width\":800,\"height\":800}]]}}".UTF8EncodedData
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