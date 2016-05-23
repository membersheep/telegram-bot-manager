//
//  Bot.swift
//  TelegramBotManager
//
//  Created by Alessandro Maroso on 25/03/16.
//  Copyright © 2016 membersheep. All rights reserved.
//

import Foundation
import SwiftyJSON

struct Bot {
    let name: String
    let username: String
    var token: String?
}

extension Bot: Mappable {
    init?(jsonData: JSON) {
        self.name = jsonData["result"]["first_name"].stringValue
        self.username = jsonData["result"]["username"].stringValue
    }
}