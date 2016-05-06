//
//  Mappable.swift
//  TelegramBotManager
//
//  Created by Alessandro Maroso on 04/05/16.
//  Copyright © 2016 membersheep. All rights reserved.
//

import Foundation
import SwiftyJSON

public protocol Mappable {
    init?(jsonData:JSON)
}