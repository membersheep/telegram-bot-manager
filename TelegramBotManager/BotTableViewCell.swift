//
//  BotTableViewCell.swift
//  TelegramBotManager
//
//  Created by Alessandro Maroso on 03/05/16.
//  Copyright © 2016 membersheep. All rights reserved.
//

import UIKit

class BotTableViewCell: UITableViewCell {
    static let identifier = "BotTableViewCell"
    
    @IBOutlet private weak var userImageView: UIImageView!
    @IBOutlet private weak var nameLabel: UILabel!
    @IBOutlet private weak var usernameLabel: UILabel!
    @IBOutlet private weak var idLabel: UILabel!
    
    func configure(withViewModel viewModel: protocol<TextPresentable, ImagePresentable>) {
//        userImageView = viewModel.imageURL
        nameLabel.text = viewModel.text
        nameLabel.textColor = viewModel.textColor
        nameLabel.font = viewModel.font
    }
}
