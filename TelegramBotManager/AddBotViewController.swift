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
    private var botSearchViewModel: BotSearchViewModel! {
        didSet {
            reloadWithAnimation()
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
            return NSLocalizedString("BOT", comment: "BOT")
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
}

extension AddBotViewController: SearchTableViewCellDelegate {
    func searchText(text: String) {
        botSearchViewModel.searchBotWithToken(text) {
            optionalViewModel in
            guard let newModel = optionalViewModel else {
                // TODO: Trigger error alert with message or something
                print("ALERT ERROR SEARCHING BOT")
                return
            }
            self.botSearchViewModel = newModel
        }
    }
}