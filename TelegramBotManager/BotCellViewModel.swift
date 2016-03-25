//
//  BotCellViewModel.swift
//  TelegramBotManager
//
//  Created by Alessandro Maroso on 25/03/16.
//  Copyright © 2016 membersheep. All rights reserved.
//

import Foundation
import UIKit

struct BotCellViewModel {
    var botModel: Bot
}

extension BotCellViewModel: TextPresentable {
    var text: String {
        return botModel.name
    }
    
    var textColor: UIColor {
        return .blackColor()
    }
    var font: UIFont {
        return .systemFontOfSize(17.0)
    }
}
