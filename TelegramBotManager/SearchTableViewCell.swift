//
//  TextFieldTableViewCell.swift
//  TelegramBotManager
//
//  Created by Alessandro Maroso on 03/05/16.
//  Copyright © 2016 membersheep. All rights reserved.
//

import UIKit

protocol SearchTableViewCellDelegate: class {
    func searchText(text: String)
}

class SearchTableViewCell: UITableViewCell {
    
    static let identifier = "SearchTableViewCell"
    
    @IBOutlet private weak var button: UIButton!
    @IBOutlet private weak var textField: UITextField!
    
    weak private var delegate: SearchTableViewCellDelegate?
    
    override func awakeFromNib() {
        button.backgroundColor = UIColor.lightMainColor()
    }
    
    func configure(withDelegate delegate: SearchTableViewCellDelegate) {
        self.delegate = delegate
    }
    
    @IBAction func searchButtonPressed(sender: AnyObject) {
        delegate?.searchText(textField.text ?? "")
    }
}
