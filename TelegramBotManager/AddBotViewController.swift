//
//  AddBotViewController.swift
//  TelegramBotManager
//
//  Created by Alessandro Maroso on 03/05/16.
//  Copyright © 2016 membersheep. All rights reserved.
//

import UIKit

protocol AddBotViewControllerDelegate {
    func dismissiActionPerformed()
}

class AddBotViewController: UIViewController {
    static let identifier = "AddBotViewController"
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var addButton: UIButton!
    
    private var botSearchViewModel: BotSearchViewModel! {
        didSet {
            reloadWithAnimation()
            updateAddButton()
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.tableView.registerNib(UINib(nibName: SearchTableViewCell.identifier, bundle:nil), forCellReuseIdentifier: SearchTableViewCell.identifier)
        self.tableView.registerNib(UINib(nibName: BotTableViewCell.identifier, bundle:nil), forCellReuseIdentifier: BotTableViewCell.identifier)
        self.view.backgroundColor = UIColor.mainColor()
    }
    
    func reloadWithAnimation() {
        guard let unwrappedTableView = tableView else {
            return
        }
        let range = NSMakeRange(0, unwrappedTableView.numberOfSections)
        let sections = NSIndexSet(indexesInRange: range)
        unwrappedTableView.reloadSections(sections, withRowAnimation: .Automatic)
    }
    
    func updateAddButton() {
        addButton?.hidden = botSearchViewModel.botCellViewModel == nil
    }
    
    @IBAction func addButtonPressed(sender: AnyObject) {
        // TODO: Store current bot
        print("ADD")
    }
}

extension AddBotViewController: Injectable {
    func inject(botSearchViewModel: BotSearchViewModel) {
        self.botSearchViewModel = botSearchViewModel;
    }
    
    func assertDependencies() {
        assert(botSearchViewModel != nil, "View model must be set when displaying this controller")
        assert(tableView != nil, "Table view must be set")
        assert(tableView.delegate != nil, "Table view should have a delegate set")
        assert(tableView.dataSource != nil, "Table view should have a data source set")
    }
}

extension AddBotViewController: UITableViewDataSource {
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 2
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        switch section {
        case 0:
            return 1
        default:
            return (botSearchViewModel.botCellViewModel != nil) ? 1 : 0
        }
    }
        
    func tableView(tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        switch section {
        case 0:
            return NSLocalizedString("TOKEN", comment: "TOKEN")
        default:
            return (botSearchViewModel.botCellViewModel != nil) ? NSLocalizedString("BOT", comment: "BOT") : ""
        }
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        switch indexPath.section {
        case 0:
            let cell = tableView.dequeueReusableCellWithIdentifier(SearchTableViewCell.identifier, forIndexPath: indexPath) as! SearchTableViewCell
            cell.configure(withDelegate: self)
            return cell
        default:
            let cell = tableView.dequeueReusableCellWithIdentifier(BotTableViewCell.identifier, forIndexPath: indexPath) as! BotTableViewCell
            cell.configure(withViewModel: botSearchViewModel.botCellViewModel!)
            return cell
        }
    }
}

extension AddBotViewController: UITableViewDelegate {
    func tableView(tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        return 0
    }
    
    func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        // TODO: Find a better way to extract the height value from the cell.
        switch indexPath.section {
        case 0:
            return tableView.rowHeight
        default:
            return 82.0
        }
    }
}

extension AddBotViewController: SearchTableViewCellDelegate {
    func searchText(text: String) {
        botSearchViewModel.searchBotWithToken(text) {
            optionalViewModel in
            guard let newModel = optionalViewModel else {
                // TODO: Trigger error alert with message or something
                print("ALERT ERROR SEARCHING BOT")
                self.botSearchViewModel = BotSearchViewModel(botCellViewModel: nil)
                return
            }
            self.botSearchViewModel = newModel
        }
    }
}