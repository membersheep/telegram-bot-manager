//
//  BotListTableViewCell.swift
//  TelegramBotManager
//
//  Created by Alessandro Maroso on 29/03/16.
//  Copyright © 2016 membersheep. All rights reserved.
//

import Foundation
import UIKit

class BotListTableViewCell: UITableViewCell {
    
    static let identifier = "BotListTableViewCell"
    
    @IBOutlet private weak var label: UILabel!
    
    private var delegate: TextPresentable?
    
    func configure(withViewModel viewModel: TextPresentable) {
        delegate = viewModel
        label.text = viewModel.text
    }
    
}